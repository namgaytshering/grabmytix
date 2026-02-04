from django.urls import path
from .views import *

urlpatterns = [
    path('', dashboard_view, name='dashboard'),
    path('pastbooking/', past_booking_view, name='past_booking'),
    
    path('deletebooking/<int:id>/', deletebooking_view, name='deletebooking'),
    path('movies/', movies_view, name='movies'),
    path('bank/account/', bank_view, name='bank_view'),
      
    path("stripe/create-account/", create_connected_account),
    path('movies/add', add_movies_view, name='add_movies'),
    path('movies/edit/<slug:slug_text>', edit_movies_view, name='edit_shows'),
    path('movies/add/addshow/<slug:slug_text>', add_shows_view, name='add_shows'),


    path('movies/edit/show/<int:id>/', edit_shows_view, name='edit_shows'),

    
    path('movies/access/<int:id>/', show_movies_access_view, name='show_movies_access_view'),
    path('access/delete/<int:id>/', delete_movies_access_view, name='delete_movies_access_view'),

    
    path('password/', change_password, name='change_password'),

    path('events/', events_view, name='events'),

    
    path('events/add', add_event_view, name='add_event'),
    path('event/view/<slug:slug_text>/', eventview_view, name='eventview_view'),
    path('event/delete/<int:id>/', eventdelete_view, name='eventdelete_view'),
 
    path('scan_qrcode/', scan_qrcode_view, name='scan_qrcode'),
    path('updateinfo/', updateinfo_view, name='updateinfo_view'),
    path('events/edit/<slug:slug_text>/',edit_events_view, name='edit_events'),
    path('booking/', booking_owner_view, name='booking_owner_view'),
    path('booking/tickets/<int:id>', tickets_owner_view, name='tickets_owner'),
    path('booking/tickets/<int:id>/', tickets_owner_view, name='tickets_owner'),
    path('booking/tickets/e/<int:id>', event_tickets_owner_view, name='event_tickets_owner'),
    path('booking/tickets/e/<int:id>/', event_tickets_owner_view, name='event_tickets_owner'),
    # Add other user-related URL patterns here
    path('export-csv/<int:id>/', export_csv, name='export_csv'),
    path('logout/', logout_view, name='logout'),
]