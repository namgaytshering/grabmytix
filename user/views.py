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
 
from django.db.models import Q
 
from django.db.models import Avg, Count, Min, Sum,ExpressionWrapper,F,FloatField
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth import update_session_auth_hash  
from .forms import AddMovieForm,FilmShowForm,EventForm


from django.contrib.auth.decorators import login_required, user_passes_test
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
#from db.models import Film,Event,
#from .forms import FilmShowForm

@login_required(login_url='/login')
@user_passes_test(lambda u: u.is_user, login_url="/login")
def dashboard_view(request, *args, **kwargs):
 
    if request.user.is_partner:
        return redirect('booking_owner_view')
    else:
        bookings =Booking.objects.filter(user = request.user).order_by('-id')
        return render(request, "user/userbooking.html",{'bookings':bookings})


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
def booking_owner_view(request, *args, **kwargs):
    accessible_event_ids = EventAccess.objects.filter(
        user=request.user,
        can_view=True
    ).values_list('event_id', flat=True)
    accessible_movies_ids = FilmShowAccess.objects.filter(
        user=request.user,
        can_view=True
    ).values_list('film_show_id', flat=True)
    bookings = (
    Booking.objects
    .filter(Q(payment_status=1) &
    (Q(film__owner=request.user) | Q(event__owner=request.user) |Q(event_id__in=accessible_event_ids) | Q(filmshow_id__in=accessible_movies_ids))) 
    .values('title', 'theater_name', 'show_date','show_time','state__state_short','type', 'event__id', 'filmshow__id')  # group by title + theater + date
    .annotate(
        total_adult=Sum('no_adult'),
        total_child=Sum('no_child'),
        total_tickets=Sum('no_adult') + Sum('no_child'),
        total_payment=Sum(
            ExpressionWrapper(
                F('no_adult') * F('price_adult') + F('no_child') * F('price_child'),
                output_field=FloatField()
            )
        )
    )
    )   

    return render(request, "user/bookingowner.html",{'bookings': bookings})


@login_required(login_url='/login')
@user_passes_test(lambda u: u.is_user, login_url="/login")
def tickets_owner_view(request, id,*args, **kwargs):
    filmshow = Filmshow.objects.get(id = id)
    ticket_no = ''
    email = ''
    bookings = Booking.objects.filter(filmshow=filmshow)
    if request.method == 'GET':
        ticket_no = request.GET.get('ticket_no', '')  # Default to empty string if 'name' is not present
        email = request.GET.get('email', '')
        
        if ticket_no != '' and email !='':
            bookings = bookings.filter(id=ticket_no, email=email,filmshow=filmshow)
    
    if request.method == 'POST':
        booking_id_str = request.POST.get("booking_id", "")
        if booking_id_str.isdigit():
            booking_id = int(booking_id_str)
            try:
                book =  Booking.objects.get(id=booking_id,filmshow=filmshow)
                if book:
                    if book.attended:
                        messages.warning(request, f"{book.full_name} has already checked in. Des: {book.attend_remarks}")
                    else:
                        book.attended = True
                        book.attend_remarks = request.POST.get("remarks", "")
                        book.attended_at = timezone.now()
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
                    'poster_image':filmshow.film.poster_image,
                    'theater_name':filmshow.theater_name,
                    'date':filmshow.show_date,
                    'time':filmshow.show_time}
    
    return render(request, "user/ticketsowner.html",context)

@login_required(login_url='/login')
@user_passes_test(lambda u: u.is_user, login_url="/login")
def event_tickets_owner_view(request, id,*args, **kwargs):
    ticket_no = ''
    email = ''
    event = Event.objects.get(id = id)
    
    bookings =''
    if request.method == 'GET':
        ticket_no = request.GET.get('ticket_no', '')  # Default to empty string if 'name' is not present
        email = request.GET.get('email', '')
        
        if ticket_no != '' and email !='':
            bookings = Booking.objects.filter(id=ticket_no, email=email,event=event)
        else:
            bookings = Booking.objects.filter(event__id=id,payment_status=1,event=event)

    if request.method == 'POST':
        booking_id_str = request.POST.get("booking_id", "")
        if booking_id_str.isdigit():
            booking_id = int(booking_id_str)
            try:
                book =  Booking.objects.get(id=booking_id,event=event)
                if book:
                    book.attended = True
                    book.attend_remarks = request.POST.get("remarks", "")
                    book.attended_at = timezone.now()
                    book.save()
                
                    messages.success(request, f"{book.full_name} checked in successfully!")
                else:
                    messages.error(request, f"{book.full_name} not found!")
            except Exception as e:
                messages.error(request, f"Error: {e}")
        else:
            messages.error(request, "Invalid booking ID")
        
        return redirect('event_tickets_owner', id=id)
     
    context = {'id':id,'ticket_no':ticket_no,'email':email,'bookings': bookings,
                    'title':event,
                    'type':'event',
                    'poster_image':event.poster_image,
                    'theater_name':event.place,
                    'date':event.show_date,
                    'time':event.show_time}
    return render(request, "user/ticketsowner.html",context)

def scan_qrcode_view(request, *args, **kwargs):
 
    return render(request,'user/scan_qrcode.html')

    
def logout_view(request, *args, **kwargs):
    logout(request)
    return redirect('home')