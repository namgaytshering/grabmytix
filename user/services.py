import stripe
from django.conf import settings

stripe.api_key = settings.STRIPE_SECRET_KEY


class StripeConnectService:
    """
    Service class for managing Stripe Connect Custom accounts.
    """

    # ------------------------------------------------------------------
    # 1. Create a Custom Connect Account
    # ------------------------------------------------------------------
    @staticmethod
    def create_account(user, ip_address: str) -> stripe.Account:
        """
        Creates a Stripe Custom Connect account for a user.
        Call this when a user signs up as a seller/service provider.
        """
        account = stripe.Account.create(
            type="custom",
            country="US",
            email=user.email,
            capabilities={
                "card_payments": {"requested": True},
                "transfers": {"requested": True},
            },
            tos_acceptance={
                "date": int(__import__("time").time()),
                "ip": ip_address,
            },
            business_type="individual",  # or "company"
        )
        return account

    # ------------------------------------------------------------------
    # 2. Update Account with KYC Information
    # ------------------------------------------------------------------
    @staticmethod
    def update_account_individual(stripe_account_id: str, data: dict) -> stripe.Account:
        """
        Submits KYC info for an individual.

        Expected data keys:
            first_name, last_name, dob_day, dob_month, dob_year,
            address_line1, address_city, address_state, address_postal_code,
            ssn_last_4 (or id_number for full SSN),
            phone
        """
        account = stripe.Account.modify(
            stripe_account_id,
            individual={
                "first_name": data["first_name"],
                "last_name": data["last_name"],
                "dob": {
                    "day": data["dob_day"],
                    "month": data["dob_month"],
                    "year": data["dob_year"],
                },
                "address": {
                    "line1": data["address_line1"],
                    "city": data["address_city"],
                    "state": data["address_state"],
                    "postal_code": data["address_postal_code"],
                    "country": "US",
                },
                "ssn_last_4": data.get("ssn_last_4"),  # Use id_number for full SSN
                "phone": data.get("phone"),
                "email": data.get("email"),
            },
        )
        return account

    # ------------------------------------------------------------------
    # 3. Upload Identity Document (ID Verification)
    # ------------------------------------------------------------------
    @staticmethod
    def upload_identity_document(stripe_account_id: str, file_obj) -> str:
        """
        Uploads an ID document (passport, driver's license) to Stripe.
        Returns the Stripe file ID to attach to the account.

        file_obj: an opened file-like object (e.g., from request.FILES)
        """
        stripe_file = stripe.File.create(
            purpose="identity_document",
            file=file_obj,
            stripe_account=stripe_account_id,
        )

        # Attach document to account
        stripe.Account.modify(
            stripe_account_id,
            individual={
                "verification": {
                    "document": {
                        "front": stripe_file.id,
                    }
                }
            },
        )
        return stripe_file.id

    # ------------------------------------------------------------------
    # 4. Add External Bank Account (for Payouts)
    # ------------------------------------------------------------------
    @staticmethod
    def add_bank_account(stripe_account_id: str, bank_token: str) -> stripe.BankAccount:
        """
        Adds a bank account to the connected account for payouts.

        bank_token: obtained from Stripe.js on the frontend using
                    stripe.createToken('bank_account', {...})
        """
        bank_account = stripe.Account.create_external_account(
            stripe_account_id,
            external_account=bank_token,
        )
        return bank_account

    # ------------------------------------------------------------------
    # 5. Retrieve Account & Requirements
    # ------------------------------------------------------------------
    @staticmethod
    def get_account(stripe_account_id: str) -> stripe.Account:
        """Fetch the latest account details including requirements."""
        return stripe.Account.retrieve(stripe_account_id)

    @staticmethod
    def get_requirements(stripe_account_id: str) -> dict:
        """
        Returns a dict of what Stripe still needs from this account.
        Use this to guide users through completing their profile.
        """
        account = stripe.Account.retrieve(stripe_account_id)
        return {
            "currently_due": account.requirements.currently_due,
            "eventually_due": account.requirements.eventually_due,
            "past_due": account.requirements.past_due,
            "disabled_reason": account.requirements.disabled_reason,
            "charges_enabled": account.charges_enabled,
            "payouts_enabled": account.payouts_enabled,
        }

    # ------------------------------------------------------------------
    # 6. Create a Charge with Application Fee (Platform takes a cut)
    # ------------------------------------------------------------------
    @staticmethod
    def create_charge(
        amount: int,
        currency: str,
        source: str,
        stripe_account_id: str,
        application_fee_amount: int,
        description: str = "",
    ) -> stripe.Charge:
        """
        Creates a charge on the connected account.
        The platform keeps application_fee_amount (in cents).

        Example: charge $100, platform keeps $5:
            amount=10000, application_fee_amount=500
        """
        charge = stripe.Charge.create(
            amount=amount,
            currency=currency,
            source=source,
            description=description,
            application_fee_amount=application_fee_amount,
            stripe_account=stripe_account_id,
        )
        return charge

    # ------------------------------------------------------------------
    # 7. Create a PaymentIntent (modern approach, recommended)
    # ------------------------------------------------------------------
    @staticmethod
    def create_payment_intent(
        amount: int,
        currency: str,
        stripe_account_id: str,
        application_fee_amount: int,
    ) -> stripe.PaymentIntent:
        """
        Modern way to accept payments with Connect.
        Use this instead of Charges for new integrations.
        """
        payment_intent = stripe.PaymentIntent.create(
            amount=amount,
            currency=currency,
            application_fee_amount=application_fee_amount,
            stripe_account=stripe_account_id,
        )
        return payment_intent

    # ------------------------------------------------------------------
    # 8. Transfer Funds to Connected Account
    # ------------------------------------------------------------------
    @staticmethod
    def transfer_to_account(
        amount: int,
        currency: str,
        stripe_account_id: str,
        description: str = "",
    ) -> stripe.Transfer:
        """
        Transfers funds from your platform balance to a connected account.
        Use this for separate charges & transfers flow.
        """
        transfer = stripe.Transfer.create(
            amount=amount,
            currency=currency,
            destination=stripe_account_id,
            description=description,
        )
        return transfer

    # ------------------------------------------------------------------
    # 9. Manual Payout (trigger a payout for the connected account)
    # ------------------------------------------------------------------
    @staticmethod
    def create_payout(
        amount: int,
        currency: str,
        stripe_account_id: str,
    ) -> stripe.Payout:
        """
        Manually triggers a payout to the connected account's bank.
        Only needed if you set payout schedule to manual.
        """
        payout = stripe.Payout.create(
            amount=amount,
            currency=currency,
            stripe_account=stripe_account_id,
        )
        return payout
