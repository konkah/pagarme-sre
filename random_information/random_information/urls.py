from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('random_information_api.urls')),
    path('', include('django_prometheus.urls')),
]
