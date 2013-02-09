from django.core.mail import send_mail
from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from Automation.contact.forms import *
from django.template import RequestContext
from django.core.urlresolvers import reverse

def contact(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            send_mail(
                cd['subject'],
                cd['message'],
                cd.get('email', 'noreply@example.com'),
                ['mkaurkhalsa@gmail.com'],
            )
            return render_to_response('contact/thanks.html', {'form': form}, context_instance=RequestContext(request))
    else:
        form = ContactForm()
    return render_to_response('contact/contact.html', {'form': form}, context_instance=RequestContext(request))


