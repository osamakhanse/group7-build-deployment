from django.contrib import admin
from django.urls import path, include
from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('form/', include('form.urls')),
    path('success/', include('form.urls')),
    path('admin/', admin.site.urls),
]
