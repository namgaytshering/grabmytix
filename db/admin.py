from django.contrib import admin
from .models import Film,Filmshow,User,Currency,Country,State,EventType,Event,Booking,EventAccess,FilmShowAccess
# Register your models here.
admin.site.register(Film)
admin.site.register(User)
admin.site.register(Filmshow)
admin.site.register(Currency)
admin.site.register(Country)
admin.site.register(State)
admin.site.register(EventType)
admin.site.register(Event)
admin.site.register(Booking)
admin.site.register(EventAccess)
admin.site.register(FilmShowAccess)