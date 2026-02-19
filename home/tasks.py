from django.core.mail import send_mail
from django.conf import settings
def send_payment_success_email(user_email, amount):
    send_mail(
        subject='Payment Successful! ',
        message=f'Thank you! Your payment of ${amount} was successful.',      
        from_email= settings.EMAIL_HOST_USER,             # From email
        recipient_list=[user_email],             # Recipient list
        fail_silently=False,
    )
    print(f"✅ Email sent to {user_email}")
    return f"Email sent to {user_email}"