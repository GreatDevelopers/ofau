"""
%% Views_ext.py %%
This file is used to create the views for the software. 
In order to avoid the confusion with generating the temperory jobs and then making them permanents, a different views file is created.
"""

from Automation.tcc.header import *

def perf_distance(request):
	"""
	** distance **

	Distance Function is for calculation of distance of the site on the map. 
	This displays a form fo filling the site.
	"""
	mee = EditJob.objects.aggregate(Max('id'))
	jobid =mee['id__max']
	if jobid== None :
		jobid = 1
	else:
		jobid = jobid +1
	if request.method =='POST':
		form = DistanceperfForm(request.POST)
  		if form.is_valid():
			cd = form.cleaned_data
			sandy = cd['sandy']
			profile = form.save(commit=False)
			profile.job = jobid
			profile.save()
			return render_to_response('tcc/map_ok.html',tmp, context_instance = 
			RequestContext(request))
	else:
  		form = DistanceperfForm()
	return render_to_response('tcc/siteinmap.html', {"form": form,}, 
	context_instance=RequestContext(request))

@login_required
def perfselectfield(request):
	"""
	** perfselectfield **

	List the type of work to be done i.e Lab or Field work. Here, if the same client is making the slection 2 times then if condition is 		passed else the client is added in clientadd table.
	"""

	client =UserProfile.objects.get(id=request.GET['id'])
	add = editClientadd.objects.aggregate(Max('id'))    # this is in case one clicks on adding more material into a job
	addid =add['id__max']
	if addid == client:
		pass
	else:
		user = request.user
		m = editClientadd(client = client,user=user)
		m.save()
	report = Report.objects.all()
	mat = Material.objects.all()
	temp = {'report':report,'mat':mat}
	return render_to_response('tcc/performa/typeofworkperf.html',dict(temp.items() + 
	tmp.items()), context_instance=RequestContext(request))

@login_required
def perfselect(request):
	"""
	** perfselect **

	List down the materials or the field work depending on the selection of the type of work.
	"""	

	report = Report.objects.all()
	mat = Material.objects.all()
	material = Report.objects.get(id=request.GET['id'])
	field_list = Material.objects.all().filter(report_id =material)
	temp = {'field_list':field_list,'report':report,'mat':mat}
	return render_to_response('tcc/performa/tagsperf.html',dict(temp.items() + 
	tmp.items()), context_instance=RequestContext(request))

@login_required
def add_perf(request):
	"""
	** add_perf **

	This helps the user to add the job. Depending upon the material selected the tests are listed then. Two forms are defined in a single 		template file, so that there data get stored in different tables one after the other.
	"""

	report = Report.objects.all()
	query =request.GET.get('q', '')
	id = BillPerf.objects.aggregate(Max('job_no'))
	maxid =id['job_no__max']
	if maxid== None :
		maxid = 1
	else:
		maxid = maxid + 1
	work = Govt.objects.all()
	payment = Payment.objects.all()
	material =Material.objects.get(id=request.GET['q'])
	test = Test.objects.all().filter(material_id = query)
	if material.report_id == 1:
		field_list = Material.objects.all().filter(report_id = 1)
		if request.method=='POST':
			form1 = editJobForm(request.POST)
			form2 = editClientJobForm(request.POST)
			if form1.is_valid and form2.is_valid():
				def clean_name(self):
        				cleaned_data = self.cleaned_data
					pay = cleaned_data.get('pay', '')
					check_number = cleaned_data.get('check_number', '')
					check_dd_date = cleaned_data.get('check_dd_date', '')
					sample = cleaned_data.get('sample', '')
				profile = form1.save(commit=False)
				profile.job_no = maxid
				profile.ip = request.META.get('REMOTE_ADDR')
				cl = editClientadd.objects.aggregate(Max('id'))
				clientid =cl['id__max']
				clid = editClientadd.objects.get(id = clientid)
				profile.client = clid
				report = Report.objects.get(id=1)
				profile.report_type = report
				profile.save()
				form1.save_m2m()
				test = request.POST.getlist('test')
       				profile1 = form2.save(commit=False)		
				profile1.material = material
				jbmx = EditJob.objects.aggregate(Max('id'))
				jobmax =jbmx['id__max']
				client =EditJob.objects.get(id =jobmax)
				profile1.job = client
				profile1.save()
				form2.save_m2m()
				return HttpResponseRedirect(reverse('Automation.tcc.views_ext.gen_report_perf'))
		else:	
			form1 = editJobForm()
			form2 = editClientJobForm()
		temp ={"form1": form1,"test":test,'field_list':field_list,'payment':payment,'work':work,"report":report,'query':query}
		return render_to_response('tcc/performa/add_perf.html', dict(temp.items() + 
		tmp.items()), context_instance=RequestContext(request))
	else :
		field_list = Material.objects.all().filter(report_id = 2)
		if request.method=='POST':
			form1 = editJobForm(request.POST)
			form2 = editSuspenceJobForm(request.POST)
  			if form1.is_valid and form2.is_valid():
				def clean_name(self):
					cleaned_data = self.cleaned_data
					sample = cleaned_data.get('sample', '')
				profile = form1.save(commit=False)
				profile.job_no = maxid
				profile.ip = request.META.get('REMOTE_ADDR')
				cl = editClientadd.objects.aggregate(Max('id'))
				clientid =cl['id__max']
				clid = editClientadd.objects.get(id = clientid)
				profile.client = clid
				report = Report.objects.get(id=2)
				profile.report_type = report
				profile.save()
				form1.save_m2m()
				profile1 = form2.save(commit=False)	
				profile1.job_no = maxid	
				profile1.field = material
				jbmx = EditJob.objects.aggregate(Max('id'))
				jobmax =jbmx['id__max']
				client = EditJob.objects.get(id =jobmax)
				profile1.job = client
				sel_test = get_object_or_404(Test, pk=request.POST.get('test'))
				profile1.test = sel_test
				profile1.save()
				form2.save_m2m()
				return HttpResponseRedirect(reverse('Automation.tcc.views_ext.add_suspence_perf'))
		else:	
			form1 = editJobForm()
			form2 = editSuspenceJobForm()
		temp = {"form1": form1,"test":test,'field_list':field_list,'payment':payment,'work':work,"report":report,'query':query}
		return render_to_response('tcc/performa/add_suspence.html', dict(temp.items() + 
		tmp.items()), context_instance=RequestContext(request))
		
@login_required
def add_perf_other_test(request):
	"""
	** add_perf_other_test **

	This helps the user to add the job. Depending upon the material selected the 
	tests are listed then. Two forms are defined in a single template file, so 
	that there data get stored in different tables one after the other.
	"""
	query =request.GET.get('q', '')
	id = BillPerf.objects.aggregate(Max('job_no'))
	maxid =id['job_no__max']
	if maxid== None :
		maxid = 1
	else:
		maxid = maxid + 1
	material =Material.objects.get(id=request.GET['q'])
	if material.report.name == "LAB":
		field_list = Material.objects.all().filter(report_id = 1)
		if request.method=='POST':
			form1 = editJobForm(request.POST)
			form2 = editClientJobForm(request.POST)
			form3 = TestTotalPerfForm(request.POST)
			if form1.is_valid and form2.is_valid() and form3.is_valid():
				def clean_name(self):
					cleaned_data = self.cleaned_data
					sample = cleaned_data.get('sample', '')
					letter_no = cleaned_data.get('letter_no','')
					other_test = cleaned_data.get('other_test','')
					unit_price = cleaned_data.get('unit_price','')
				profile = form1.save(commit=False)
				profile.job_no = maxid
				profile.ip = request.META.get('REMOTE_ADDR')
				cl = editClientadd.objects.aggregate(Max('id'))
				clientid =cl['id__max']
				clid = editClientadd.objects.get(id = clientid)
				profile.client = clid
				report = Report.objects.get(id=1)
				profile.report_type = report
				profile.save()
				form1.save_m2m()
				test = request.POST.getlist('test')
				profile1 = form2.save(commit=False)		
				profile1.material = material
				jbmx = EditJob.objects.aggregate(Max('id'))
				jobmax =jbmx['id__max']
				client = EditJob.objects.get(id =jobmax)
				profile1.job = client
				profile1.save()
				form2.save_m2m()
				profile2 = form3.save(commit=False)
				profile2.job = client
				profile2.save()
				form3.save_m2m()
				return HttpResponseRedirect(reverse('Automation.tcc.views_ext.job_submit_perf'))
		else:	
			form1 = editJobForm()
			form2 = editClientJobForm()
			form3 = TestTotalPerfForm()
		temp = {"form1": form1,'field_list':field_list,'query':query}
		return render_to_response('tcc/performa/add_perf_other.html', dict(temp.items() + 
		tmp.items()), context_instance=RequestContext(request))
	else :
		field_list = Material.objects.all().filter(report_id = 2)
		if request.method=='POST':
			form1 = editJobForm(request.POST)
			form2 = editSuspenceJobForm(request.POST)
			form3 = TestTotalPerfForm(request.POST)
  			if form1.is_valid and form2.is_valid():
				def clean_name(self):
					cleaned_data = self.cleaned_data
					pay = cleaned_data.get('pay', '')
					check_number = cleaned_data.get('check_number', '')
					check_dd_date = cleaned_data.get('check_dd_date', '')
					sample = cleaned_data.get('sample', '')
					letter_no = cleaned_data.get('letter_no','')
					other_test = cleaned_data.get('other_test','')
					unit_price = cleaned_data.get('unit_price','')
				profile = form1.save(commit=False)
				profile.job_no = maxid
				profile.ip = request.META.get('REMOTE_ADDR')
				cl = editClientadd.objects.aggregate(Max('id'))
				clientid =cl['id__max']
				clid = editClientadd.objects.get(id = clientid)
				profile.client = clid
				report = Report.objects.get(id=2)
				profile.report_type = report
				profile.save()
				form1.save_m2m()
				profile1 = form2.save(commit=False)	
				profile1.job_no = maxid	
				profile1.field = material
				jbmx = EditJob.objects.aggregate(Max('id'))
				jobmax =jbmx['id__max']
				client = EditJob.objects.get(id =jobmax)
				profile1.job = client
				profile1.save()
				form2.save_m2m()
				profile2 = form3.save(commit=False)
				profile2.job = client
				dist =  Distanceperf.objects.aggregate(Max('id'))
				distid =dist['id__max']
				site = Distanceperf.objects.get(id=distid)
				distance = 2*site.sandy
				if distance < 100:
					rate = 1000
				elif distance == 0:
					rate = 0
				else :
					rate = 10*distance
				profile2.rate = rate
				profile2.save()
				form3.save_m2m()
				return HttpResponseRedirect(reverse('Automation.tcc.views_ext.job_submit_perf'))
		else:	
			form1 = editJobForm()
			form2 = editSuspenceJobForm()
			form3= TestTotalPerfForm()
		temp ={"form1": form1,'field_list':field_list,'query':query}
		return render_to_response('tcc/performa/add_perf_other.html',dict(temp.items() + 
		tmp.items()), context_instance=RequestContext(request))

def gen_report_perf(request):
	"""
	** gen_report_perf **

	The jobs which are non suspence comes here. Depending on the material type, it is given a type: Routine or Institutional.
	"""
	job = EditJob.objects.aggregate(Max('id'))
	jobmaxid = job['id__max']
	client = EditJob.objects.get(id=jobmaxid)
	gen = ClientEditJob.objects.aggregate(Max('id'))
	genid =gen['id__max']
	clients = ClientEditJob.objects.get(id =genid)
	value = ClientEditJob.objects.values_list('test').filter(id=genid)
	values = Test.objects.values_list('cost',flat=True).filter(id__in = value)
	price = sum(values)
	unit_price = price*int(client.sample)
	p = TestTotalPerf(unit_price=unit_price, job=client,rate=0)
	p.save()
	return HttpResponseRedirect(reverse('Automation.tcc.views_ext.job_submit_perf'))
	

def add_suspence_perf(request):
	"""
	** add_suspence_perf **

	The calculation for the price of the material to be tested is calculated here.
	"""

	mee = SuspenceEditJob.objects.aggregate(Max('id'))
	minid =mee['id__max']
	client = SuspenceEditJob.objects.get(id=minid)
	value = SuspenceEditJob.objects.values_list('test').filter(id=minid)
	values = Test.objects.get(id = value)
	if client.field.name == "Soil for BC":
		a = int(client.other) - 10
		b = int(client.other) - 20
		c = int(client.other) - 30
		if a > 0 and a < 10 and a < 20 and a<30:
			unit_price = a*int(values.cost)+int(values.quantity)
		elif b >= 0 and b < 10 and b <20: 
			unit_price = b*int(values.cost)+int(values.quantity)+9000
		elif c >= 0:
			unit_price = c*int(values.cost)+int(values.quantity)+12000
		else : 
			unit_price = int(client.other)*int(values.cost)+int(values.quantity)
	else:
		unit_price = values.cost
	job = EditJob.objects.aggregate(Max('id'))
	jobmaxid = job['id__max']
	clients = EditJob.objects.get(id=jobmaxid)
	price = unit_price*int(clients.sample)
	job = clients
	dist =  Distanceperf.objects.aggregate(Max('id'))
	distid =dist['id__max']
	site = Distanceperf.objects.get(id=distid)
	distance = 2*site.sandy
	report_type = "Suspence" 
	if distance < 100:
		rate = 1000
	elif distance == 0:
		rate = 0
	else :
		rate = 10*distance
	p = TestTotalPerf(unit_price=price, job=job,rate=rate)
	p.save()
	return HttpResponseRedirect(reverse('Automation.tcc.views_ext.job_submit_perf'))

def job_submit_perf(request):
	"""
	** job_submit_perf **

	The view to ensure that job is successfully saved.
	"""

	mee = EditJob.objects.aggregate(Max('id'))
	minid =mee['id__max']
	client = EditJob.objects.get(id=minid)
	value = client.report_type_id
	add = editClientadd.objects.aggregate(Max('id'))    # this is in case one clicks on adding more material into a job
	addid =add['id__max']
	more = editClientadd.objects.get(id=addid)
	moremat = more.client_id
	temp ={'mee':mee,'value':value,'moremat':moremat}
	return render_to_response('tcc/performa/job_submit.html',dict(temp.items() + 
		tmp.items()), context_instance=RequestContext(request))

@login_required
def job_ok_perf(request):
	"""
	** job_ok_perf **

	This is to do the calculation of taxes on the total amount of a job. 
	"""
	
	id = EditJob.objects.aggregate(Max('job_no'))
	maxid =id['job_no__max']
	job_no = maxid
	value = EditJob.objects.values_list('testtotalperf__unit_price',flat=True).\
	filter(job_no=maxid)
	price = sum(value)
	from Automation.tcc.variable import *
	try:
		trans_value = EditJob.objects.values_list('testtotalperf__rate',flat=True).\
		filter(job_no=maxid)
		trans_total = sum(trans_value)
		discount_value = EditJob.objects.values_list('discount',flat=True).\
		filter(job_no=maxid)
		discount_total = sum(discount_value)
		trans_net_total = price + trans_total - discount_total
		service_tax= round(servicetax *  trans_net_total)
		education_tax = round(educationtax *  trans_net_total)
		higher_education_tax = round(highereducationtax *  trans_net_total)
		net_total =  trans_net_total + higher_education_tax + education_tax + service_tax
		bal = EditJob.objects.values_list('tds',flat=True).\
		filter(job_no=maxid)
		tdstotal = sum(bal)
		balance = net_total - tdstotal
		m = BillPerf(job_no = job_no, price = price, service_tax=service_tax, 
		higher_education_tax = higher_education_tax, education_tax = education_tax, 
		net_total = net_total, balance = 
		balance,trans_total=trans_total,trans_net_total=trans_net_total,
		discount_total=discount_total)
	except Exception:
		discount_value = EditJob.objects.values_list('discount',flat=True).\
		filter(job_no=maxid)
		discount_total = sum(discount_value)
		trans_net_total = price - discount_total
		service_tax= round(servicetax *  trans_net_total)
		education_tax = round(educationtax *  trans_net_total)
		higher_education_tax = round(highereducationtax *  trans_net_total)
		net_total =  trans_net_total + higher_education_tax + education_tax + service_tax
		bal = EditJob.objects.values_list('tds',flat=True).\
		filter(job_no=maxid)
		tdstotal = sum(bal)
		balance = net_total - tdstotal
		m = BillPerf(job_no = job_no, price = price, service_tax=service_tax, 
		higher_education_tax = higher_education_tax, education_tax = education_tax, 
		net_total = net_total, balance = balance, discount_total=discount_total,
		trans_net_total=trans_net_total,)
	m.save()
	
	return HttpResponseRedirect(reverse('Automation.tcc.views_ext.get_document_perf'))
	
	'''value = TestTotalPerf.objects.values_list('unit_price',flat=True).filter(job_no=maxid)
	price = sum(value)
	from Automation.tcc.variable import *
	service_tax= round(servicetax *  price)
	education_tax = round(educationtax *  price)
	higher_education_tax = round(highereducationtax *  price)
	net_total =  price + higher_education_tax + education_tax + service_tax
	m = BillPerf(job_no = job_no, price = price, service_tax=service_tax, higher_education_tax=higher_education_tax,education_tax=education_tax,net_total=net_total)
	m.save()
	return HttpResponseRedirect(reverse('Automation.tcc.views_ext.get_document_perf'))'''
	
def get_document_perf(request):
	id = EditJob.objects.aggregate(Max('job_no'))
	maxid =id['job_no__max']
	temp = {'maxid':maxid}
	return render_to_response('tcc/performa/job_ok.html', dict(temp.items() + 
	tmp.items()), context_instance=RequestContext(request))

def get_performa_bill(request):
	"""
	** clientreport **

	Retrieves out the bill or receipt on demand for a particular job.
	"""
	query =request.GET.get('q', '')
	if query:
		job = EditJob.objects.filter(job_no = query).values('id', 
		'client__client__first_name', 'client__client__address', 
		'client__client__city', 'clienteditjob__material__name', 
		'suspenceeditjob__field__name', 'site', 'testtotalperf__unit_price')\
		.order_by('id').distinct()
	else:	
		job =[]
	temp = {'job':job,'query':query}
	return render_to_response('tcc/performa/get_performa_bill.html',dict(temp.items() + 
	tmp.items()),context_instance=RequestContext(request))
	
@login_required
def billperf(request):
	"""
	** billperf **

	This shows the bill in HTML format. All the taxes, amount, materials tested are defined.
	"""
	try :
		job =EditJob.objects.get(id=request.GET['id'])
	except Exception:
		id = EditJob.objects.aggregate(Max('id'))
		maxid =id['id__max']
		job = EditJob.objects.get(id = maxid)
	jobid = job.id
	job_no = job.job_no
	job_date = job.date
	getjob = EditJob.objects.all().filter(job_no=job_no).values(
	'clienteditjob__material__name','date','testtotalperf__unit_price','site',
	'suspenceeditjob__field__name','suspenceeditjob__other','report_type','sample',
	'clienteditjob__other_test','note').distinct()
	getadd = EditJob.objects.all().filter(id = jobid).values('client__client__first_name', 
	'client__client__middle_name', 'client__client__last_name',
	'client__client__address', 'client__client__city', 
	'client__client__state','site','letter_no','letter_date','date','note').distinct()
	from Automation.tcc.variable import *
	bill = BillPerf.objects.get(job_no=job_no)
	servicetaxprint = servicetaxprint
	educationtaxprint = educationtaxprint
	highereducationtaxprint = highereducationtaxprint
	net_total1 = bill.net_total
	from Automation.tcc.convert_function import *
	net_total_eng = num2eng(net_total1)
	template = {'job_no': job_no ,'net_total_eng':net_total_eng,'servicetaxprint'
	:servicetaxprint,'highereducationtaxprint':highereducationtaxprint,
	'educationtaxprint':educationtaxprint,'bill':bill, 'job':job, 'net_total1' : 
	net_total1, 'getjob' : getjob, 'getadd' : getadd,'job_date':job_date}
	query =request.GET.get('q', '')
	if query =="1" :
		return render_to_response('tcc/performa/bill.html', dict(template.items() + 
		tmp.items()) , context_instance=RequestContext(request))
	else:
		return render_to_response('tcc/performa/p_bill.html', dict(template.items() + 
		tmp.items()) , context_instance=RequestContext(request))
		
	

def search_job(request):
	"""
	** search_job **

	Search Job function searches the performa job, for which one wants 
	to get information about or want to confirm that job.
	"""
	query =request.GET.get('q', '')
	if query:
		job = EditJob.objects.all().filter(job_no=query).values
		('id','client__client__first_name','client__client__address',
		'client__client__city','clienteditjob__material__name',
		'suspenceeditjob__field__name','site','testtotalperf__unit_price')
	else :
		job=[]
	temp = {'job':job,'query':query}
	return render_to_response('tcc/performa/searchjob.html',dict(temp.items() + 
	tmp.items()),context_instance=RequestContext(request))



def edit_work(request):
	"""
	** edit_work **

	Edit Work function is used to edit or delete a particular performa job id and then confirm the job.
	"""

	job = EditJob.objects.get(id=request.GET['id'])
	jobid = job.id
	try:
		clientjob = ClientEditJob.objects.get(job=request.GET['id'])
		testtotal = TestTotalPerf.objects.get(job=request.GET['id'])
		if request.method == "POST":
			jform = JobForm(request.POST)
			sform = ClientJobForm(request.POST)
			tform = TestTotalForm(request.POST)
			if jform.is_valid() and sform.is_valid() and tform.is_valid():
				profile = jform.save(commit=False)
				id = Job.objects.aggregate(Max('job_no'))
				maxid =id['job_no__max']
				if maxid== None :
					maxid = 1
				else:
					maxid = maxid + 1
				client = job.client.client
				user=User.objects.get(id=1)
				c = Clientadd(user=user,client=client,job_no=maxid)
				c.save()
				clientid = Clientadd.objects.aggregate(Max('id'))
				clientmax =clientid['id__max']
				clientmaxid = Clientadd.objects.get(id = clientmax)
				profile.client=clientmaxid
				profile.job_no = maxid
				profile.report_type_id =1
				profile.save()
				test = request.POST.getlist('test')
				prof = sform.save(commit=False)
				getmax = Job.objects.aggregate(Max('id'))
				getjob =getmax['id__max']
				getj=Job.objects.get(id=getjob)
				prof.job = getj
				prof.material = clientjob.material
				prof.save()
				sform.save_m2m()
				prof1 = tform.save(commit=False)
				prof1.job = getj
				prof1.save()
				return HttpResponseRedirect(reverse('Automation.tcc.views_ext.gen_report'))
		else:	
			jform = JobForm(instance=job)
			sform = ClientjobForm(instance=clientjob)
			tform = TestTotalForm(instance=testtotal)
		temp = {'jform':jform,'sform':sform,'tform':tform}
		return render_to_response('tcc/performa/edit_job.html', 
		dict(temp.items() + tmp.items()), context_instance
		=RequestContext(request))	
	except Exception :
		suspencejob = SuspenceEditJob.objects.get(job=request.GET['id'])
		testtotal = TestTotalPerf.objects.get(job=request.GET['id'])
		if request.method == "POST":
			jform = JobForm(request.POST)
			sform = SuspenceJobForm(request.POST)
			tform = TestTotalForm(request.POST)
			if jform.is_valid() and sform.is_valid():
				profile = jform.save(commit=False)
				profile.client_id = job.client_id
				id = Job.objects.aggregate(Max('job_no'))
				maxid = id['job_no__max']
				if maxid == None :
					maxid = 1
				else:
					maxid = maxid + 1
				profile.job_no = maxid
				profile.report_type_id =2
				profile.save()
				prof = sform.save(commit=False)
				sel_test = get_object_or_404(Test, pk=request.POST.get('test'))
				prof.test = sel_test
				getmax = Job.objects.aggregate(Max('id'))
				getjob =getmax['id__max']
				getj=Job.objects.get(id=getjob)
				prof.job = getj
				prof.save()
				sform.save_m2m()
				prof1 = tform.save(commit=False)
				prof1.job = getj
				prof1.save()
				return HttpResponseRedirect(reverse('Automation.tcc.views_ext.add_suspence'))
		else:	
			jform = JobForm(instance=job)
			sform = SuspenceJobForm(instance=suspencejob)
			tform = TestTotalForm(instance=testtotal)
		temp = {'jform':jform,'sform':sform,'tform':tform}
		return render_to_response('tcc/performa/edit_job.html', dict(temp.items() + 
		tmp.items()) ,context_instance=RequestContext(request))
		
def gen_report(request):
	"""
	** gen_report **

	The lab works come here. Then depending upon the mode of payemnt
	of the Job, it is categorised as General Report work or Suspence
	work. The jobs whos mode of payment is cash and has 0 TDS amount
	are called General Report. All the other jobs are categorised as
	Suspence.
	"""
	job = Job.objects.aggregate(Max('id'))
	jobmaxid = job['id__max']
	client = Job.objects.get(id=jobmaxid)
	clients = ClientJob.objects.get(job_id =client.id)
	testtotal = TestTotal.objects.get(job_id =client.id)
	unit_price=testotal.unit_price
	if client.pay == "cash" and client.tds == 0:
		report_type = "General_report"
		from Automation.tcc.variable import *
		type =clients.material.distribution.name
		college_income = round(collegeincome * unit_price / 100.00)
		admin_charge = round(admincharge * unit_price / 100.00)
		temp =  unit_price - college_income - admin_charge
		ratio1 = ratio1(type)
		ratio2 = ratio2(type)
		consultancy_asst = round(ratio1 * temp / 100)
		development_fund = round(ratio2 * temp / 100)
		m = Amount(job = client ,unit_price=unit_price,development_fund
		=development_fund, college_income =college_income, admin_charge
		=admin_charge, consultancy_asst=consultancy_asst,report_type = 
		report_type)
		m.save()
	else:
		report_type = "Suspence"
		sus = Suspence(rate=0,job=client)
		sus.save()
		amt = Amount(job = client ,unit_price=unit_price,report_type 
		= report_type,)
		amt.save()
	return HttpResponseRedirect(reverse('Automation.tcc.views.job_submit'))
		
def add_suspence(request):
	"""
	** add_suspence **

	The calculation for the price of the material to be tested is 
	calculated here. The rate for the distance calculated is also
	calculated here and the same is put in the suspence table.
	"""
	susmax = SuspenceJob.objects.aggregate(Max('id'))
	minid =susmax['id__max']
	client = SuspenceJob.objects.get(id=minid)
	value = SuspenceJob.objects.values_list('test').filter(id=minid)
	values = Test.objects.get(id = value)
	dist =  Distance.objects.aggregate(Max('id'))
	distid =dist['id__max']
	site = Distance.objects.get(id=distid)
	distance = 2*site.sandy
	report_type = "Suspence" 
	if distance < 100:
		rate = 1000
	elif distance == 0:
		rate = 0
	else :
		rate = 10*distance
	m = Suspence(rate=rate, sus=client,job=job)
	m.save()
	amt = Amount(job = job ,unit_price=price,report_type = report_type,)
	amt.save()
	return HttpResponseRedirect(reverse('Automation.tcc.views.job_submit'))
