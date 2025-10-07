from django import forms
from django.forms import ModelForm
from db.models import *
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model
from django.core.validators import RegexValidator


GENDER_CHOICES = [
    ('', '--- Select Sex--'),
    ('Male', 'Male'),
    ('Female', 'Female'),
]

User = get_user_model()

class LoginForm(forms.Form):
    email = forms.EmailField(
        widget=forms.EmailInput(attrs={
            'class': 'form-control form-control-lg',
            'placeholder': 'Email',
            'required': True
        })
    )
    password = forms.CharField(
        widget=forms.PasswordInput(attrs={
            'class': 'form-control form-control-lg',
            'placeholder': 'Password',
            'required': True
        })
    )


class RegistrationForm(UserCreationForm):
    password1 = forms.CharField(
        widget=forms.PasswordInput(attrs={'class': 'form-control  form-icon-start', 'placeholder': 'Password'}))
    password2 = forms.CharField(
        widget=forms.PasswordInput(attrs={'class': 'form-control  form-icon-start', 'placeholder': 'Confirm Password'}))
  
    gender = forms.CharField(label='Gender', widget=forms.Select(choices=GENDER_CHOICES,attrs={'class': 'form-control form-icon-start'}))
   
    class Meta:
        model = User
        fields = ('email', 'name', 'phone', 'password1', 'password2', 'gender')
        widgets = {
            'email': forms.EmailInput(attrs={'class': 'form-control  form-icon-start', 'placeholder': 'Enter valid email id'}),
            'name': forms.TextInput(attrs={'class': 'form-control  form-icon-start', 'placeholder': 'Name'}), 
            'phone': forms.NumberInput(attrs={'class': 'form-control  form-icon-start', 'placeholder': 'Phone'}), 
            'password1': forms.TextInput(attrs={'class': 'form-control  form-icon-start'}),
            'password2': forms.TextInput(attrs={'class': 'form-control  form-icon-start'}),

        }


class TicketCheckoutForm(ModelForm):

    full_name = forms.CharField(
        label='Full Name',
        max_length=100,
        required=True,
        widget=forms.TextInput(attrs={'class': 'form-control form-icon-start', 'placeholder': 'Full Name', 'required': 'required'})
    )
    email = forms.EmailField(
        label='Email',
        required=True,
        widget=forms.EmailInput(attrs={'class': 'form-control form-icon-start', 'placeholder': 'Email', 'required': 'required'})
    )
    
    phone = forms.IntegerField(
        label='Phone Number',
        required=True,
        widget=forms.NumberInput(attrs={'class': 'form-control form-icon-start','placeholder': 'Phone Number', 'required': 'required'})
    )

    no_adult = forms.IntegerField(
        label='Number of Adults',
        min_value=1,
        max_value=5,
        initial=1,
        required=True,
        widget=forms.NumberInput(attrs={'class': 'form-control form-icon-start'})
    )
    no_child = forms.IntegerField(
        label='Number of Children',
        min_value=0,
        max_value=5,
        initial=0,
        required=False,
        widget=forms.NumberInput(attrs={'class': 'form-control form-icon-start'})
    )
 
    class Meta:
        model = Booking
        fields = ('full_name', 'email','no_adult', 'no_child','phone' )
            
    

     
class TicketEventCheckoutForm(ModelForm):
    full_name = forms.CharField(
        label='Full Name',
        max_length=100,
        required=True,
        widget=forms.TextInput(attrs={'class': 'form-control form-icon-start', 'placeholder': 'Full Name', 'required': 'required'})
    )
    email = forms.EmailField(
        label='Email',
        required=True,
        widget=forms.EmailInput(attrs={'class': 'form-control form-icon-start', 'placeholder': 'Email', 'required': 'required'})
    )
    
    phone = forms.IntegerField(
        label='Phone Number',
        required=True,
        widget=forms.NumberInput(attrs={'class': 'form-control form-icon-start','placeholder': 'Phone Number', 'required': 'required'})
    )
    
    # no_adult = forms.IntegerField(
    #     label='Number of Adults',
    #     min_value=1,
    #     max_value=5,
    #     initial=1,
    #     required=True,
    #     widget=forms.NumberInput(attrs={'class': 'form-control form-icon-start'})
    # )

    
    # --- Ticket quantities (optional) ---
    economy_quantity = forms.IntegerField(
        label='Economy Quantity',
        min_value=0,
        initial=0,
        required=False,
        widget=forms.NumberInput(attrs={'class': 'form-control form-icon-start'})
    )
    general_quantity = forms.IntegerField(
        label='General Quantity',
        min_value=0,
        initial=1,
        required=False,
        widget=forms.NumberInput(attrs={'class': 'form-control form-icon-start'})
    )
    vip_quantity = forms.IntegerField(
        label='VIP Quantity',
        min_value=0,
        initial=0,
        required=False,
        widget=forms.NumberInput(attrs={'class': 'form-control form-icon-start'})
    )

    class Meta:
        model = Booking
        fields = (
            'full_name', 'event', 'email',  'phone',
            'economy_quantity', 'general_quantity', 'vip_quantity'
        )

    def clean(self):
        cleaned_data = super().clean()
        economy = cleaned_data.get("economy_quantity") or 0
        general = cleaned_data.get("general_quantity") or 0
        vip = cleaned_data.get("vip_quantity") or 0
        event = cleaned_data.get("event")  # Booking should have FK to Event

        # Ensure at least one ticket is selected
        if economy == 0 and general == 0 and vip == 0  :
            raise forms.ValidationError("You must select at least one ticket.")

        # Ensure total cost is greater than zero
      

        return cleaned_data

        
        