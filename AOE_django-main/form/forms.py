from django.forms import ModelForm, widgets
from .models import User
import re


class UserForm(ModelForm):
    class Meta:
        model = User
        fields = '__all__'
        widgets = {
            'first_name': widgets.TextInput(attrs={'class':'form-control'}),
            'last_name': widgets.TextInput(attrs={'class':'form-control'}),
            'email': widgets.TextInput(attrs={'class':'form-control'}),
            'phone': widgets.TextInput(attrs={'class':'form-control'}),
            'date': widgets.DateInput(attrs={'class':'form-control'}),
        }

    def clean(self):
        super(UserForm, self).clean()
        email = self.cleaned_data.get('email')
        phone = self.cleaned_data.get('phone')

        email_regexp = re.compile(r'([A-Za-z0-9]+[.-_])*[A-Za-z0-9]+@[A-Za-z0-9-]+(\.[A-Z|a-z]{2,})+')
        phone_regexp = re.compile(r'|^\s*\(?\s*\d{1,4}\s*\)?\s*[\d\s]{5,10}\s*$|')

        if not re.fullmatch(email_regexp, email):
            self._errors['email'] = self.error_class(['Invalid email format'])

        if not re.fullmatch(phone_regexp, phone):
            self._errors['phone'] = self.error_class(['Invalid phone number format'])

        return self.cleaned_data


