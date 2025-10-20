from django.db import models
from django.db.models.signals import pre_save
from .utils import unique_slug_generator
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from datetime import datetime
from django.utils.text import slugify
class MyUserManager(BaseUserManager):
    def create_user(self, email, password=None):
        if not email:
            raise ValueError("Email field is required")
        user = self.model(
            email=self.normalize_email(email),
        
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None):
        user = self.create_user(
            email=self.normalize_email(email),
            password=password,
     
        )
        user.is_admin = True
        user.is_staff = True
        
        user.is_superuser = True
        user.save(using=self._db)
        return user

class Currency(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name
    
class Country(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name
    
class State(models.Model):
    name = models.CharField(max_length=500)
    state_short =models.CharField(max_length=500,blank=True)
   
    country = models.ForeignKey(Country, on_delete=models.CASCADE)
    time_zone =models.CharField(max_length=100,blank=True)

    def __str__(self):
        return self.name

class Suburb(models.Model):
    name = models.CharField(max_length=500)
    state = models.ForeignKey(State, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

class User(AbstractBaseUser):
    email = models.EmailField(verbose_name="email", unique=True)
    slug = models.SlugField(unique=True, blank=True)
    name = models.CharField(max_length=255)
    username = models.CharField(max_length=255)
    phone = models.CharField(max_length=15, blank=True, null=True)
    gender = models.CharField(max_length=500, default='NA')
    # country = models.ForeignKey(Country, on_delete=models.CASCADE)
    profile = models.ImageField(upload_to='user/profile/', default="user/profile/user_default.jpg")
    is_admin = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_partner = models.BooleanField(default=False)
    is_user = models.BooleanField(default=True)
    is_superuser = models.BooleanField(default=False)
    date_joined = models.DateTimeField(auto_now_add=True)
    last_login = models.DateTimeField(auto_now=True)

    object = MyUserManager()

    USERNAME_FIELD = 'email'
 

    def __str__(self):
        return self.name

    def has_perm(self, perm, obj=None):
        return self.is_admin

    def has_module_perms(self, app_label):
        return True
    


class Film(models.Model):
    title = models.CharField(max_length=200, unique=True)
    slug = models.SlugField(  unique=True, blank=True)  # Allow blank so it can be generated
    description = models.TextField(blank=True, default='')
    trailer = models.CharField(max_length=100)
    release_date = models.DateField(null=True, blank=True)
    duration = models.CharField(max_length=200)
    genre = models.CharField(max_length=100)
    director = models.CharField(max_length=200)
    cast = models.TextField(blank=True, default='')
    language = models.CharField(max_length=100)
    poster_image = models.ImageField(upload_to="posters/", blank=True, null=True)  # Fixed path
    owner = models.ForeignKey(User, on_delete=models.SET_NULL,null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.title
    
class Filmshow(models.Model):
    slug = models.SlugField( unique=True, blank=True)
    film = models.ForeignKey(Film, on_delete=models.CASCADE,related_name='filmshow')
    theater_name = models.CharField(max_length=255)
    show_date = models.DateField()
    show_time = models.TimeField()

    adult = models.DecimalField(max_digits=6, decimal_places=1)
    child = models.DecimalField(max_digits=6, decimal_places=1)
    currency = models.ForeignKey(Currency, on_delete=models.CASCADE)
    country = models.ForeignKey(Country, on_delete=models.CASCADE)
    state = models.ForeignKey(State, on_delete=models.CASCADE)
    street = models.CharField(max_length=200)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    def save(self, *args, **kwargs):
        if not self.slug:
            slug_base = f"{self.film.title} {self.theater_name} {self.state.state_short} {self.show_date.strftime('%b-%d')}"
            self.slug = slugify(slug_base)
        super().save(*args, **kwargs)
    def __str__(self):
        formatted_date =  self.show_date.strftime('%b-%d')
        formatted_time = self.show_time.strftime('%I:%M %p')
        return f"{self.film.title} ,{self.theater_name}, {self.state}: {formatted_date}, {formatted_time} "
      
class EventType(models.Model):
    name = models.CharField(max_length=200)
    def __str__(self):
        return self.name
    
class Event(models.Model):
    title = models.CharField(max_length=200)
    slug = models.SlugField(unique=True, blank=True)
    owner = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    description = models.TextField(blank=True, default='')
    event_type = models.ForeignKey(EventType, on_delete=models.CASCADE)
    poster_image = models.ImageField(upload_to="events/", blank=True, null=True)
    place = models.CharField(max_length=255)
    show_date = models.DateField()
    show_time = models.TimeField()
    
    general_label = models.CharField(max_length=50,  null=True, blank=True)
    price = models.DecimalField(max_digits=8, decimal_places=1)
    quantity = models.IntegerField(default=1)

    # Three ticket levels (with names + prices)
    vip_label = models.CharField(max_length=50,  null=True, blank=True)
    vip_price = models.DecimalField(max_digits=8, decimal_places=1, default=0)
    vip_quantity = models.IntegerField(default=0)

    economy_label = models.CharField(max_length=50,  null=True, blank=True)
    economy_price = models.DecimalField(max_digits=8, decimal_places=1, default=0)
    economy_quantity = models.IntegerField(default=0)

    currency = models.ForeignKey(Currency, on_delete=models.CASCADE)
    country = models.ForeignKey(Country, on_delete=models.CASCADE)
    state = models.ForeignKey(State, on_delete=models.CASCADE)
    street = models.CharField(max_length=200)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title

class EventAccess(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    event = models.ForeignKey(Event, on_delete=models.CASCADE)
    can_view = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return f"{self.user.name}, {self.event.title}"
        
class FilmShowAccess(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    film_show = models.ForeignKey(Filmshow, on_delete=models.CASCADE)
    can_view = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return f"{self.user.name}, {self.film_show.film.title},{self.film_show.theater_name}"
    

class Booking(models.Model):
    film = models.ForeignKey(Film, on_delete=models.CASCADE, null=True, blank=True)
    filmshow = models.ForeignKey(Filmshow, on_delete=models.CASCADE, null=True, blank=True)
    event = models.ForeignKey(Event, on_delete=models.CASCADE, null=True, blank=True)
    title = models.CharField(max_length=255)
    poster_image =models.CharField(max_length=255)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)
    email = models.EmailField(verbose_name="email", unique=False)
    full_name = models.CharField(max_length=255)
    phone = models.IntegerField()
    type = models.CharField(max_length=100)

    #for movies only
    no_adult = models.DecimalField(max_digits=6, decimal_places=0,default=0)
    no_child = models.DecimalField(max_digits=6, decimal_places=0,default=0,null=True)
    price_adult = models.DecimalField(max_digits=6, decimal_places=0,default=0,null=True)
    price_child = models.DecimalField(max_digits=6, decimal_places=0,default=0,null=True)
    
    #for events only
    # Economy
    economy_label = models.CharField(max_length=50, null=True, blank=True)
    economy_price = models.DecimalField(max_digits=8, decimal_places=1, default=0)
    economy_quantity = models.IntegerField(default=0)

    # General
    general_label = models.CharField(max_length=50, null=True, blank=True)
    general_price = models.DecimalField(max_digits=8, decimal_places=1, default=0)
    general_quantity = models.IntegerField(default=0)

    # VIP
    vip_label = models.CharField(max_length=50, null=True, blank=True)
    vip_price = models.DecimalField(max_digits=8, decimal_places=1, default=0)
    vip_quantity = models.IntegerField(default=0)

    


    #grant total cost for both movie and event
    total_payment = models.DecimalField(max_digits=10, decimal_places=0, default=0.00)

    show_date = models.DateField()
    show_time = models.TimeField()
    theater_name = models.CharField(max_length=255)
    country = models.ForeignKey(Country, on_delete=models.CASCADE)
    state = models.ForeignKey(State, on_delete=models.CASCADE)
    street = models.CharField(max_length=200)
    currency = models.CharField(max_length=100)
    
    payment_status = models.IntegerField(default=0, choices=[(0, "Pending"), (1, "Paid")])
    payment_date = models.DateTimeField()

    attended = models.BooleanField(default=False)
    attended_no =  models.IntegerField(default=0)
    attend_remarks = models.TextField(blank=True, null=True)
    attended_at = models.DateTimeField(null=True, blank=True)

    
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Booking by {self.title} - {self.full_name}"

# Slug generator signal
def slug_generator(sender, instance, *args, **kwargs):
    if not instance.slug:
        instance.slug = unique_slug_generator(instance)

pre_save.connect(slug_generator, sender=Film)
pre_save.connect(slug_generator, sender=Event)
#pre_save.connect(slug_generator, sender=User)
