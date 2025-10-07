from django.urls import path
from .views import dashboard_view,movies_view,add_movies_view,add_shows_view,booking_owner_view,tickets_owner_view,logout_view,edit_movies_view,event_tickets_owner_view,events_view,add_event_view,edit_events_view,scan_qrcode_view

urlpatterns = [
    path('', dashboard_view, name='dashboard'),
    path('movies/', movies_view, name='movies'),
  
    
    path('movies/add', add_movies_view, name='add_movies'),
    path('movies/edit/<slug:slug_text>', edit_movies_view, name='edit_shows'),
    path('movies/add/addshow/<slug:slug_text>', add_shows_view, name='add_shows'),

    path('events/', events_view, name='events'),
    path('events/add', add_event_view, name='add_event'),
    path('scan_qrcode/', scan_qrcode_view, name='scan_qrcode'),
    path('events/edit/<slug:slug_text>',edit_events_view, name='edit_events'),
    path('booking', booking_owner_view, name='booking_owner_view'),
    path('booking/tickets/<int:id>', tickets_owner_view, name='tickets_owner'),
    path('booking/tickets/<int:id>/', tickets_owner_view, name='tickets_owner'),
    path('booking/tickets/e/<int:id>', event_tickets_owner_view, name='event_tickets_owner'),
    path('booking/tickets/e/<int:id>/', event_tickets_owner_view, name='event_tickets_owner'),
    # Add other user-related URL patterns here
    path('logout/', logout_view, name='logout'),
]