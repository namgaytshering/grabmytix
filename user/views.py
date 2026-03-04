from django.shortcuts import render
from django.shortcuts import render, redirect, HttpResponseRedirect, get_object_or_404
from django.forms import modelformset_factory
from django.contrib.auth import authenticate, login, logout
from db.models import *
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.decorators import user_passes_test
from django.utils import timezone 
from django.utils.text import slugify
from django.db.models import Sum, F
from django.db.models.functions import TruncDate
from django.db.models import Q
from django.http import HttpResponse
from django.db.models import Avg, Count, Min, Sum,ExpressionWrapper,F,FloatField
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth.forms import PasswordChangeForm
from .forms import UpdateinfoForm
from django.contrib.auth import update_session_auth_hash  
from .forms import AddMovieForm,FilmShowForm,EventForm,EventAccessForm
import json
import csv

from django.contrib.auth.decorators import login_required, user_passes_test
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth import update_session_auth_hash

from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views import View
#from db.models import Film,Event,
#from .forms import FilmShowForm
from django.conf import settings
from django.http import JsonResponse
from django.views.decorators.http import require_POST, require_GET
import stripe
from django.utils.timezone import localtime
from django.views.decorators.csrf import csrf_exempt
from .services import StripeConnectService
stripe.api_key = settings.STRIPE_SECRET_KEY


# Example: 0412345678 → +61412345678
# But if phone is stored as 412345678 (no leading 0) → +61412345678

def format_au_phone(phone):
    if not phone:
        return None
    
    digits = ''.join(filter(str.isdigit, str(phone)))
    
    if not digits:
        return None

    # Already has country code
    if digits.startswith("61"):
        return "+" + digits           # 61451081907 → +61451081907

    # Has leading 0
    if digits.startswith("0"):
        return "+61" + digits[1:]     # 0451081907 → +61451081907

    # ✅ Missing leading 0 — stored as 451081907
    if len(digits) == 9:
        return "+61" + digits         # 451081907 → +61451081907

    # 10 digits without leading 0
    if len(digits) == 10:
        return "+61" + digits[1:]     # 0451081907 → +61451081907

    return "+61" + digits
@login_required(login_url='/login')
@user_passes_test(lambda u: u.is_user, login_url="/login")
def dashboard_view(request, *args, **kwargs):
 
    accessible_event_ids = EventAccess.objects.filter(
        user=request.user,
        can_view=True
    ).values_list('event_id', flat=True)
    accessible_movies_ids = FilmShowAccess.objects.filter(
        user=request.user,
        can_view=True
    ).values_list('film_show_id', flat=True)

    current_bookings = (Booking.objects.filter( Q(payment_status=1), ( (
                Q(filmshow__bill=0) & Q(film__owner=request.user) ) |
            ( Q(event__bill=0) & Q(event__owner=request.user)
            ) | Q(event_id__in=accessible_event_ids, event__bill=0) |
            Q(filmshow_id__in=accessible_movies_ids, filmshow__bill=0)
        )
    ).values(
        'title',
        'theater_name',
        'show_date',
        'show_time',
        'state__state_short',
        'type',
        'event__id',
        'filmshow__id'
    )
    .annotate(
        total_adult=Sum('no_adult'),
        total_child=Sum('no_child'),
        total_tickets=Sum(F('no_adult') + F('no_child')),
        total_payment=Sum(
            ExpressionWrapper(
                F('no_adult') * F('price_adult') + F('no_child') * F('price_child'),
                output_field=FloatField()
            )
        )
    )
    .order_by('show_date', 'show_time')
    )
     
    current_your_bookings =Booking.objects.filter(
        Q(user=request.user),
        Q(filmshow__status=1 )| Q(event__status=1)
      
    ).order_by('-id')
    context ={
        'bookings':current_bookings,'your_bookings':current_your_bookings,
       
        }

    return render(request, "user/userbooking.html",context)

@login_required(login_url='/login')
@user_passes_test(lambda u: u.is_user, login_url="/login")
def past_booking_view(request, *args, **kwargs):
 
    accessible_event_ids = EventAccess.objects.filter(
        user=request.user,
        can_view=True
    ).values_list('event_id', flat=True)
    accessible_movies_ids = FilmShowAccess.objects.filter(
        user=request.user,
        can_view=True
    ).values_list('film_show_id', flat=True)

    
    past_bookings = (Booking.objects.filter( Q(payment_status=1), ( (
                Q(filmshow__bill=1) & Q(film__owner=request.user) ) |
            ( Q(event__bill=1) & Q(event__owner=request.user)
            ) | Q(event_id__in=accessible_event_ids, event__bill=1) |
            Q(filmshow_id__in=accessible_movies_ids, filmshow__bill=1)
        )
    ).values(
        'title',
        'theater_name',
        'show_date',
        'show_time',
        'state__state_short',
        'type',
        'event__id',
        'filmshow__id'
    )
    .annotate(
        total_adult=Sum('no_adult'),
        total_child=Sum('no_child'),
        total_tickets=Sum(F('no_adult') + F('no_child')),
        total_payment=Sum(
            ExpressionWrapper(
                F('no_adult') * F('price_adult') + F('no_child') * F('price_child'),
                output_field=FloatField()
            )
        )
    )
    .order_by('-show_date', '-show_time')
    )
    
    past_your_bookings =Booking.objects.filter(
        Q(user=request.user),
        Q(filmshow__status=0 )| Q(event__status=0),
        Q(payment_status =1),
    ).order_by('-id')

    context ={
        
        'past_bookings':past_bookings,'past_your_bookings':past_your_bookings
        }

    return render(request, "user/pastbooking.html",context)

@login_required(login_url='/login')
@user_passes_test(lambda u: u.is_user, login_url="/login")
def movies_view(request, *args, **kwargs):
   # movies = Filmshow.objects.all().order_by('-show_date')
    movies = Film.objects.filter(owner = request.user).order_by('-created_at')
    context = {'movies': movies}
    return render(request, "user/movies.html",context)


@login_required(login_url='/login')
@user_passes_test(lambda u: u.is_user, login_url="/login")
def add_movies_view(request, *args, **kwargs):
    form = AddMovieForm(request.POST or None, request.FILES or None)
    if request.method == 'POST':
        try:
            if form.is_valid():
                saveform = form.save(commit=False)
                saveform.owner = request.user
                saveform.save()
                messages.success(request, "New movie has been added")
                return redirect('add_shows',slug_text=saveform.slug)
        except Exception as e:
            messages.success(request, "Something happened, please try again"+str(e)) 
    context = {'form': form}
    return render(request, "user/addmovies.html",context)

@login_required(login_url='/login')
@user_passes_test(lambda u: u.is_user, login_url="/login")
def edit_movies_view(request,slug_text, *args, **kwargs):
    movie = get_object_or_404(Film, slug=slug_text) 
    form = AddMovieForm(request.POST or None,request.FILES or None,instance=movie)
    if request.method == 'POST':
        try:
            if form.is_valid():
                saveform = form.save(commit=False)
                saveform.owner = request.user
                saveform.save()
                messages.success(request, "The changes has been made.")
                return redirect('add_shows',slug_text=saveform.slug)
        except Exception as e:
            messages.success(request, "Something happened, please try again"+str(e)) 
    context = {'form': form}
    return render(request, "user/addmovies.html",context)

#access to film show
@login_required(login_url='/login')
def show_movies_access_view(request,id):
    show  = Filmshow.objects.filter(id =id).first()
    show_access = FilmShowAccess.objects.filter(film_show=show,film_show__film__owner = request.user)
    form = EventAccessForm(request.POST)
    if request.method == "POST":
        form = EventAccessForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']
            try:
                check_access = FilmShowAccess.objects.filter(user__email=email, film_show=show).exists()
                if not check_access:
                    user = User.object.filter(email=email).first()
                    if user:
                    # Create access (avoid duplicate)
                        FilmShowAccess.objects.get_or_create(
                            user=user,
                            film_show=show
                        )
                        messages.success(request, f"{email} User successfully added and given the  event access.")
                    else:
                        messages.warning(request, f"{email} User is not registered with us. Please register with us to give them access")
                else:
                    messages.info(request, f"{email} already have a acess.")
                return redirect('show_movies_access_view', id=id)
            except User.DoesNotExist:
                form.add_error('email', 'No user found with this email.')
                return redirect('show_movies_access_view', id=id)        
    context={'show_access':show_access,'show':show,'form':form}
    return render(request, "user/showaccess.html",context)

@login_required(login_url='/login')
def delete_movies_access_view(request,id):
    show_access = FilmShowAccess.objects.filter(id=id).first()

    # If not exists
    if not show_access:
        messages.warning(request, "Record does not exist.")
        return redirect(request.META.get('HTTP_REFERER', '/'))

    # Store slug before delete
    show_id = show_access.film_show.id

    # Delete the matched record
    show_access.delete()

    # Success message
    messages.success(request, "Event access deleted successfully.")

    # Redirect to event view
    return redirect('show_movies_access_view', id=show_id)


@login_required(login_url='/login')
@user_passes_test(lambda u: hasattr(u, 'is_user') and u.is_user, login_url="/login")
def add_shows_view(request, slug_text, *args, **kwargs):
    film = get_object_or_404(Film, slug=slug_text)  # Ensures 404 instead of errors
    form = FilmShowForm(request.POST or None)
    movies = Filmshow.objects.filter(film =film).order_by('-show_date')
    if request.method == 'POST':
        if form.is_valid():
            try:
                saveform = form.save(commit=False)
                saveform.owner = request.user  # Fix typo: onwer → owner
                saveform.film = film
                saveform.save()  # Save to database

                messages.success(request, "Show successfully added!")
                return redirect("add_shows" , slug_text =film.slug)  # Redirect after successful save
            except Exception as e:
                messages.error(request, f" Something went wrong: {str(e)}")
        else:
            messages.error(request, "Please correct the errors below.")
    context = {'form': form,'film':film,'movies':movies}
    return render(request, "user/addshows.html", context)


@login_required(login_url='/login')
@user_passes_test(lambda u: hasattr(u, 'is_user') and u.is_user, login_url="/login")
def edit_shows_view(request, id):
    show = get_object_or_404(Filmshow, id=id)
    form = FilmShowForm(request.POST or None, request.FILES or None, instance=show)

    if request.method == "POST":
        if form.is_valid():
            form.save()
            messages.success(request, "Show successfully updated!")
            return redirect("add_shows", slug_text=show.film.slug)
        else:
            print(form.errors) 
            messages.error(request, "Please correct the errors below.")

    context = {'form': form}
    return render(request, "user/editshow.html", context)


#events
@login_required(login_url='/login')
@user_passes_test(lambda u: u.is_user, login_url="/login")
def events_view(request, *args, **kwargs):
   # movies = Filmshow.objects.all().order_by('-show_date')
    events = Event.objects.filter(owner = request.user).order_by('-created_at')
    context = {'events': events}
    return render(request, "user/events.html",context)

def add_event_view(request):
    form = EventForm(request.POST or None)
    if request.method == 'POST':
        form = EventForm(request.POST, request.FILES)
        if form.is_valid():

            event = form.save(commit=False)
            # Optional: set owner automatically if using login
            event.owner = request.user
            event.save()
            return redirect('events')  # replace with your event list URL

        
    return render(request, 'user/add_event.html', {'form': form})

@login_required(login_url='/login')
@user_passes_test(lambda u: u.is_user, login_url="/login")
def eventview_view(request,slug_text, *args, **kwargs):
    
    event = get_object_or_404(Event, owner=request.user, slug=slug_text)
    form = EventAccessForm(request.POST)
    if request.method == "POST":
        form = EventAccessForm(request.POST)

        if form.is_valid():
            email = form.cleaned_data['email']

            try:
                check_access = EventAccess.objects.filter(user__email=email, event=event).exists()
                if not check_access:
                    user = User.object.filter(email=email).first()
                    if user:
                    # Create access (avoid duplicate)
                        EventAccess.objects.get_or_create(
                            user=user,
                            event=event
                        )

                        messages.success(request, f"{email} User successfully added and given the  event access.")
                    else:
                        messages.warning(request, f"{email} User is not registered with us. Please register with us to give them access")
                else:
                    messages.info(request, f"{email} already have a acess.")
                return redirect('eventview_view',  slug_text=event.slug)

            except User.DoesNotExist:
                form.add_error('email', 'No user found with this email.')
                return redirect('eventview_view', slug_text=event.slug)

    event_access = EventAccess.objects.filter(event__slug=slug_text,event__owner = request.user)
    context ={'event':event,'event_access':event_access,'form':form}
    return render(request, 'user/event_view.html',context)

@login_required(login_url='/login')
@user_passes_test(lambda u: u.is_user, login_url="/login")
def edit_events_view(request,slug_text, *args, **kwargs):
    event = get_object_or_404(Event, slug=slug_text) 
    form = EventForm(request.POST or None,request.FILES or None,instance=event)
    if request.method == 'POST':
        try:
            if form.is_valid():
                saveform = form.save(commit=False)
                saveform.owner = request.user
                saveform.save()
                messages.success(request, "The changes has been made.")
                return redirect('events')
        except Exception as e:
            messages.success(request, "Something happened, please try again"+str(e)) 
    context = {'form': form}
    return render(request, "user/add_event.html",context)

@login_required(login_url='/login')
@user_passes_test(lambda u: u.is_user, login_url="/login")
def eventdelete_view(request, id, *args, **kwargs):
    event_access = EventAccess.objects.filter(id=id).first()

    # If not exists
    if not event_access:
        messages.warning(request, "Record does not exist.")
        return redirect(request.META.get('HTTP_REFERER', '/'))

    # Store slug before delete
    event_slug = event_access.event.slug

    # Delete the matched record
    event_access.delete()

    # Success message
    messages.success(request, "Event access deleted successfully.")

    # Redirect to event view
    return redirect('eventview_view', slug_text=event_slug)


@login_required(login_url='/login')
@user_passes_test(lambda u: u.is_user, login_url="/login")
def booking_owner_view(request, *args, **kwargs):
    accessible_event_ids = EventAccess.objects.filter(
        user=request.user,
        can_view=True
    ).values_list('event_id', flat=True)
    accessible_movies_ids = FilmShowAccess.objects.filter(
        user=request.user,
        can_view=True
    ).values_list('film_show_id', flat=True)

    bookings = (Booking.objects.filter( Q(payment_status=1), ( (
                Q(filmshow__status=1) & Q(film__owner=request.user) ) |
            ( Q(event__status=1) & Q(event__owner=request.user)
            ) | Q(event_id__in=accessible_event_ids, event__status=1) |
            Q(filmshow_id__in=accessible_movies_ids, filmshow__status=1)
        )
    ).values(
        'title',
        'theater_name',
        'show_date',
        'show_time',
        'state__state_short',
        'type',
        'event__id',
        'filmshow__id'
    )
    .annotate(
        total_adult=Sum('no_adult'),
        total_child=Sum('no_child'),
        total_tickets=Sum(F('no_adult') + F('no_child')),
        total_payment=Sum(
            ExpressionWrapper(
                F('no_adult') * F('price_adult') + F('no_child') * F('price_child'),
                output_field=FloatField()
            )
        )
    )
    .order_by('-show_date', '-show_time')
    )

    return render(request, "user/bookingowner.html",{'bookings': bookings})


@login_required(login_url='/login')
@user_passes_test(lambda u: u.is_user, login_url="/login")
def tickets_owner_view(request, id,*args, **kwargs):
    filmshow = Filmshow.objects.get(id = id)
    ticket_no = ''
    email = ''
    bookings = Booking.objects.filter(filmshow=filmshow, payment_status = 1).annotate(
     total_tickets=F('no_adult') + F('no_child'),
        )
    
    total_booked = bookings.aggregate(total=Sum(F('no_adult') + F('no_child')))['total'] or 0

    total_attended = bookings.aggregate(total=Sum('attended_no'))['total'] or 0

    percentage = round((total_attended / total_booked) * 100, 0) 

    if request.method == 'GET':
        ticket_no = request.GET.get('ticket_no', '')  # Default to empty string if 'name' is not present
        email = request.GET.get('email', '')
        
        if ticket_no != '' and email !='':
            bookings = bookings.filter(id=ticket_no, email=email,filmshow=filmshow)
    
    time_series = ( bookings
    .values(date=TruncDate('created_at')).annotate(total=Sum('total_tickets'))
    .order_by('date')) 
    
    # labels = [b['date'].strftime('%Y-%m-%d') for b in time_series]
    labels = [localtime(b['date']).strftime('%Y-%m-%d') for b in time_series]
    data = [int(b['total']) for b in time_series] 
    
    if request.method == 'POST':
        booking_id_str = request.POST.get("booking_id", "")
        if booking_id_str.isdigit():
            booking_id = int(booking_id_str)
            try:
                book =  Booking.objects.filter(id=booking_id,filmshow=filmshow, payment_status = 1).annotate(total_tickets=F('economy_quantity') + F('general_quantity') + F('vip_quantity')).first()
               
                if book:
                    total_attend =int(request.POST.get("total_ticket_number", 0) )
                    if book.total_tickets == total_attend:
                        book.attended = True
                    book.attend_remarks = request.POST.get("remarks", "")
                    book.attended_at = timezone.now()
                    book.attended_no =  total_attend
        
                    book.save()
                    messages.success(request, f"{book.full_name} checked in successfully!")
                else:
                    messages.error(request, f"{book.full_name} not found!")
            except Exception as e:
                messages.error(request, f"Error: {e}")
        else:
            messages.error(request, "Invalid booking ID")
        
        return redirect('tickets_owner', id=id)

    context = {'id':id,'ticket_no':ticket_no,'email':email,'bookings': bookings,
                    'title':filmshow,
                    'type':'movie',
                    'label' : json.dumps(labels),
                    'data':json.dumps(data),
                    'poster_image':filmshow.film.poster_image,
                    'theater_name':filmshow.theater_name,
                    'percentage':percentage,
                    'total_booked':total_booked,
                    'street':filmshow.street,
                    'state':filmshow.state,
                    'date':filmshow.show_date,
                    'time':filmshow.show_time}
    
    return render(request, "user/ticketsowner.html",context)
@login_required(login_url='/login')
@user_passes_test(lambda u: u.is_user, login_url="/login")
def event_tickets_owner_view(request, id, *args, **kwargs):
    ticket_no = request.GET.get('ticket_no', '').strip()
    email = request.GET.get('email', '').strip().lower()  # normalize email
    event = Event.objects.get(id=id)

    bookings = Booking.objects.filter(event=event, payment_status=1).annotate(
        total_tickets=F('economy_quantity') + F('general_quantity') + F('vip_quantity')
    ).order_by('-id')
    total_booked = bookings.aggregate(total=Sum(F('economy_quantity') + F('general_quantity') + F('vip_quantity')))['total'] or 0

    total_attended = bookings.aggregate(total=Sum('attended_no'))['total'] or 0

    percentage = round((total_attended / total_booked) * 100, 0) 


    if ticket_no and email:
        if ticket_no.isdigit():
            ticket_no_int = int(ticket_no)
            bookings = bookings.filter(id=ticket_no_int, email=email)
        else:
            bookings = bookings.none()

    # Prepare time series for Chart.js
    time_series = bookings.values(date=TruncDate('created_at')).annotate(total=Sum('total_tickets')).order_by('date')
    # labels = [b['date'].strftime('%Y-%m-%d') for b in time_series]
    labels = [localtime(b['date']).strftime('%Y-%m-%d') for b in time_series]
    data = [int(b['total']) for b in time_series]

    if request.method == 'POST':
        booking_id_str = request.POST.get("booking_id", "")
        if booking_id_str.isdigit():
            booking_id = int(booking_id_str)
            book = Booking.objects.filter(id=booking_id, event=event).first()
            if book:
                total_tickets = book.economy_quantity + book.general_quantity + book.vip_quantity
                total_attend = int(request.POST.get("total_ticket_number", 0))

                if total_attend == total_tickets:
                    book.attended = True
                book.attend_remarks = request.POST.get("remarks", "Checked in")
                book.attended_at = timezone.now()
                book.attended_no = total_attend
                book.save()

                messages.success(request, f"{book.full_name} checked in successfully!")
            else:
                messages.error(request, "Booking not found!")
        else:
            messages.error(request, "Invalid booking ID")
        return redirect('event_tickets_owner', id=id)

    context = {
        'id': id,
        'ticket_no': ticket_no,
        'email': email,
        'bookings': bookings,
        'title': event,
        'label': json.dumps(labels),
        'data': json.dumps(data),
        'type': 'event',
        'poster_image': event.poster_image,
        'theater_name': event.place,
        'date': event.show_date,
        'time': event.show_time,
        'street':event.street,
        'state':event.state,
        'percentage':percentage,
        'total_booked':total_booked,
    }
    return render(request, "user/ticketsowner.html", context)

def scan_qrcode_view(request, *args, **kwargs):
 
    return render(request,'user/scan_qrcode.html')

def export_csv(request,id):
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="booking_list_grabmytix.csv"'

    writer = csv.writer(response)
    writer.writerow(['Ticket Number', 'Name', 'Email','Phone', 'Tickets','Cost'])  # Header
    bookings = Booking.objects.filter(payment_status=1,event__id = id).annotate(
        total_tickets=F('economy_quantity') + F('general_quantity') + F('vip_quantity')
    )
    if not bookings.exists():
        bookings = Booking.objects.filter(payment_status=1,filmshow__id = id).annotate(
        total_tickets=Sum(F('no_adult') + F('no_child'))
    )
    for booking in bookings:
        writer.writerow([booking.id, booking.full_name,booking.email,booking.phone, booking.total_tickets,booking.total_payment])

    return response
@login_required
def updateinfo_view(request):
    form = UpdateinfoForm(request.POST or None, request.FILES or None, instance=request.user)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            messages.success(request,  "Successfully updated your information!")
            return redirect('updateinfo_view')
    return render(request, "user/updateinfo.html",{'form': form})
@login_required
def deletebooking_view(request,id):
    booking = get_object_or_404(Booking, id=id, user=request.user)
    try:
        booking.delete()
        messages.success(request, f"Order {id} booking deleted successfully.")
    except Exception:
        messages.error(request, "Unable to delete the booking. Please try again.")
    return redirect('dashboard')


@login_required
def change_password(request):
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            # Keeps user logged in after password change
            update_session_auth_hash(request, user)

            messages.success(request, 'Your password has been changed successfully.')
            return redirect('dashboard')
        else:
            messages.error(request, 'Please correct the errors below.')
    else:
        form = PasswordChangeForm(request.user)

    return render(request, 'user/change_password.html', {'form': form})

#for create stripe connect account
@csrf_exempt
def create_connected_account(request, seller_id):
    seller = User.object.get(id=seller_id)

    if not seller.stripe_account_id:
        account = stripe.Account.create(
            type="express",
            country="AU",
            capabilities={
                "card_payments": {"requested": True},
                "transfers": {"requested": True},
            },
            business_type="individual"
        )
        seller.stripe_account_id = account.id
        seller.save()

    return redirect(f"/seller/embedded-onboarding/?seller_id={seller.id}")
 
# Step 2c: Handle return URL (after onboarding)
def seller_dashboard(request):
   # seller_id = request.GET.get("seller_id")
    seller = User.object.get(id=7)

    # Update onboarded status (optional: verify via Stripe API)
    seller.is_onboarded = True
    seller.save()

    return render(request, "dashboard.html", {"seller": seller})


def bank_view(request, *args, **kwargs):
    # seller = User.object.get(id=7)

    # account = stripe.Account.create(
    # type="express",
    # country="AU",
    # email="seller_test@example.com",
    # capabilities={
    #     "card_payments": {"requested": True},
    #     "transfers": {"requested": True},
    # },
    # business_type="individual"
    #     )
      
    # context = {
    #      "account_link_url": account,
    #     "stripe_publishable_key": settings.STRIPE_PUBLIC_KEY,
    #     "seller_id": seller.id,
    # }
    return render(request, 'user/bank.html')


# For stripe connect accoutn

# ---------------------------------------------------------------------------
# Step 1: Create Connect Account
# ---------------------------------------------------------------------------
@login_required
@require_POST
def create_connect_account(request):
    user = request.user  # ✅ logged-in user only

    if hasattr(user, "connect_account"):
        return JsonResponse({
            "error": "Connect account already exists",
            "stripe_account_id": user.connect_account.stripe_account_id
        }, status=400)

    ip =  request.META.get("REMOTE_ADDR")
    # if "," in ip:
    #     ip = ip.split(",")[0].strip()
    print(ip)
    try:
        data    = json.loads(request.body) if request.body else {}
        country = data.get("country", "AU")

        currency_map = {"AU":"aud","US":"usd","GB":"gbp","NZ":"nzd","CA":"cad"}

        # ✅ Uses logged-in user's data — no new user created
        account = StripeConnectService.create_account(
            user,
            ip_address=ip,
            country=country,
        )

        ConnectAccount.objects.create(
            user=user,                    # ✅ logged-in user's ID
            stripe_account_id=account.id,
            country=country,
            currency=currency_map.get(country, "aud"),
            charges_enabled=account.charges_enabled,
            payouts_enabled=account.payouts_enabled,
            details_submitted=account.details_submitted,
        )

        return JsonResponse({
            "stripe_account_id": account.id,
            "message": "Account created.",
        })

    except stripe.error.StripeError as e:
        return JsonResponse({"error": str(e) }, status=400)
    
@staticmethod
def create_account(user, ip_address: str) -> stripe.Account:
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
        business_type="individual",
        # ✅ Add these 3 fields
        business_profile={
            "mcc": "7922",                    # ticketing/events — perfect for grabmytix
            "url": "https://grabmytix.com",   # your platform URL
        },
        individual={
            "email": user.email,              # ✅ fixes "individual → email" requirement
        },
    )
    return account


# ---------------------------------------------------------------------------
# Step 2: Submit KYC Information
# ---------------------------------------------------------------------------
@login_required
@require_POST
def submit_kyc(request):
    user = request.user  # ✅ logged-in user

    try:
        connect = user.connect_account
    except ConnectAccount.DoesNotExist:
        return JsonResponse({"error": "No connect account found."}, status=404)

    try:
        data = json.loads(request.body)
    except Exception:
        return JsonResponse({"error": "Invalid JSON."}, status=400)

    # Split name from logged-in user
    parts      = user.name.strip().split(" ")
    first_name = parts[0]
    last_name  = parts[-1] if len(parts) > 1 else parts[0]

    # Format phone from logged-in user
    phone =  format_au_phone(user.phone)
  
    try:
        StripeConnectService.update_account_individual(
            connect.stripe_account_id,
            {
                # ✅ All from logged-in user — no form input needed
                "first_name": first_name,
                "last_name":  last_name,
                "email":      user.email,
                "phone":      phone,

                # ✅ Only these come from the form
                "dob_day":      data["dob_day"],
                "dob_month":    data["dob_month"],
                "dob_year":     data["dob_year"],
                "address_line1": data["address_line1"],
                "city":          data["city"],
                "state":         data["state"],
                "postal_code":   data["postal_code"],
                "country":       data.get("country", "AU"),
            }
        )

        return JsonResponse({"message": "Identity updated."})

    except stripe.error.StripeError as e:
        return JsonResponse({"error": str(e)}, status=400)


# ---------------------------------------------------------------------------
# Step 3: Upload Identity Document
# ---------------------------------------------------------------------------
@login_required
@require_POST
def upload_document(request):
    try:
        connect_account = request.user.connect_account
    except ConnectAccount.DoesNotExist:
        return JsonResponse({"error": "No connect account found."}, status=404)

    try:
        data = json.loads(request.body)
        file_id = data.get("file_id")
    except Exception:
        return JsonResponse({"error": "Invalid JSON."}, status=400)

    if not file_id:
        return JsonResponse({"error": "No file_id provided."}, status=400)

    try:
        # Attach Stripe file ID directly to account
        stripe.Account.modify(
            connect_account.stripe_account_id,
            individual={
                "verification": {
                    "document": {
                        "front": file_id,
                    }
                }
            },
        )
        return JsonResponse({"message": "Document uploaded.", "stripe_file_id": file_id})

    except stripe.error.StripeError as e:
        return JsonResponse({"error": str(e)}, status=400)
# ---------------------------------------------------------------------------
# Step 4: Add Bank Account
# ---------------------------------------------------------------------------
@login_required
@require_POST
def add_bank_account(request):
    """
    POST /connect/bank-account/
    Adds a bank account to the connected account.

    Frontend tokenizes with Stripe.js first, then sends:
    { "bank_token": "btok_..." }
    """
    try:
        connect_account = request.user.connect_account
    except ConnectAccount.DoesNotExist:
        return JsonResponse({"error": "No connect account found."}, status=404)

    data = json.loads(request.body)
    bank_token = data.get("bank_token")

    if not bank_token:
        return JsonResponse({"error": "bank_token is required."}, status=400)

    try:
        bank_account = StripeConnectService.add_bank_account(
            connect_account.stripe_account_id, bank_token
        )
        return JsonResponse({
            "message": "Bank account added.",
            "bank_account_id": bank_account.id,
            "last4": bank_account.last4,
            "bank_name": bank_account.bank_name,
        })

    except stripe.error.StripeError as e:
        return JsonResponse({"error": str(e)}, status=400)


# ---------------------------------------------------------------------------
# Step 5: Check Account Status
# ---------------------------------------------------------------------------
@login_required
@require_GET
def account_status(request):
    """
    GET /connect/status/
    Returns the current onboarding status and what Stripe still needs.
    """
    try:
        connect_account = request.user.connect_account
    except ConnectAccount.DoesNotExist:
        return JsonResponse({"error": "No connect account found."}, status=404)

    try:
        requirements = StripeConnectService.get_requirements(
            connect_account.stripe_account_id
        )

        connect_account.requirements_currently_due = requirements["currently_due"] or []
        connect_account.requirements_eventually_due = requirements["eventually_due"] or []
        connect_account.charges_enabled = requirements["charges_enabled"]
        connect_account.payouts_enabled = requirements["payouts_enabled"]

        if requirements["charges_enabled"] and requirements["payouts_enabled"]:
            connect_account.status = "active"
        elif requirements["disabled_reason"]:
            connect_account.status = "restricted"

        connect_account.save()

        return JsonResponse({
            "status": connect_account.status,
            **requirements,
        })

    except stripe.error.StripeError as e:
        return JsonResponse({"error": str(e)}, status=400)


# ---------------------------------------------------------------------------
# Step 6: Create a Payment
# ---------------------------------------------------------------------------
@login_required
@require_POST
def create_payment(request):
    """
    POST /connect/charge/
    Creates a PaymentIntent where funds go to a connected account.

    JSON body:
    {
        "seller_user_id": 42,
        "amount": 10000,        // cents ($100.00)
        "currency": "usd",
        "application_fee": 500  // platform keeps $5.00
    }
    """
    from django.contrib.auth import get_user_model
    User = get_user_model()

    data = json.loads(request.body)

    try:
        seller = User.objects.get(id=data["seller_user_id"])
        connect_account = seller.connect_account
    except (User.DoesNotExist, ConnectAccount.DoesNotExist):
        return JsonResponse({"error": "Seller not found or has no connect account."}, status=404)

    if not connect_account.charges_enabled:
        return JsonResponse({"error": "Seller account is not yet able to accept payments."}, status=400)

    try:
        payment_intent = StripeConnectService.create_payment_intent(
            amount=data["amount"],
            currency=data.get("currency", "usd"),
            stripe_account_id=connect_account.stripe_account_id,
            application_fee_amount=data.get("application_fee", 0),
        )

        return JsonResponse({
            "client_secret": payment_intent.client_secret,
            "payment_intent_id": payment_intent.id,
        })

    except stripe.error.StripeError as e:
        return JsonResponse({"error": str(e)}, status=400)


# ---------------------------------------------------------------------------
# Webhook: Listen for Stripe Events
# ---------------------------------------------------------------------------
@csrf_exempt
@require_POST
def stripe_webhook(request):
    """
    POST /connect/webhook/
    Listens to Stripe webhook events to keep your DB in sync.

    Key events:
    - account.updated          → sync requirements & capabilities
    - payment_intent.succeeded → mark order as paid
    - payout.paid              → notify seller of payout
    """
    payload = request.body
    sig_header = request.META.get("HTTP_STRIPE_SIGNATURE")

    try:
        event = stripe.Webhook.construct_event(
            payload, sig_header, settings.STRIPE_WEBHOOK_SECRET
        )
    except (ValueError, stripe.error.SignatureVerificationError) as e:
        return JsonResponse({"error": str(e)}, status=400)

    event_type = event["type"]
    obj = event["data"]["object"]

    if event_type == "account.updated":
        _sync_account(obj)

    elif event_type == "payment_intent.succeeded":
        _on_payment_succeeded(obj)

    elif event_type == "payout.paid":
        _on_payout_paid(obj)

    return JsonResponse({"status": "ok"})


# ---------------------------------------------------------------------------
# Webhook helpers (private functions)
# ---------------------------------------------------------------------------
def _sync_account(account):
    """Sync account status when Stripe notifies us of changes."""
    try:
        ca = ConnectAccount.objects.get(stripe_account_id=account["id"])
        ca.charges_enabled = account.get("charges_enabled", False)
        ca.payouts_enabled = account.get("payouts_enabled", False)
        ca.details_submitted = account.get("details_submitted", False)

        reqs = account.get("requirements", {})
        ca.requirements_currently_due = reqs.get("currently_due", [])
        ca.requirements_eventually_due = reqs.get("eventually_due", [])
        ca.requirements_past_due = reqs.get("past_due", [])

        if ca.charges_enabled and ca.payouts_enabled:
            ca.status = "active"

        ca.save()
    except ConnectAccount.DoesNotExist:
        pass


def _on_payment_succeeded(payment_intent):
    """Update your Order model when payment succeeds."""
    # payment_intent["id"] → look up your Order and mark as paid
    pass


def _on_payout_paid(payout):
    """Notify the seller when their payout hits their bank."""
    # payout["destination"] → bank account ID
    pass


#log out
def logout_view(request, *args, **kwargs):
    logout(request)
    return redirect('home')