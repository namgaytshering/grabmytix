from django import forms
from django.forms import ModelForm
from db.models import *
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model
from django_ckeditor_5.widgets import CKEditor5Widget

GENDER_CHOICES = [
    ('', '--- Select Sex--'),
    ('Male', 'Male'),
    ('Female', 'Female'),
     ('NA', 'NA'),
]

User = get_user_model()

class AddMovieForm(ModelForm):
    title = forms.CharField(
        label="Movie Title",
        max_length=100,
        required=True,
        widget=forms.TextInput(attrs={"class": "form-control", "placeholder": "Movie Name"})
    )
    
    duration = forms.CharField(
        label="Movie Duration (minutes)",
        required=True,
        max_length=500,
        widget=forms.TextInput(attrs={"class": "form-control", "placeholder": "eg. 2"})
    )
    genre = forms.CharField(
        label="Movie Genre",
        max_length=100,
        required=True,
        widget=forms.TextInput(attrs={"class": "form-control", "placeholder": "eg. Drama, Romance"})
    )
    director = forms.CharField(
        label="Director",
        max_length=100,
        required=True,
        widget=forms.TextInput(attrs={"class": "form-control", "placeholder": "Director"})
    )
    cast = forms.CharField(
        label="Cast Team",
        max_length=255,  # Increased length for multiple names
        required=True,
        widget=forms.TextInput(attrs={"class": "form-control", "placeholder": "eg. Pema Wangmo, Tadin Wangchuk", "rows": 3})
    )
    trailer = forms.CharField(
        label="Trailer",
        max_length=255,  # Increased length for multiple names
        required=True,
        widget=forms.TextInput(attrs={"class": "form-control", "placeholder": "Youtube link", })
    )
    language = forms.CharField(
        label="Language",
        max_length=255,  # Increased length for multiple names
        required=True,
        widget=forms.TextInput(attrs={"class": "form-control", "placeholder": "eg, Dzongkha, English", })
    )
    poster_image = forms.ImageField(
        label="Movie Poster",
        required=False,
        widget=forms.ClearableFileInput(attrs={"class": "form-control"})
    )
    
    class Meta:
        model = Film  # Ensure Film is the correct model
        fields = ("title", "description", "duration", "genre", "director", "cast",'poster_image','trailer','language')

class FilmShowForm(ModelForm):
    class Meta:
        model = Filmshow
        fields = [
             "theater_name", "show_date", "show_time", "adult", "child",
            "currency", "country", "state", "street",'price', 'quantity','general_label',
            'vip_label', 'vip_price', 'vip_quantity',
            'economy_label', 'economy_price', 'economy_quantity'
        ]
        widgets = {
            "show_date": forms.TextInput(attrs={
                "class": "form-control form-icon-end", 
                "id": "date-1",
                "data-datepicker": "true",
                "placeholder": "Choose date"
            }),
            
            "show_time": forms.TextInput(attrs={
                "class": "form-control form-icon-end", 
                "id": "time-12",
                "data-datepicker": '{"enableTime": true, "noCalendar": true, "dateFormat": "H:i:S"}',
                "placeholder": "Choose time"
            }),
            #this gona out
            "adult": forms.NumberInput(attrs={"class": "form-control",  "placeholder": "Enter adult price"}),
            "child": forms.NumberInput(attrs={"class": "form-control", "placeholder": "Enter adult child"}),
            #till this
            "theater_name": forms.TextInput(attrs={"class": "form-control"}),
            "street": forms.TextInput(attrs={"class": "form-control"}),
            "currency": forms.Select(attrs={"class": "form-control"}),
            "country": forms.Select(attrs={"class": "form-control"}),
            "state": forms.Select(attrs={"class": "form-control"}),

            'price': forms.NumberInput(attrs={'class': 'form-control'}),
            'general_label': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'General Ticket Label'}),
            'quantity': forms.NumberInput(attrs={'class': 'form-control'}),
            'vip_label': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'VIP Ticket Label'}),
            'vip_price': forms.NumberInput(attrs={'class': 'form-control'}),
            'vip_quantity': forms.NumberInput(attrs={'class': 'form-control'}),
            'economy_label': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Economy Ticket Label'}),
            'economy_price': forms.NumberInput(attrs={'class': 'form-control'}),
            'economy_quantity': forms.NumberInput(attrs={'class': 'form-control'}),

            
        }

class EventForm(ModelForm):
    class Meta:
        model = Event
        fields = [
            'title', 'description', 'poster_image', 'event_type',
            'place', 'state', 'country', 'street', 'show_date', 'show_time',
            'currency', 'price', 'quantity','general_label',
            'vip_label', 'vip_price', 'vip_quantity',
            'economy_label', 'economy_price', 'economy_quantity'
        ]
        widgets = {
            "show_date": forms.TextInput(attrs={
                "class": "form-control form-icon-end", 
                "id": "date-1",
                "data-datepicker": "true",
                "placeholder": "Choose date"
            }),
            
            "show_time": forms.TextInput(attrs={
                "class": "form-control form-icon-end", 
                "id": "time-12",
                "data-datepicker": '{"enableTime": true, "noCalendar": true, "dateFormat": "H:i:S"}',
                "placeholder": "Choose time"
            }),
            'title': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Event title'}),
            
            'poster_image': forms.ClearableFileInput(attrs={'class': 'form-control'}),
            'event_type': forms.Select(attrs={'class': 'form-select'}),
            'place': forms.TextInput(attrs={'class': 'form-control'}),
            'state': forms.Select(attrs={'class': 'form-select'}),
            'country': forms.Select(attrs={'class': 'form-select'}),
            'street': forms.TextInput(attrs={'class': 'form-control'}),
            
            'currency': forms.Select(attrs={'class': 'form-select'}),
            'price': forms.NumberInput(attrs={'class': 'form-control'}),
            'general_label': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'General Ticket Label'}),
            'quantity': forms.NumberInput(attrs={'class': 'form-control'}),
            'vip_label': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'VIP Ticket Label'}),
            'vip_price': forms.NumberInput(attrs={'class': 'form-control'}),
            'vip_quantity': forms.NumberInput(attrs={'class': 'form-control'}),
            'economy_label': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Economy Ticket Label'}),
            'economy_price': forms.NumberInput(attrs={'class': 'form-control'}),
            'economy_quantity': forms.NumberInput(attrs={'class': 'form-control'}),
        }

class  UpdateinfoForm(ModelForm):
     
    gender = forms.CharField(label='Gender', widget=forms.Select(choices=GENDER_CHOICES,attrs={'class': 'form-control form-icon-start'}))
 
    class Meta:
        model = User
        fields = ( 'name', 'phone', 'gender','profile')
        widgets = {
            'profile': forms.ClearableFileInput(attrs={'class': 'form-control'}),
            'name': forms.TextInput(attrs={'class': 'form-control  form-icon-start', 'placeholder': 'Name'}), 
            'phone': forms.NumberInput(attrs={'class': 'form-control  form-icon-start', 'placeholder': 'Phone'}), 
          
        }
 

class EventAccessForm(forms.Form):
    email = forms.EmailField(
        widget=forms.EmailInput(attrs={
            'class': 'form-control form-icon-start',
            'placeholder': 'Enter email id'
        })
    )

class MovieMessageForm(forms.Form):
    movie = forms.ModelChoiceField(
        queryset=Film.objects.all(),
        empty_label="Select a movie",
        label="Movie",
        widget=forms.Select(attrs={
            "class": "form-control form-icon-start"
        })
    )
    state = forms.ModelChoiceField(
        queryset=State.objects.all(),
        empty_label="Select a movie",
        label="State",
        widget=forms.Select(attrs={
            "class": "form-control form-icon-start"
        })
    )

    message = forms.CharField(
    label="Message",
    widget=CKEditor5Widget(config_name="default")
)