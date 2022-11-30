from django.core.exceptions import ValidationError
from django.http import HttpResponseRedirect
from django.shortcuts import render

from .forms import UserForm


# Create your views here.
def index(request):
    if request.method == 'POST':
        form = UserForm(request.POST)
        context = {'form': form}
        if form.is_valid():
            form.save()
            name = form.cleaned_data['first_name']
            surname = form.cleaned_data['last_name']
            date = form.cleaned_data['date']
            context2 = {'name': name, 'surname': surname, 'date': date}
            return render(request, 'form/success.html', context2)
        else:
            return render(request, "form/index.html", context)
    else:
        context = {'form': UserForm(None)}
        return render(request, 'form/index.html', context)


def success(request):
    return render(request, 'form/success.html')
