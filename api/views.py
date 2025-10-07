from rest_framework import generics, viewsets, status
from rest_framework.response import Response
from rest_framework.decorators import action, api_view, permission_classes
from django.shortcuts import get_object_or_404
from .models import Film, Filmshow, Event, Booking
from .serializers import FilmSerializer, FilmshowSerializer, EventSerializer, BookingSerializer
from django.conf import settings
import stripe

stripe.api_key = settings.STRIPE_SECRET_KEY

# Movies list and detail
class FilmViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Film.objects.all()
    serializer_class = FilmSerializer
    lookup_field = 'slug'   # so /movies/<slug>/

    @action(detail=True, methods=['get'])
    def shows(self, request, slug=None):
        film = self.get_object()
        shows = Filmshow.objects.filter(film=film)
        return Response(FilmshowSerializer(shows, many=True).data)

# Events
class EventViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Event.objects.all()
    serializer_class = EventSerializer
    lookup_field = 'slug'

# Booking create/view
class BookingViewSet(viewsets.ModelViewSet):
    queryset = Booking.objects.all()
    serializer_class = BookingSerializer

    def create(self, request, *args, **kwargs):
        # Auto-calculate total_payment before save
        return super().create(request, *args, **kwargs)

    @action(detail=True, methods=['post'])
    def create_intent(self, request, pk=None):
        booking = self.get_object()
        customer = stripe.Customer.create(email=booking.email)
        intent = stripe.PaymentIntent.create(
            amount=int(booking.total_payment * 100),
            currency='aud',
            payment_method_types=['card'],
            customer=customer['id'],
            metadata={'order_no': booking.id}
        )
        return Response({'clientSecret': intent['client_secret']})

# Simple endpoint to get adult/child price
@api_view(['GET'])
def get_adultchild_price(request, id):
    filmshow = get_object_or_404(Filmshow, id=id)
    data = {
        'adult': filmshow.adult,
        'child': filmshow.child,
        'address': f"{filmshow.theater_name}, {filmshow.state.name}, {filmshow.country.name}"
    }
    return Response(data)

# Stripe webhook (public)
@api_view(['POST'])
@permission_classes([])  # allow Stripe
def stripe_webhook(request):
    from django.utils import timezone
    payload = request.body
    sig_header = request.META.get('HTTP_STRIPE_SIGNATURE')
    try:
        event = stripe.Webhook.construct_event(
            payload, sig_header, settings.STRIPE_WEBHOOK_SECRET
        )
    except Exception:
        return Response(status=400)

    if event['type'] == 'payment_intent.succeeded':
        intent = event['data']['object']
        order_no = intent['metadata']['order_no']
        booking = Booking.objects.filter(id=order_no).first()
        if booking:
            booking.payment_status = 1
            booking.payment_date = timezone.now()
            booking.save()
    return Response(status=200)
