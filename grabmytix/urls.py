"""
URL configuration for getmyticket project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views
from home.views import (
    home_view,
    state_moviedetail_view,
    moviedetail_view,
    eventdetail_view,
    login_view,
    register_view,
    payment_view,
    get_adultchildprice,
    stripe_webhook,
    StripeIntentView,
    movies_view,
    events_view,
    term_condition_view,
    cancel_view,
    partner_register_view,
    partner_term_condition_view,
    about_view,
    view_ticket_view,
    test_email_view
)

 
urlpatterns = [
    path('admin/', admin.site.urls),
    path('user/',include('user.urls')),
    path('', home_view, name='home'),  # Added a comma at the end
    path('reset-password/', auth_views.PasswordResetView.as_view(template_name="user/password_reset.html"),
         name="reset_password"),

    path('reset_password_sent/',
         auth_views.PasswordResetDoneView.as_view(template_name="user/password_reset_sent.html"),
         name="password_reset_done"),

    path('reset/<uidb64>/<token>/',
         auth_views.PasswordResetConfirmView.as_view(template_name="user/password_reset_form.html"),
         name="password_reset_confirm"),

    path('reset_password_complete/',
         auth_views.PasswordResetCompleteView.as_view(template_name="user/password_reset_done.html"),
         name="password_reset_complete"),
    path('test-email/', test_email_view, name='test-email'),    
    path('login',login_view,name='login' ),
    path('login/',login_view,name='login' ),
    path('movies',movies_view, name='movies_view' ),
    path('events',events_view, name='events_view' ),
    path('movies/',movies_view, name='movies_view' ),
    path('events/',events_view, name='events_view' ),
    path('register',register_view,name='register'),
    path('register/',register_view,name='register'),
   
    # path('organizer/',partner_register_view,name='partner_register'),
    # path('organiser/',partner_register_view,name='partner_register'),
     #path('api/', include('api.urls')),
    path('ckeditor5/', include('django_ckeditor_5.urls')),
    path('about/',about_view,name='about'),
    path('ticket/',view_ticket_view,name='view_ticket_view'),
   
    path('payment/<int:id>',payment_view,name='payment_view'),
    path('webhooks/stripe', stripe_webhook, name='stripe-webhook'),
    path('create-payment-intent/<int:id>', StripeIntentView.as_view(), name='create-payment-intent'),
     
    path('term_condition', term_condition_view,name='term_condition_view'),
    path('partner_term_condition', partner_term_condition_view,name='partner_term_condition'),
    
    path('payment_cancel/', cancel_view,name='cancel_view'),

    path('ajax/getchildadultprice/<int:id>',get_adultchildprice, name='get_adultchildprice'),

    path('<slug:slug_text>/', moviedetail_view, name='moviedetail') , # Removed the leading slash (not needed)
    
    path('show/<slug:slug_text>', state_moviedetail_view, name='state_moviedetail_view'), 
    path('event/<slug:slug_text>/', eventdetail_view, name='eventdetail'),
   

  

]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)