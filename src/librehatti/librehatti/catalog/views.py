from django.http import HttpResponse
from django.shortcuts import render
from librehatti.catalog.models import *

def index(request):
	# we have to show all products
	error = {}

	# Collect all the categories first
	categorylist = category.objects.all()

	#Do we have categories
	if categorylist.count() == 0:
		nocategory = True
		return render(request, 'catalog.html', {'nocategory': nocategory})

	# Ok we have categories. Lets start showing products
	productlist = product.objects.all();

	# Do we have products
	if productlist.count():
		noproduct = True
		return render(request, 'catalog.html', {'noproduct': noproduct})
	pass