from django.conf.urls.defaults import *
from django.views.generic import TemplateView
# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Example:
    (r'^$', 'Automation.tcc.views.index1'),
    (r'^hello', TemplateView,
                    { 'template': 'job_ok.html' }, ),
    (r'^tcc/', include('Automation.tcc.urls')),
    (r'^report/', include('Automation.report.urls')),
    # Uncomment the next line to enable the admin:
    (r'^admin/', include(admin.site.urls)),
    
    (r'^accounts/', include('registration.urls')),
   
)

