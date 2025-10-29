from django.shortcuts import render,redirect,get_object_or_404
from db.models import *
import qrcode
from io import BytesIO
import base64
from .forms import LoginForm,RegistrationForm,TicketCheckoutForm,TicketEventCheckoutForm
from django.contrib.auth import authenticate, login,login, logout
import string
from django.utils.text import slugify
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
import random
from django.http import JsonResponse
import json
import stripe
from django.conf import settings
from django.views.decorators.csrf import csrf_exempt
from django.views import View
from collections import defaultdict
from django.db.models import Count
from django.http import HttpResponse
from datetime import datetime
from itertools import chain
from django.utils import timezone
from datetime import datetime, time,date
from django.core.mail import send_mail
from django.core.mail import EmailMultiAlternatives
from django.template.loader import render_to_string
from django.utils import timezone
from zoneinfo import ZoneInfo

stripe.api_key = settings.STRIPE_SECRET_KEY

#compare local time with event time
def get_event_datetime_local(event):
     # Combine date + time into naive datetime
    naive_dt = datetime.combine(event.show_date, event.show_time)

    tz_key = (event.state.time_zone or "").strip()  # remove whitespace, handle None
    try:
        tz = ZoneInfo(tz_key)
    except Exception:
        tz = ZoneInfo("UTC")  # fallback

    # Make it timezone-aware
    event_time_local = naive_dt.replace(tzinfo=tz)

    # Current time in that tz
    now_local = datetime.now(tz)

    return event_time_local <= now_local

#compare time with movies
def get_movie_datetime_local(flimshow):
     # Combine date + time into naive datetime
    if not flimshow.show_date or not flimshow.show_time:
        return True  # consider expired if incomplete
    
    # Combine date + time into a naive datetime
    naive_dt = datetime.combine(flimshow.show_date, flimshow.show_time)
    print(flimshow.state.time_zone)
    # Determine timezone
    tz_key = (flimshow.state.time_zone or "").strip()
    try:
        tz = ZoneInfo(tz_key)
    except Exception:
        tz = ZoneInfo("UTC")  # fallback if invalid or missing

    # Make timezone-aware datetime
    flimshow_time_local = naive_dt.replace(tzinfo=tz)

    # Current time in that timezone
    now_local = datetime.now(tz)
    print(tz)
    print(flimshow_time_local)
    print(now_local)
    # Compare
    is_expired = flimshow_time_local <= now_local

    return is_expired

def home_view(request):
    now = timezone.now() 
    movies = Film.objects.annotate(filmshow_count=Count('filmshow')).filter(filmshow_count__gt=0,).order_by('-created_at') # filmshow__show_date__gte=now.date()
    events = Event.objects.all().order_by('-created_at','-show_date')
    upcoming = Filmshow.objects.all().select_related('film').order_by('state', 'show_date', 'show_time')
    #filter(show_date__gte=now.date())
    context = {'movies':movies,'events':events,'upcomings':upcoming}
    return render(request, 'home/index.html',context)

def about_view(request):
     

    
    return render(request, 'home/about.html') 
    
def login_view(request):
    form = LoginForm(request.POST or None)
    if request.method == "POST":
        if form.is_valid():
            email = form.cleaned_data.get('email')
            password = form.cleaned_data.get('password')
            user = authenticate(request, username=email, password=password)
       
            if user is not None:
                login(request, user)
                return redirect('dashboard') # Redirect to a dashboard or home page
            else:
                form.add_error(None, "Invalid email or password")
            

    context ={'form': form}
    return render(request, 'home/login.html',context)

def register_view(request):
    if request.user.is_authenticated:
        if hasattr(request.user, 'is_owner') and request.user.is_owner:
            return redirect('/owner')
        if hasattr(request.user, 'is_user') and request.user.is_user:
            return redirect("/")

    form = RegistrationForm(request.POST or None)
    if request.method == "POST":
        if form.is_valid():
            try:
                meme = form.save(commit=False)
                news_slug = slugify(request.POST['name'])
                
                # Check if slug exists and modify if necessary
                if User.object.filter(slug=news_slug).exists():
                    news_slug = "{slug}-{randstr}".format(
                        slug=news_slug,
                        randstr=''.join(random.choices(string.ascii_lowercase + string.digits, k=4))
                    )

                meme.slug = news_slug
                meme.username = news_slug  # Set username to the generated slug
                
                if hasattr(meme, 'is_owner') and meme.is_owner:
                    meme.is_user = False
                
                meme.save()

                subject = "Welcome to GrabMyTix!"
                from_email =  None
                to = [meme.email]

                text_content = """
                    Hi there,

                    Thank you for registering with GrabMyTix! We're excited to have you on board.

                    You can now explore events, book tickets, and enjoy exclusive updates directly from our platform.

                    If you have any questions or need assistance, feel free to reach out to us at support@grabmytix.com.

                    Happy booking!

                    Best regards,
                    The GrabMyTix Team
                    """

                html_content = """
                <html>
                    <body style="font-family: Arial, sans-serif; color:#333;">
                        <p>Hi there,</p>
                        <p>Thank you for registering with <strong>GrabMyTix</strong>! We're excited to have you on board.</p>
                        <p>You can now explore events, book tickets, and enjoy exclusive updates directly from our platform.</p>
                        <p>If you have any questions or need assistance, feel free to reach out to us at 
                        0451081907 / 0433814363 </p>
                        <p style="margin-top:20px;">Happy booking!<br>The GrabMyTix Team</p>
                    </body>
                </html>
                """

                msg = EmailMultiAlternatives(subject, text_content, from_email, to)
                msg.attach_alternative(html_content, "text/html")
                msg.send() 

                messages.success(request, "Successfully registered. Please log in now.")
                return redirect('/login')

            except Exception as e:
                messages.error(request, "Something went wrong, please try again."+str(e))

    return render(request, "home/register.html", {'form': form})

def moviedetail_view(request,slug_text):
    #form = TicketCheckoutForm(request.POST or None)
    
    movie = get_object_or_404(Film, slug=slug_text)
    
    shows = Filmshow.objects.filter(film = movie).order_by('show_date','show_time')
    # if request.user.is_authenticated:
    #     name = request.user.name
    
    #     email = request.user.email
    #     phone = request.user.phone
    # else:
    #     name = ''
    
    #     email = ''
    #     phone = ''
    # filmshow_count = shows.count()
    # if filmshow_count == 1:
    #     show= shows.first()
    #     return redirect('state_moviedetail_view', slug_text=show.film.slug, state=show.state, id=show.id)
    return render(request, 'home/moviedetail.html',{'movie':movie, 'shows':shows})

#for signel movie
def state_moviedetail_view(request,slug_text): 
     
    if request.user.is_authenticated:
        name = request.user.name
    
        email = request.user.email
        phone = request.user.phone
    else:
        name = ''
    
        email = ''
        phone = ''
     
    filmshow =  Filmshow.objects.get(slug =slug_text)
    
    movie =Film.objects.get(slug =filmshow.film.slug)

    form = TicketCheckoutForm(request.POST or None, initial={'full_name':name,'email':email,'phone':phone})

    if request.method == "POST":
        try:    
         
            if form.is_valid():
          
                no_adult = form.cleaned_data.get("no_adult")
                no_child = form.cleaned_data.get("no_child")

                filmshow = Filmshow.objects.get(slug =slug_text)
                total_cost = (no_adult * filmshow.adult) 
                #+ (no_child * filmshow.child) 
                saveform = form.save(commit=False)
                if request.user.is_authenticated:
                    saveform.user = request.user
                saveform.title = movie.title
                 
                saveform.poster_image = movie.poster_image

                saveform.film = movie
                saveform.price_adult = filmshow.adult
                saveform.price_child = filmshow.child
                saveform.filmshow = filmshow
                saveform.show_date = filmshow.show_date
                saveform.show_time = filmshow.show_time
                saveform.theater_name = filmshow.theater_name
                saveform.country = filmshow.country
                saveform.currency = filmshow.currency
                saveform.state = filmshow.state
                saveform.street= filmshow.street
                saveform.total_payment = total_cost
                saveform.type = 'Movie'
                saveform.save()
                
                messages.success(request, "Successfully booked the ticket. Now proceed with payment to confirm your ticket.")
                return redirect('payment_view', id=saveform.id)

        except Exception as e:
                messages.error(request, "Something happened, please try again" +str(e))
    is_expired = get_movie_datetime_local(filmshow)
    return render(request, 'home/booking.html',{'movie':movie,'form':form,'filmshow':filmshow,'is_expired':is_expired})


def eventdetail_view(request,slug_text):
    event = Event.objects.get(slug=slug_text)
    is_expired = False

    
    if request.user.is_authenticated:
        name = request.user.name
    
        email = request.user.email
        phone = request.user.phone
    else:
        name = ''
    
        email = ''
        phone = ''
    form = TicketEventCheckoutForm(request.POST or None,initial={'full_name':name,'email':email,'phone':phone})
    if request.method == "POST":
        try:    
         
      
            if form.is_valid():
             
                #no_adult = form.cleaned_data.get("general_quantity")
                
                economy_quantity = form.cleaned_data.get("economy_quantity") or 0
                # General tickets
                general_quantity = form.cleaned_data.get("general_quantity") or 0
                # VIP tickets
                vip_quantity = form.cleaned_data.get("vip_quantity") or 0

                # Calculate total cost
                total_cost = (
                   
                    economy_quantity * (event.economy_price or 0) +
                    general_quantity * (event.price or 0) +
                    vip_quantity * (event.vip_price or 0)
                )

               # total_cost = (no_adult * event.price)
                saveform = form.save(commit=False)
                if request.user.is_authenticated:
                    saveform.user = request.user
                saveform.event = event
                saveform.type = 'Event'
                saveform.price_adult = event.price
                saveform.no_adult = general_quantity
                
                #save other level of tickets
                saveform.economy_label = event.economy_label  
                saveform.economy_price = event.economy_price  
                 

                saveform.general_label = event.general_label  
                saveform.general_price = event.price  
                

                saveform.vip_label = event.vip_label  
                saveform.vip_price = event.vip_price  
              
                        
                saveform.show_date = event.show_date
                saveform.show_time = event.show_time
                saveform.title = event.title
                saveform.poster_image = event.poster_image

                saveform.total_payment = total_cost
                saveform.country = event.country
                saveform.currency = event.currency
                saveform.state = event.state
                saveform.street= event.street
                saveform.theater_name = event.place
                if event.price == 0:
                    saveform.payment_status = 1
                saveform.save()

                if event.price == 0:
                    send_payment_success_email(saveform)
                # send_mail(
                #     'We received your booking for '+ str(saveform.title),                 # Subject
                #     'Thank you for booking with grabmytix and your booking for '+str(saveform.title)+'number is '+ str(saveform.id)+", Please proceed Thank you",         # Message body
                #     settings.EMAIL_HOST_USER,             # From email
                #     [saveform.email],             # Recipient list
                #     fail_silently=False,
                # )
                messages.success(request, "Successfully booked the ticket. Now proceed with payment to confirm your ticket.")
                return redirect('payment_view', id=saveform.id)
            else:
                print(form.errors)
        except Exception as e:
            messages.error(request, "Something happened, please try again" +str(e))
    

    # Check if expired
    is_expired = get_event_datetime_local(event)
  
    context= {'event':event,'form':form,'is_expired':is_expired}
    return render(request, 'home/eventdetail.html',context)

def movies_view(request):
    now = timezone.now() 
    upcoming = Filmshow.objects.all().select_related('film').order_by('state', 'show_date', 'show_time')
    
    context = {'upcomings':upcoming}
    return render(request, 'home/movies.html',context)

def events_view(request):
    events = Event.objects.all().order_by('-created_at')
    context = {'events':events}
    return render(request, 'home/events.html',context)

def view_ticket_view(request):
    ticket_number = request.GET.get('ticket_number')
    email = request.GET.get('email')
    booking = None
    error_message = ''
    qr_code_base64 = None  # Will hold the QR code image

    if ticket_number and email:
        try:
            ticket_number = int(ticket_number)
        except (TypeError, ValueError):
            ticket_number = None
        
        bookings = Booking.objects.filter(id=ticket_number, email=email)
        if bookings.exists():
            booking = bookings.first()
            
            # Generate QR code for this ticket
           # qr_data = f"https://www.grabmytix.com/user/booking/tickets/e/{booking.event.id}?booking_id={booking.id}"  # or any unique data
            qr_data = str(booking.id)
            qr = qrcode.QRCode(
                version=1,
                error_correction=qrcode.constants.ERROR_CORRECT_L,
                box_size=6,
                border=4,
            )
            qr.add_data(qr_data)
            qr.make(fit=True)
            img = qr.make_image(fill_color="black", back_color="white")

            # Convert image to base64 so it can be embedded in HTML
            buffer = BytesIO()
            img.save(buffer, format="PNG")
            buffer.seek(0)
            qr_code_base64 = base64.b64encode(buffer.getvalue()).decode()
        else:
            error_message = "Ticket not found. Please check your ticket number and email."

    return render(
        request, 
        'home/download_ticket.html', 
        {
            'booking': booking,
            'ticket_number': ticket_number,
            'email': email,
            'qr_code_base64': qr_code_base64,
            'error_message': error_message
        }
    )
    
def payment_view(request,id,*args, **kwargs):
    total_cost = 0
    booking = Booking.objects.get(id=id)
    if booking.type == "Event":
        is_expired = get_event_datetime_local(booking.event)
        total_cost = (booking.economy_price * booking.economy_quantity) +  (booking.general_price * booking.general_quantity)+  (booking.vip_price * booking.vip_quantity)
    elif booking.type == "Movie":
        is_expired = get_movie_datetime_local(booking.filmshow)
        total_cost = (booking.no_adult * booking.price_adult) +  (booking.no_child * booking.price_child)
    else:
        is_expired = False
   
    return render(request, 'home/payment.html',{'booking':booking,'total_cost':total_cost,"STRIPE_PUBLIC_KEY": settings.STRIPE_PUBLIC_KEY,'is_expired':is_expired})
 
 #Stripe payment

class StripeIntentView(View):
    def post(self, request, *args, **kwargs):
        try:
            #req_json = json.loads(request.body)
            booking_number = self.kwargs["id"]
            slug = ''
            booking_details = Booking.objects.get(id= booking_number)
            if booking_details.type == 'Event':
                slug =   booking_details.event.slug
            else:
                slug =  booking_details.film.slug
            customer = stripe.Customer.create(email=booking_details.email)
            
            total_cost = booking_details.total_payment 
            # print(total_cost)
            intent = stripe.PaymentIntent.create(
                amount =  int(total_cost*100), 
                payment_method_types=['card'],
                currency='aud',
                customer=customer['id'],
                metadata={
                    "name":   booking_details.full_name,
                    "order_no":   booking_details.id,
                    'total_amount':  booking_details.total_payment,
                    'email':  booking_details.email,
                    'movie':  booking_details.title,
                    'slug':slug,
                    'theater_name': booking_details.theater_name,
                    'state':booking_details.state,
                    'phone':booking_details.phone
                }
            )

            return JsonResponse({
                'clientSecret': intent['client_secret']
            })
        except Exception as e:
            return JsonResponse({ 'error': str(e) })

def send_payment_success_email(booking):
    subject = 'Thank You – Your booking confirmation - '+booking.title
    from_email = None
    recipient_list = [booking.email]
    qr_data = f"{booking.id}"   # You can encode URL or JSON too
    qr = qrcode.make(qr_data)

    # Save QR code to bytes
    qr_io = BytesIO()
    qr.save(qr_io, format='PNG')
    qr_content = qr_io.getvalue()
    # Render HTML template with dynamic context
    context = {
        'no': booking.id,
        'no_adult':booking.no_adult,
         
        'email':booking.email,
        'title': booking.title,
        'image' :booking.poster_image,
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
    email.attach('ticket_qrcode.png', qr_content, 'image/png')

    # --- Send email ---
    email.send(fail_silently=False)


@csrf_exempt
def stripe_webhook(request):
    payload = request.body.decode('utf-8')
    sig_header = request.META.get('HTTP_STRIPE_SIGNATURE')
    event = None

    try:
        event = stripe.Webhook.construct_event(payload, sig_header, settings.STRIPE_WEBHOOK_SECRET)
    except ValueError:
        # Invalid payload
        return HttpResponse(status=400)
    except stripe.error.SignatureVerificationError:
        # Invalid signature
        return HttpResponse(status=400)

    # Correct logic:
    if event['type'] == 'payment_intent.succeeded':
       

        try:
            intent = event['data']['object']
            order_no = intent["metadata"]["order_no"]
            booking = Booking.objects.get(id=order_no)
            booking.payment_status = 1

            booking.payment_date = timezone.now()
            booking.save()
                  
            send_payment_success_email(booking)
        except Booking.DoesNotExist:
            return HttpResponse(status=404)
    return HttpResponse(status=200)


def cancel_view(request):
     
    return render(request, 'home/confirm_payment.html')

def term_condition_view(request):
    return render(request, 'home/user_term_condition.html')



#with bussiness partners
def partner_register_view(request):
    if request.user.is_authenticated:
        if hasattr(request.user, 'is_owner') and request.user.is_owner:
            return redirect('/owner')
        if hasattr(request.user, 'is_user') and request.user.is_user:
            return redirect("/")

    form = RegistrationForm(request.POST or None)
    if request.method == "POST":
        if form.is_valid():
            try:
                meme = form.save(commit=False)
                news_slug = slugify(request.POST['name'])
                
                # Check if slug exists and modify if necessary
                if User.object.filter(slug=news_slug).exists():
                    news_slug = "{slug}-{randstr}".format(
                        slug=news_slug,
                        randstr=''.join(random.choices(string.ascii_lowercase + string.digits, k=4))
                    )

                meme.slug = news_slug
                meme.username = news_slug  # Set username to the generated slug
                
                if hasattr(meme, 'is_owner') and meme.is_owner:
                    meme.is_user = False
                
                meme.save()
                messages.success(request, "Successfully registered. Please log in now.")
                return redirect('/login')

            except Exception as e:
                messages.error(request, "Something went wrong, please try again."+str(e))

    return render(request, "home/partner_register.html", {'form': form})

def partner_term_condition_view(request):
    return render(request, 'home/user_term_condition.html')






def get_adultchildprice(request,id):
    #id = request.GET.get('id')
    filmshows = Filmshow.objects.filter(id=id)
    child = 0
    adult = 0
    if filmshows.exists():
        filmshow = filmshows.first()
        child = filmshow.child
        adult = filmshow.adult
        address = filmshow.theater_name+", "+filmshow.state.name +" , "+filmshow.country.name 

    context={'child':child,'adult':adult,'address':address}
     
    # product_id = request.GET.get('product_id')
    return JsonResponse(context, safe=False)
