from django.urls import path

from . import views

app_name = 'form'
urlpatterns = [
    # /form/
    path('', views.index, name='index'),
    path('/success/', views.success, name='success')
]