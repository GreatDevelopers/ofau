#::::::::::::::IMPORT THE HEADER FILE HERE::::::::::::::::::::#
from django.http import HttpResponseRedirect,HttpResponse
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from django.core.urlresolvers import reverse
from django.db.models import Max ,Q, Sum
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.sessions.models import Session
from django.shortcuts import render
from django.db.models import F
from django import template
from tagging.models import Tag, TaggedItem
from Automation.tcc.choices import *
from Automation.tcc.models import *
from Automation.tcc.functions import *
from Automation.tcc.forms import *
from Automation.tcc.convert_function import *
from django.core.mail import send_mail          
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::#

#:::::::::::::::DEFINE THE FUNCTIONS HERE:::::::::::::::::::::#

def material_site():
	"""
	This function is to be used through out the functions in the file. 
	The	objects defined ere like the college name and the software 
	name is to be used by nearly all the templates of the software.
	"""
	material = Material.objects.all().filter(report=1)
	field = Material.objects.all().filter(report=2)
	title = Department.objects.get(id=1)	
	address = get_object_or_404(Organisation, pk='1')
	report = Report.objects.all()
	work = Govt.objects.all()
	payment = Payment.objects.all()
	mat = Material.objects.all()
	matcomment= MatComment.objects.all()
	template = {'material':material, 'field':field, 'title':title, 
	'address':address, 'report':report, 'work':work, 'payment':payment,
	'mat':mat, 'matcomment':matcomment}
	return template

tmp = material_site()

job = Job.objects.aggregate(Max('id'))
jobmaxid = job['id__max']

