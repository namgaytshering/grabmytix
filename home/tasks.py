from django.core.mail import send_mail
from django.conf import settings
from django.core.mail import EmailMultiAlternatives
from django.template.loader import render_to_string
def send_payment_success_email(booking):
    # send_mail(
    #     subject='Payment Successful! ',
    #     message=f'Thank you! Your payment of ${amount} was successful.',      
    #     from_email= settings.EMAIL_HOST_USER,             # From email
    #     recipient_list=[user_email],             # Recipient list
    #     fail_silently=False,
    # )
    subject = 'Thank You – Your booking confirmation - '+booking.title
    from_email = None
    recipient_list = ['namgay2340@gmail.com']
    # qr_data = f"{booking.id}"   # You can encode URL or JSON too
    # qr = qrcode.make(qr_data)

    # # Save QR code to bytes
    # qr_io = BytesIO()
    # qr.save(qr_io, format='PNG')
    # qr_content = qr_io.getvalue()
    # Render HTML template with dynamic context
    context = {
        'no': booking.id,
        'no_adult':booking.no_adult,
         
        'email':['namgay2340@gmail.com'],
        'title': booking.title,
         
        'show_date':booking.show_date,
        'show_time':booking.show_time,
        'theater_name':booking.theater_name,
    }
    
    html_message = render_to_string("home/ticket_email.html", context)

    # Fallback plain text version
    plain_message = "Thank you for your payment. Your session ID is: ss"

    # send_mail(
    #     subject,
    #     plain_message,  # plain text fallback
    #     from_email,
    #     recipient_list,
    #     fail_silently=False,
    #     html_message=html_message,  # ✅ HTML body
    # )
    email = EmailMultiAlternatives(
        subject=subject,
        body=plain_message,       # fallback text
        from_email=from_email,
        to=recipient_list
    )

    # --- Add HTML version ---
    email.attach_alternative(html_message, "text/html")

    # --- Attach QR image ---
    #email.attach('ticket_qrcode.png', qr_content, 'image/png')

    # --- Send email ---
    email.send(fail_silently=False)
    