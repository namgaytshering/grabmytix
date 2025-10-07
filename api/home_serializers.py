from rest_framework import serializers
from .models import Film, Filmshow, Event, Booking

class FilmSerializer(serializers.ModelSerializer):
    class Meta:
        model = Film
        fields = ['id', 'title', 'slug', 'poster_image', 'description']

class FilmshowSerializer(serializers.ModelSerializer):
    film = FilmSerializer(read_only=True)
    class Meta:
        model = Filmshow
        fields = ['id','slug','show_date','show_time','state','theater_name','adult','child','currency','country','street','film']

class EventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = ['id','title','slug','poster_image','show_date','show_time','state','price','economy_price','vip_price','currency','country','street','place']

class BookingSerializer(serializers.ModelSerializer):
    class Meta:
        model = Booking
        fields = '__all__'   # or choose specific safe fields
        read_only_fields = ['id','payment_status','payment_date','total_payment']
