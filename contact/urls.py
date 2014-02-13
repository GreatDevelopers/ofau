from ofau.contact.forms import *
from django.conf.urls.defaults import *

urlpatterns = patterns("ofau.contact.views",
    (r"^contact(\d+)/$", "contact"),
)

