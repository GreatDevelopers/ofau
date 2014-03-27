"""
%% views.py %%

This file is used to create the views for the software. 
It is the interface between the user interface, urls and database.
"""

from ofau.tcc.header import *
from datetime import datetime
import itertools

from django.views.decorators.cache import patch_cache_control
from functools import wraps
def stop_caching(decorated_function):
    @wraps(decorated_function)
    def wrapper(*args, **kwargs):
        response = decorated_function(*args, **kwargs)
        patch_cache_control(response, no_cache=True, no_store=True,
                            max_age=0, must_revalidate=True)
        return response
    return wrapper

def home(request):
	'''
	** index **
	
	This is to have different views for different type of users. Like 
	here we have 2 types of users :one which is active,staff and is 
	superuser is the superuser of the software. The one who is just 
	active is the normal user. Depending upon there status different 
	views are created in index1.html and index2.html respectively. 
	'''

	id = Job.objects.aggregate(Max('job_no'))
	maxid = id['job_no__max']
	''' 
	id is assigned the max value of job_no which is an attribute of relation Job.
	id gets an array in result and max value is actually stored in id['job_no__max']  
	'''

	if maxid == None :
		maxid = 1
	else:
		maxid = maxid + 1
	''' 
	we want to insert job after the maximum job no that's already in database, so we
	increment the maxid here.
	'''
	template = {'maxid':maxid,}
	if request.user.is_staff == 1 and request.user.is_active == 1 and \
	request.user.is_superuser == 1:
		return render_to_response('staff_home.html',dict(template.items() + 
		tmp.items()),context_instance=RequestContext(request))
	elif request.user.is_staff == 0 and request.user.is_active == 1 \
	and request.user.is_superuser == 0 :
		try:
   			use = request.user
			client = UserProfile.objects.get(user_id = use)
			clients = client.id
			template ={'clients':clients,'maxid':maxid,}
			return render_to_response('non-staff_home.html',dict(template.items() 
			+ tmp.items()), context_instance=RequestContext(request))
		except UserProfile.DoesNotExist:
   			return render_to_response('non-staff_home.html',dict(template.items()  
   			+ tmp.items()), context_instance=RequestContext(request))
	else:
		return render_to_response('index.html', tmp ,context_instance = 
		RequestContext(request))

@login_required
def edit_profile(request):
	"""
	** edit_profile **
	
	This function firstly checks whether the user has already got a
	profile or not. If it already has, then he is offered an already
	built profile to edit, however in other case when the profile is
	not built, user is allowed to fill an empty userprofile form.
	"""
	user = User.objects.get(id=request.GET['id'])
	try :
		maxid = UserProfile.objects.get(user_id=user)
		if request.method == "POST":
			form = UserProfileForm(request.POST,instance=maxid)
			if form.is_valid():
				pro = form.save(commit=False)
				pro.user = request.user
				pro.save()
				form.save()	
				x = {'form': form, 'maxid':maxid}
				return render_to_response('tcc/new_client_ok.html', 
				dict(x.items() + tmp.items()), context_instance=
				RequestContext(request))
		else:	
			form = UserProfileForm(instance=maxid)
		x = {'form': form,}
		return render_to_response('tcc/client.html',dict(x.items() + 
		tmp.items()), context_instance = RequestContext(request))
	except:
		if request.method == "POST":
			form = UserProfileForm(request.POST)
			if form.is_valid():
				pro = form.save(commit=False)
				pro.user = request.user
				pro.save()
				form.save()	
				x = {'form': form,}
				return render_to_response('tcc/new_client_ok.html', 
				dict(x.items() + tmp.items()), context_instance=
				RequestContext(request))
		else:	
			form = UserProfileForm()
		x = {'form': form,}
		return render_to_response('tcc/client.html',dict(x.items() + 
		tmp.items()), context_instance = RequestContext(request))

@login_required
def view_profile(request):
	"""
	** view_profile **
	
	This function firstly checks whether the client has already got a
	profile or not. If it already has, then he is offered an already
	built profile to edit, however in other case when the profile is
	not built, client's new profile will be made.
	"""
	client = request.GET['id']
	maxid = UserProfile.objects.get(id = client)
	if request.method == "POST":
		form = UserProfileForm(request.POST,instance=maxid)
		if form.is_valid():
			pro = form.save(commit=False)
			pro.user = request.user
			pro.save()
			form.save()	
			x = {'form': form, 'maxid':maxid}
			return render_to_response('tcc/new_client_ok.html', 
			dict(x.items() + tmp.items()), context_instance=
			RequestContext(request))
	else:	
		form = UserProfileForm(instance=maxid)
	x = {'form': form,}
	return render_to_response('tcc/client.html',dict(x.items() + 
	tmp.items()), context_instance = RequestContext(request))

@stop_caching	
@login_required
def profile(request):
	"""
	** profile **

	This function is used to make the user fill the personal detail. 
	If a normal user fills the detail, then his userprofile get updated, 
	but if a superuser creates a profile that means he/she is 
	registering the client and registration of client can be done as m
	any times as possible.
	"""
	if request.method == 'POST':
		form = UserProfileForm(request.POST)
		if form.is_valid():
			cd = form.cleaned_data
			user = request.user
			first_name = cd['first_name']
			middle_name = cd['middle_name']
			last_name = cd['last_name']
			company = cd['company']
			address = cd['address']
			city = cd['city']
			pin_code = cd['pin_code']
			state = cd['state'] 
			website = cd['website']
			contact_no = cd['contact_no']
			type_of_organisation = cd['type_of_organisation']
			email_address = cd ['email_address']
			'''pro = form.save(commit=False)
			pro.user = request.user
			pro.save()
			form.save()'''

			
			
			# "K" For implementing phonetic with spaces using python lists.
			if middle_name == "":
				if last_name == "":
					full_name = first_name 
				else:
					full_name = first_name + ' ' + last_name
			elif last_name == "":
				full_name = first_name + ' ' + middle_name 
			else:
				full_name = first_name + ' ' + middle_name + ' ' + last_name #concatenation
			k = full_name.split() #splitting when space is encountered
			exist = CodeTable.objects.all()    #fetching all values from CodeTable name
			lists = [ soundex(x) for x in k ]
			for x, y in itertools.izip(k, lists):
				word = x
				code = y
				flag = 0  # flag for checking condtion: word already exist
				for z in exist:
					if word == z.word:  
						flag = 1        #set flag=1 if word already exist
					else:
						continue
				if flag == 1:   # if flag is 1 then check next value otherwise generate code
					continue 
				else:
					coded = CodeTable(word = word, code = code)
					coded.save()  
				

			pro = UserProfile(first_name = first_name.title(), middle_name =
			middle_name.title(), last_name = last_name.title(), company = company.title(), 
			address = address, city = city.title(), pin_code = pin_code, state 
			= state, website = website, contact_no = contact_no, 
			type_of_organisation = type_of_organisation, email_address = 
			email_address, user = user)
			pro.save()
			id = UserProfile.objects.aggregate(Max('id'))
			maxid =id['id__max']	
			x = {'form': form,'maxid':maxid,}	
			return render_to_response('tcc/new_client_ok.html',dict(x\
			.items() + tmp.items()), context_instance=RequestContext(\
			request))
	else:
		form = UserProfileForm()
	form = {'form':form}
	if request.user.is_staff == 1 and request.user.is_active == 1 and \
	request.user.is_superuser == 1:
		return render_to_response('tcc/new_client.html',dict(form.items() + 
		tmp.items()),context_instance=RequestContext(request))
	else :
		return render_to_response('tcc/client/addprofile.html', dict(\
		form.items()+ tmp.items()), context_instance=
		RequestContext(request))

def list_search(request):
	"""
	**Phonetic search for list values**
	It is a function which fetches a list entered by user and finds similar
	matching words from database.
	"""
	query_string = ''
	found_entries =[] 
	if ('q' in request.GET) and request.GET['q']:
		query_string = request.GET['q']
		k = query_string.split()
		lists = [ soundex(x) for x in k ]
		B = []
		
#"K'		for code in lists:
#   			words = CodeTable.objects.filter(code=code)
#  			B.extend([words])	
#		#for i in range(0, len(B)):
#		for code in B:
#				entry_query = get_query(code, ['first_name', 'middle_name'
#			'last_name', 'address','city'])
		try: #try block added to handle 'no client found' condition 
			for code in lists:
				words = CodeTable.objects.filter(code=code)
				#code = CodeTable.objects.get(id = words)        
				#code_word = code.word
				for value in words:
					entry = value.word 
					entry_query = get_query(entry, ['first_name', 'middle_name',
					'last_name', 'address','city'])
					entry = UserProfile.objects.filter(entry_query).order_by('date')
					flag = 0 
					"""
					checking if entry aleady exist in found_entries by comparing id
					"""
					for entries in entry:
						for lists in found_entries:
							for values in lists:
								if entries.id == values.id:
									flag = 1
									break
								else:
									continue
					if flag == 1:
						continue
					else:								
						found_entries.append(entry)
				
			"""	entry_query = get_query(code_word, ['first_name', 'middle_name',
				'last_name', 'address','city'])
				entry = UserProfile.objects.filter(entry_query).order_by('date')
				found_entries.append(entry)"""
		except Exception:
			found_entries = []
#	return HttpResponse("You're voting on poll")
	temp = {'query_string': query_string, 'found_entries' : found_entries}
	return render_to_response('tcc/list_results.html', dict(temp.items() + tmp.items()),
	context_instance=RequestContext(request))

@stop_caching
@login_required
def non_payment_job(request):
	"""
	** non_payment_job **

	This function displays the form to fill the non payment job, that
	means the job that describes the work to be done without making
	any payment.
	"""
	id = NonPaymentJob.objects.aggregate(Max('job_no'))
	maxid =id['job_no__max']
	if maxid== None :
		maxid = 1
	else:
		maxid = maxid + 1
	user = UserProfile.objects.get(id=request.GET['id'])
	id=request.GET['id']
	if request.method == 'POST':
		form = NonPaymentJobForm(request.POST)
		if form.is_valid():
			profile = form.save(commit=False)
			profile.client= user
			profile.job_no = maxid
			profile.save()
			form.save_m2m()
			x = {'form': form, 'user': id}		
			return render_to_response('tcc/nonpayment_job_ok.html',
			dict(x.items() + tmp.items()), context_instance=
			RequestContext(request))
	else:
		form = NonPaymentJobForm()
	form = {'form':form, 'maxid':maxid}
	return render_to_response('tcc/non_payment_job.html',dict(form.\
	items() + tmp.items()),context_instance=RequestContext(request))

@stop_caching	
@login_required
def performa(request):
	"""
	** performa **

	Gives the detailed view of profile filled by client. Just the data 
	is extracted from UserProfile table.
	"""
	user = User.objects.get(id=request.GET['id'])
	try :
		perf = UserProfile.objects.filter(user_id=user)
		temp = {'perf' : perf, 'user':user,}
		return render_to_response('tcc/client/detail.html',dict(temp.\
		items() +tmp.items()), context_instance=RequestContext(request))
	except:
		return render_to_response("tcc/profile_first.html", tmp, 
		context_instance=RequestContext(request) )

@stop_caching
@login_required
def previous(request):
	"""
	** previous **

	This function lists the previous jobs of the user who have logged 
	in the software. Just filters the jobs done by user from the Job 
	table.
	"""
	user = User.objects.get(id=request.GET['id'])
	try :
		previous = UserProfile.objects.get(user_id=user)
		job = Job.objects.all().filter(client_id = previous)
		temp = {'job':job,}
		return render_to_response('tcc/previous.html', dict(temp.items() + 
		tmp.items()), context_instance=RequestContext(request))
	except:
		return render_to_response("tcc/profile_first.html", tmp, 
		context_instance=RequestContext(request))

'''
@login_required
def advanced_payment(request):
	try : 
		client =UserProfile.objects.get(id=request.GET['id'])
		add = Clientadd.objects.aggregate(Max('id'))   
		addid =add['id__max']
		if addid == client:
			pass
		else:
			user = request.user
			m = Clientadd(client = client,user=user)
			m.save()
		
		return render_to_response('tcc/typeofwork.html', 
		dict(temp.items() + tmp.items()), context_instance=RequestContext(request))
	except Exception:
		return render_to_response('tcc/profile_first.html',tmp, context_instance 
		= RequestContext(request))'''

@stop_caching
def material(request):
	"""
	** material **

	Material Function lists all the materials or field works. These are the 
	links, depending on the selection of material selected, there tests are 
	filtered.
	"""
	material = Material.objects.all().order_by('name')
	return render_to_response('tcc/field.html', tmp, context_instance = 
	RequestContext(request))

@stop_caching
def rate(request):
	"""
	** rate **

	Rate Function gets the value of material(that was selected 
	previously) from the url and based on that material, the tests 
	are listed.
	"""
	lab = Lab.objects.all().order_by('code')
	mate = Material.objects.get(id=request.GET['id'])
	test = Test.objects.filter(material_id = mate)
	temp = {'lab':lab,'test':test,'mate':mate,}
	return render_to_response('tcc/test.html', dict(temp.items() + 
	tmp.items()),context_instance=RequestContext(request))

@stop_caching	
@login_required
def selectfield(request):
	"""
	** selectfield **

	List the type of work to be done i.e Lab or Field work. It also
	checks the url, if the url shows jobno as empty, then job_no is
	incremented in clientadd table else it is assubed that new work is
	added to same job_no and thus the job_no in clientadd remains
	same.
	"""
	try : 
		client =UserProfile.objects.get(id=request.GET['id'])
		user = request.user
		jobno = request.GET.get('job','')
		if jobno =='':
			id = Bill.objects.aggregate(Max('id'))
			maxid =id['id__max']
			get_last_jobno = Bill.objects.get(id = maxid)
			last_jobno = get_last_jobno.job_no
			if last_jobno== None :
				last_jobno = 1
			else:
				last_jobno = last_jobno + 1
		else:
			last_jobno = jobno
		m = Clientadd(client = client,user=user,job_no=last_jobno)
		m.save()
		client = Clientadd.objects.aggregate(Max('id'))
		client =client['id__max']
		temp = {'client':client}
		return render_to_response('tcc/typeofwork.html', 
		dict(temp.items() + tmp.items()), context_instance=
		RequestContext(request))
	except Exception:
		return render_to_response('tcc/profile_first.html',tmp, 
		context_instance = RequestContext(request))

@stop_caching
@login_required
def select(request):
	"""
	** select **

	List down the materials or the field work depending on the 
	selection of the type of work i.e lab or Field work. However is
	the report_type is 3 or 4 means, the work to be done is CDF or
	advances payment, then the form for the same is opened to be
	filled.
	"""	
	material = Report.objects.get(id=request.GET['id'])
	client = Clientadd.objects.get(id=request.GET['client'])
	clid = client.id
	report = material.id
	if report == 3 or report == 4 or report == 6:
		if request.method=='POST':
			form1 = AdvancedForm(request.POST)
			form2 = BillForm(request.POST)
			if form1.is_valid and form2.is_valid():
				def clean_name(self):
					cleaned_data = self.cleaned_data
					net_total = cleaned_data.get('net_total', '')
					balance = cleaned_data.get('net_total', '')
				profile = form1.save(commit=False)
				id = Bill.objects.aggregate(Max('job_no'))
				maxid =id['job_no__max']
				if maxid== None :
					maxid = 1
				else:
					maxid = maxid + 1
				profile.job_no = maxid
				profile.ip = request.META.get('REMOTE_ADDR')
				profile.client = client
				profile.report_type = material
				profile.save()
				form1.save_m2m()
				profile1 = form2.save(commit=False)		
				profile1.job_no = maxid
				profile1.save()
				form2.save_m2m()
				id = Bill.objects.aggregate(Max('id'))
				maxid =id['id__max']
				bill = Bill.objects.get(id=maxid)
				bal = bill.net_total
				Bill.objects.filter(id = maxid).update( balance = 
				bill.net_total)
				temp = {'maxid':maxid}
				return render_to_response('tcc/advanced_ok.html', 
				dict(temp.items() + tmp.items()), context_instance=
				RequestContext(request))
		else:	
			form1 = AdvancedForm()
			form2 = BillForm()
		return render_to_response('tcc/advanced_job.html', tmp,
		context_instance=RequestContext(request))
	else :
		field_list = Material.objects.all().filter(report_id =material)
		temp = {'field_list':field_list, 'clid':clid}
		return render_to_response('tcc/tags.html',dict(temp.items() + 
		tmp.items()),context_instance = RequestContext(request))

@stop_caching
@login_required
def add_job(request):
	"""
	** add_job **

	This helps the user to add the job. Depending upon the material 
	selected the tests are listed then. Two forms are defined in a 
	single template file, so that there data get stored in different 
	tables one after the other. One is clientJob and other is
	SuspenceJob.
	"""
	query =request.GET.get('q', '')
	client = Clientadd.objects.get(id=request.GET['client'])
	clid = client.id
	maxid = client.job_no
	material =Material.objects.get(id=request.GET['q'])
	test = Test.objects.all().filter(material_id = query)
	if material.report.name == "LAB":
		field_list = Material.objects.all().filter(report_id = 1)
		if request.method=='POST':
			form1 = JobForm(request.POST)
			form2 = ClientJobForm(request.POST)
			if form1.is_valid and form2.is_valid():
				def clean_name(self):
					cleaned_data = self.cleaned_data
					pay = cleaned_data.get('pay', '')
					check_number = cleaned_data.get('check_number', '')
					check_dd_date = cleaned_data.get('check_dd_date', '')
					sample = cleaned_data.get('sample', '')
					letter_no = cleaned_data.get('letter_no','')
				profile = form1.save(commit=False)
				profile.job_no = maxid
				profile.ip = request.META.get('REMOTE_ADDR')
				profile.client = client
				report = Report.objects.get(id=1)
				profile.report_type = report
				profile.save()
				form1.save_m2m()
				test = request.POST.getlist('test')
				profile1 = form2.save(commit=False)		
				profile1.material = material
				jbmx = Job.objects.aggregate(Max('id'))
				jobmax =jbmx['id__max']
				job = Job.objects.get(id =jobmax)
				profile1.job = job
				profile1.save()
				form2.save_m2m()
				if profile.report_type == "2":
					return HttpResponseRedirect(reverse('ofau.tcc.views.add_suspence'))
				else :
					return HttpResponseRedirect(reverse('ofau.tcc.views.gen_report'))
		else:	
			form1 = JobForm()
			form2 = ClientJobForm()
		temp = {"form1":form1,"test":test,'field_list':field_list,'query':query,
		'clid':clid}
		return render_to_response('tcc/add_job.html', dict(temp.items() + 
		tmp.items()), context_instance=RequestContext(request))
	else :
		field_list = Material.objects.all().filter(report_id = 2)
		if request.method=='POST':
			form1 = JobForm(request.POST)
			form2 = SuspenceJobForm(request.POST)
  			if form1.is_valid and form2.is_valid():
				def clean_name(self):
					cleaned_data = self.cleaned_data
					pay = cleaned_data.get('pay', '')
					check_number = cleaned_data.get('check_number', '')
					check_dd_date = cleaned_data.get('check_dd_date', '')
					sample = cleaned_data.get('sample', '')
					letter_no = cleaned_data.get('letter_no','')
				profile = form1.save(commit=False)
				profile.job_no = maxid
				profile.ip = request.META.get('REMOTE_ADDR')
				profile.client = client
				report = Report.objects.get(id=2)
				profile.report_type = report
				profile.save()
				form1.save_m2m()
				profile1 = form2.save(commit=False)	
				profile1.job_no = maxid	
				profile1.field = material
				jbmx = Job.objects.aggregate(Max('id'))
				jobmax =jbmx['id__max']
				client = Job.objects.get(id =jobmax)
				profile1.job = client
				sel_test = get_object_or_404(Test, pk=request.POST.\
				get('test'))
				profile1.test = sel_test
				profile1.save()
				form2.save_m2m()
				return HttpResponseRedirect(reverse('ofau.tcc.views.add_suspence'))
		else:	
			form1 = JobForm()
			form2 = SuspenceJobForm()
			temp ={"form1": form1,"test":test,'field_list':field_list,
			'query':query}
			return render_to_response('tcc/add_suspence.html',
			dict(temp.items() + tmp.items()) , context_instance=
			RequestContext(request))

@stop_caching	
@login_required
def add_job_other_test(request):
	"""
	** add_job_other_test **

	This helps the user to add the job. Depending upon the material 
	selected the tests are listed then. Two forms are defined in a 
	single template file, so that there data get stored in different 
	tables one after the other.
	"""
	query =request.GET.get('q', '')
	id = Bill.objects.aggregate(Max('job_no'))
	maxid =id['job_no__max']
	if maxid== None :
		maxid = 1
	else:
		maxid = maxid + 1
	material =Material.objects.get(id=request.GET['q'])
	if material.report.name == "LAB":
		field_list = Material.objects.all().filter(report_id = 1)
		if request.method=='POST':
			form1 = JobForm(request.POST)
			form2 = ClientJobForm(request.POST)
			form3 = TestTotalForm(request.POST)
			if form1.is_valid and form2.is_valid() and form3.is_valid():
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
				cl = Clientadd.objects.aggregate(Max('id'))
				clientid =cl['id__max']
				clid = Clientadd.objects.get(id = clientid)
				profile.client = clid
				report = Report.objects.get(id=1)
				profile.report_type = report
				profile.save()
				form1.save_m2m()
				test = request.POST.getlist('test')
				profile1 = form2.save(commit=False)		
				profile1.material = material
				jbmx = Job.objects.aggregate(Max('id'))
				jobmax =jbmx['id__max']
				client = Job.objects.get(id =jobmax)
				profile1.job = client
				profile1.save()
				form2.save_m2m()
				profile2 = form3.save(commit=False)
				profile2.job = client
				profile2.save()
				form3.save_m2m()
				return HttpResponseRedirect(reverse('ofau.tcc.views.gen_report_other'))
		else:	
			form1 = JobForm()
			form2 = ClientJobForm()
			form3 = TestTotalForm()
		temp = {"form1": form1,'field_list':field_list,'query':query}
		return render_to_response('tcc/add_job_other_test.html',dict(\
		temp.items()+tmp.items()), context_instance=RequestContext(request))
	else :
		field_list = Material.objects.all().filter(report_id = 2)
		if request.method=='POST':
			form1 = JobForm(request.POST)
			form2 = SuspenceJobForm(request.POST)
			form3 = TestTotalForm(request.POST)
  			if form1.is_valid and form2.is_valid() and form3.is_valid():
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
				cl = Clientadd.objects.aggregate(Max('id'))
				clientid =cl['id__max']
				clid = Clientadd.objects.get(id = clientid)
				profile.client = clid
				report = Report.objects.get(id=2)
				profile.report_type = report
				profile.save()
				form1.save_m2m()
				profile1 = form2.save(commit=False)	
				profile1.job_no = maxid	
				profile1.field = material
				jbmx = Job.objects.aggregate(Max('id'))
				jobmax =jbmx['id__max']
				client = Job.objects.get(id =jobmax)
				profile1.job = client
				profile1.save()
				form2.save_m2m()
				profile2 = form3.save(commit=False)
				profile2.job = client
				dist =  Distance.objects.aggregate(Max('id'))
				distid =dist['id__max']
				site = Distance.objects.get(id=distid)
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
				return HttpResponseRedirect(reverse('ofau.tcc.views.gen_report_other'))
		else:	
			form1 = JobForm()
			form2 = SuspenceJobForm()
		temp ={"form1": form1,'field_list':field_list,'query':query}
		return render_to_response('tcc/add_job_other_test.html',dict(\
		temp.items() + tmp.items()), context_instance=
		RequestContext(request))

@stop_caching
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
			unit_price =int(client.other)*int(values.cost)+int(values.\
			quantity)
	else:
		unit_price = values.cost
	job = Job.objects.aggregate(Max('id'))
	jobmaxid = job['id__max']
	clients = Job.objects.get(id=jobmaxid)
	price = unit_price*int(clients.sample)
	job = clients
	p = TestTotal(unit_price=price, job=job,)
	p.save()
	dist =  Distance.objects.aggregate(Max('id'))
	distid =dist['id__max']
	site = Distance.objects.get(id=distid)
	distance = 2*site.sandy
	report_type = "Suspence" 
	if distance < 100 and distance != 0:
		rate = 1000
	elif distance == 0:
		rate = 0
	else :
		rate = 10*distance
	m = Suspence(rate=rate, sus=client,job=job)
	m.save()
	amt = Amount(job = job ,unit_price=price,report_type = report_type,)
	amt.save()
	return HttpResponseRedirect(reverse('ofau.tcc.views.job_submit'))

@stop_caching
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
	gen = ClientJob.objects.aggregate(Max('id'))
	genid =gen['id__max']
	clients = ClientJob.objects.get(id =genid)
	value = ClientJob.objects.values_list('test').filter(id=genid)
	values = Test.objects.values_list('cost',flat=True).filter(id__in 
	= value)
	price = sum(values)
	unit_price = price*int(client.sample)
	p = TestTotal(unit_price=unit_price, job=client,)
	p.save()
	if client.pay == "cash" and client.tds == 0:
		report_type = "General_report"
		from ofau.tcc.variable import *
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
	return HttpResponseRedirect(reverse('ofau.tcc.views.job_submit'))

@stop_caching	
def gen_report_other(request):
	"""
	** gen_report_other **

	For the Jobs whose material or work type doesn't match with all
	that defined in the software, there is an option provided i.e
	other work or material. It means one can himself define the work
	type and amount for it.
	"""
	job = Job.objects.aggregate(Max('id'))
	jobmaxid = job['id__max']
	client = Job.objects.get(id=jobmaxid)
	gen = ClientJob.objects.aggregate(Max('id'))
	genid =gen['id__max']
	clients = ClientJob.objects.get(id =genid)
	testmax = TestTotal.objects.aggregate(Max('id'))
	testmaxid =testmax['id__max']
	testmax_id = TestTotal.objects.get(id =testmaxid)
	unit_price = testmax_id.unit_price
	if client.pay == "cash" and client.tds == 0 and client.report_type == 1:
		report_type = "General_report"
		from ofau.tcc.variable import *
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
		=admin_charge, consultancy_asst=consultancy_asst,report_type 
		= report_type)
		m.save()
	else:
		report_type = "Suspence"
		sus = Suspence(rate=0,job=client)
		sus.save()
		amt = Amount(job = client ,unit_price=unit_price,report_type 
		= report_type,)
		amt.save()
	return HttpResponseRedirect(reverse('ofau.tcc.views.job_submit'))

@stop_caching
def job_submit(request):
	"""
	** job_submit **

	The view to ensure that job is successfully saved.
	"""
	if request.user.is_staff == 0 and request.user.is_active == 1 and \
	request.user.is_superuser == 0 :
		use = request.user
		client = UserProfile.objects.get(user_id = use)
		clients = client.id
	if request.user.is_staff == 1 and request.user.is_active == 1 and \
	request.user.is_superuser == 1:
		id = UserProfile.objects.aggregate(Max('id'))
		clients =id['id__max']
	job = Job.objects.aggregate(Max('id'))
	jobmaxid = job['id__max']
	client = Job.objects.get(id=jobmaxid)
	value = client.report_type_id
	jobno = client.job_no
	add = Clientadd.objects.aggregate(Max('id'))    # this is in case one clicks on adding more material into a job
	addid =add['id__max']
	more = Clientadd.objects.get(id=addid)
	moremat = more.client_id
	temp = {'clients':clients,'value':value,'moremat':moremat,'jobno'
	:jobno}
	return render_to_response('tcc/job_submit.html',dict(temp.items() + 
	tmp.items()), context_instance=RequestContext(request))

@stop_caching	
@login_required
def job_ok(request):
	"""
	** job_ok **

	This is to do the calculation of taxes on the total amount of a 
	job. The calculation of tax on an amount depend on several
	factors on which it depend, like tranportation charges, discount,
	tds amount etc.
	"""
	material =request.GET.get('id', '')
	id = Job.objects.aggregate(Max('id'))
	maxid =id['id__max']
	last_job_no = Job.objects.get(id=maxid)
	get_job_no = last_job_no.job_no
	date = last_job_no.date
	value =Job.objects.values_list('testtotal__unit_price',flat=True)\
	.filter(job_no=get_job_no).filter(date=date)
	price = sum(value)
	from ofau.tcc.variable import *
	try:
		trans_value = Job.objects.values_list('suspence__rate',flat=\
		True).filter(job_no=get_job_no).filter(date=date)
		trans_total = sum(trans_value)
		discount_value = Job.objects.values_list('discount',flat=True)\
		.filter(job_no=get_job_no).filter(date=date)
		discount_total = sum(discount_value)
		trans_net_total = price + trans_total - discount_total
		service_tax= round(servicetax *  trans_net_total)
		education_tax = round(educationtax *  trans_net_total)
		higher_education_tax = round(highereducationtax *  
		trans_net_total)
		net_total =  trans_net_total + higher_education_tax +\
		education_tax + service_tax
		bal = Job.objects.values_list('tds',flat=True).\
		filter(job_no=get_job_no).filter(date=date)
		tdstotal = sum(bal)
		balance = net_total - tdstotal
		m = Bill(job_no = get_job_no, price = price, service_tax=service_tax, 
		higher_education_tax = higher_education_tax, education_tax = 
		education_tax, net_total = net_total, date = date, balance = 
		balance,trans_total=trans_total,trans_net_total=trans_net_total,
		discount_total=discount_total)
	except Exception:
		discount_value = Job.objects.values_list('discount',flat=True).\
		filter(job_no=get_job_no).filter(date=date)
		discount_total = sum(discount_value)
		trans_net_total = price - discount_total
		service_tax= round(servicetax *  trans_net_total)
		education_tax = round(educationtax *  trans_net_total)
		higher_education_tax = round(highereducationtax *  
		trans_net_total)
		net_total =  trans_net_total + higher_education_tax +\
		education_tax + service_tax
		bal = Job.objects.values_list('tds',flat=True).\
		filter(job_no=get_job_no).filter(date=date)
		tdstotal = sum(bal)
		balance = net_total - tdstotal
		m = Bill(job_no = get_job_no, price = price, service_tax=service_tax, 
		higher_education_tax = higher_education_tax, education_tax = 
		education_tax, net_total = net_total,  date = date,balance = balance, 
		discount_total=discount_total,trans_net_total=trans_net_total,)
	m.save()
	amt = Job.objects.filter(job_no=get_job_no).values('amount__report_type').\
	filter(date=date)
	temp = {"maxid":get_job_no,'amt':amt}
	if request.user.is_staff == 1 and request.user.is_active == 1 and \
	request.user.is_superuser == 1 :
		return HttpResponseRedirect('job_ok_show')
	else :
		return HttpResponseRedirect('client_job_ok_show')

@stop_caching
def job_ok_show(request):
	material =request.GET.get('id', '')
	id = Job.objects.aggregate(Max('id'))
	maxid =id['id__max']
	job = Job.objects.get(id=maxid)
	last_job_no = job.job_no
	date=job.date
	amt = Job.objects.filter(job_no=last_job_no).filter(date=date).\
	values('amount__report_type')
	temp = {"maxid":last_job_no,'amt':amt}
	return render_to_response('tcc/job_ok.html',dict(temp.items() + 
		tmp.items()), context_instance=RequestContext(request))

@stop_caching
def client_job_ok_show(request):
	id = Job.objects.aggregate(Max('id'))
	maxid =id['id__max']
	job = Job.objects.get(id=maxid)
	last_job_no = job.job_no
	date=job.date
	amt = Job.objects.filter(job_no=last_job_no).filter(date=date).\
	values('amount__report_type')
	temp = {"maxid":last_job_no,'amt':amt}
	return render_to_response('tcc/client_job_ok.html', dict(temp.items() + 
		tmp.items()), context_instance=RequestContext(request))

@stop_caching	
@login_required
def get_documents(request):
	"""
	** get_documents **

	This shows the different documents once the job is completely 
	filled and is asked to generate bill. Depending upon the type of 
	user the documents are provided to the user. The various documents
	are Receipt, Voucher and Bill.
	"""
	id = Job.objects.aggregate(Max('job_no'))
	maxid =id['job_no__max']
	amt = Job.objects.filter(job_no=maxid).values('amount__report_type')
	temp = {"maxid":maxid,'amt':amt}
	if request.user.is_staff == 1 and request.user.is_active == 1 and \
	request.user.is_superuser == 1 :
		return render_to_response('tcc/job_ok.html', dict(temp.items() 
		+ tmp.items()), context_instance=RequestContext(request))
	else :
		return render_to_response('tcc/client_job_ok.html',dict(temp.\
		items() + tmp.items()), context_instance=RequestContext(request))

@stop_caching		
#@login_required
def bill(request):
	"""
	** bill **

	This shows the bill in HTML format. All the taxes, amount, materials 
	tested are defined. There are 2 deifferent templates for Gneral
	report and supence works.
	"""
	try :
		job =Job.objects.get(id=request.GET['id'])
	except Exception:
		id = Job.objects.aggregate(Max('id'))
		maxid =id['id__max']
		job = Job.objects.get(id = maxid)
	jobid = job.id
	job_no = job.job_no
	job_date =job.date
	getjob = Job.objects.all().filter(job_no=job_no).filter(date=job_date).\
	values(	'clientjob__material__name','date','testtotal__unit_price','site',
	'suspencejob__field__name','report_type', 'clientjob__other_test',
	'clientjob__material__matcomment_id','suspencejob__field__matcomment_id',
	'sample','letter_no','letter_date', 'suspencejob__other',
	'clientjob__material__id','suspencejob__field__id',
	'suspencejob__other_test',).distinct()
	testname = Job.objects.all().filter(job_no=job_no).filter(date=job_date).values(
	'clientjob__test__name','clientjob__test__material',
	'suspencejob__test__material','suspencejob__test__name' ).distinct()
	gettest = Job.objects.all().filter(job_no=job_no).filter(date=job_date).values(
	'clientjob__material__test__name','clientjob__material__id',
	'clientjob__material__test__name')
	getadd = Job.objects.all().filter(id = jobid).values(
	'client__client__first_name', 'client__client__middle_name', 
	'client__client__last_name','client__client__address', 
	'client__client__city', 'client__client__company',
	'client__client__state','site',).distinct()
	from ofau.tcc.variable import *
	get_bill_id = Bill.objects.filter(job_no=job_no).filter(date=job_date).\
	values('id')
	bill = Bill.objects.get(id=get_bill_id)
	matcomment= MatComment.objects.all()
	servicetaxprint = servicetaxprint
	educationtaxprint = educationtaxprint
	highereducationtaxprint = highereducationtaxprint
	net_total1 = bill.net_total
	from ofau.tcc.convert_function import *
	net_total_eng = num2eng(net_total1)
	template = {'job_no': job_no ,'net_total_eng':net_total_eng,
	'servicetaxprint':servicetaxprint,'highereducationtaxprint':
	highereducationtaxprint,'educationtaxprint':educationtaxprint,
	'bill':bill, 'job' : job, 'net_total1' : net_total1, 'getjob' : 
	getjob, 'getadd' : getadd,'job_date':job_date,'gettest':gettest,
	'testname':testname,'matcomment':matcomment}
	amtid = Amount.objects.aggregate(Max('id'))
	amtmaxid =amtid['id__max']
	amt = Amount.objects.get(job_id = jobid)
	if amt.report_type == "General_report" :
		return render_to_response('tcc/bill.html', dict(template.\
		items() + tmp.items()), context_instance = RequestContext(request))
	else :
		return render_to_response('tcc/suspence_bill.html', dict(\
		template.items() + tmp.items()), context_instance = 
		RequestContext(request))

@stop_caching
def suspence_bill(request):
	try :
		job =Job.objects.get(id=request.GET['id'])
	except Exception:
		id = Job.objects.aggregate(Max('id'))
		maxid =id['id__max']
		job = Job.objects.get(id = maxid)
	jobid = job.id
	job_no = job.job_no
	job_date =job.date
	getjob = Job.objects.all().filter(job_no=job_no).filter(date=job_date).\
	values('clientjob__material__name','date','testtotal__unit_price','site',
	'suspencejob__field__name','report_type', 'clientjob__material__matcomment_id',
	'suspencejob__field__matcomment_id','sample','letter_no','letter_date', 
	'suspencejob__other','clientjob__material__id',
	'suspencejob__field__id').distinct()
	testname = Job.objects.all().filter(job_no=job_no).filter(date=job_date).\
	values('clientjob__test__name','clientjob__test__material',
	'suspencejob__test__material','suspencejob__test__name' ).distinct()
	gettest = Job.objects.all().filter(job_no=job_no).filter(date=job_date).\
	values('clientjob__material__test__name','clientjob__material__id',
	'clientjob__material__test__name')
	getadd = Job.objects.all().filter(id = jobid).values(
	'client__client__first_name', 'client__client__middle_name', 
	'client__client__last_name','client__client__address', 
	'client__client__city', 'client__client__company',
	'client__client__state','site',).distinct()
	from ofau.tcc.variable import *
	get_bill_id = Bill.objects.filter(job_no=job_no).filter(date=job_date).\
	values('id')
	bill = Bill.objects.get(id=get_bill_id)
	matcomment= MatComment.objects.all()
	servicetaxprint = servicetaxprint
	educationtaxprint = educationtaxprint
	highereducationtaxprint = highereducationtaxprint
	net_total1 = bill.net_total
	from ofau.tcc.convert_function import *
	net_total_eng = num2eng(net_total1)
	template = {'job_no': job_no ,'net_total_eng':net_total_eng,
	'servicetaxprint':servicetaxprint,'highereducationtaxprint':
	highereducationtaxprint,'educationtaxprint':educationtaxprint,
	'bill':bill, 'job' : job, 'net_total1' : net_total1, 'getjob' : 
	getjob, 'getadd' : getadd,'job_date':job_date,'gettest':gettest,
	'testname':testname,'matcomment':matcomment}
	amtid = Amount.objects.aggregate(Max('id'))
	amtmaxid =amtid['id__max']
	amt = Amount.objects.get(job_id = jobid)
	if amt.report_type == "General_report" :
		return render_to_response('tcc/bill.html', dict(template.\
		items() + tmp.items()), context_instance = RequestContext(request))
	else :
		return render_to_response('tcc/suspence_bill1.html', dict(\
		template.items() + tmp.items()), context_instance = RequestContext(request))

@stop_caching
def receipt_report(request):
	"""
	** receipt_report **

	View the Receipt In Html format. This shows the material tested 
	for the client and total amount for it.
	"""
	try :
		job =Job.objects.get(id=request.GET['id'])
	except Exception:
		id = Job.objects.aggregate(Max('id'))
		maxid =id['id__max']
		job = Job.objects.get(id = maxid)
	job_no = job.job_no
	jobid =job.id
	job_date = job.date
	client = Job.objects.all().filter(id = jobid).values(
	'client__client__first_name', 'client__client__middle_name', 
	'client__client__last_name','client__client__address', 
	'client__client__city','client__client__company')
	mate = Job.objects.all().filter(job_no=job_no).filter(date=job_date).\
	values('clientjob__material__name','suspencejob__field__name',
	'report_type','date','clientjob__material__matcomment_id',
	'suspencejob__field__matcomment_id').distinct()
	get_bill_id = Bill.objects.filter(job_no=job_no).filter(date=job_date).\
	values('id')
	bill = Bill.objects.get(id=get_bill_id)
	matcomment= MatComment.objects.all()
	balance = bill.balance
	net_total_eng = num2eng(balance)
	template = {'mate':mate, 'net_total_eng':net_total_eng,'client':
	client,'bill':bill,'job':job,'job_date':job_date,'matcomment':matcomment}
	return render_to_response('tcc/receipt.html',  dict(template.\
	items() + tmp.items()), context_instance = RequestContext(request))

@stop_caching	
#@login_required
def additional(request):
	"""
	** additional **

	This functions displays the additional information that describes
	all the taxes information.
	"""
	
	from ofau.tcc.variable import *
	try :
		job =Job.objects.get(id=request.GET['id'])
	except Exception :
		id = Job.objects.aggregate(Max('id'))
		maxid =id['id__max']
		job = Job.objects.get(id = maxid)
	job_no = job.job_no
	job_date = job.date
	get_bill_id = Bill.objects.filter(job_no=job_no).filter(date=job_date).\
	values('id')
	bill = Bill.objects.get(id=get_bill_id)
	template = {'job':job,'job_no': job_no ,'bill':bill,'servicetaxprint' : servicetaxprint,
	'highereducationtaxprint' : highereducationtaxprint,'educationtaxprint'
	:educationtaxprint,}
	return render_to_response('tcc/additional.html',dict(template.items() + tmp.items()), 
	context_instance = RequestContext(request))

@stop_caching		
#@login_required
def s_report(request):
	"""
	** s_report **

	This shows the suspence voucher in HTML format. All the taxes, 
	amount, materials tested are defined.
	"""
	try :
		job =Job.objects.get(id=request.GET['id'])
	except Exception:
		id = Job.objects.aggregate(Max('id'))
		maxid =id['id__max']
		job = Job.objects.get(id = maxid)
	jobid = job.id
	job_no = job.job_no
	job_date = job.date
	getjob = Job.objects.all().filter(job_no=job_no).filter(date=job_date).\
	values('clientjob__material__name','testtotal__unit_price','site',
	'suspencejob__field__name','report_type','sample','pay',
	'check_number','check_dd_date','clientjob__material__matcomment_id',
	'suspencejob__field__matcomment_id').distinct()
	getadd = Job.objects.all().filter(id = jobid).values(
	'client__client__first_name', 'client__client__middle_name', 
	'client__client__last_name','client__client__address', 
	'client__client__city', 'client__client__state','site','letter_no',
	'letter_date','client__client__company').distinct()
	from ofau.tcc.variable import *
	get_bill_id = Bill.objects.filter(job_no=job_no).filter(date=job_date).\
	values('id')
	bill = Bill.objects.get(id=get_bill_id)
	bal = Job.objects.values_list('tds',flat=True).filter(job_no=job_no).\
	filter(date=job_date)
	tdstotal = sum(bal)
	net_total1 = bill.balance
	from ofau.tcc.convert_function import *
	net_total_eng = num2eng(net_total1)
	template = {'job_no': job_no ,'servicetaxprint' : servicetaxprint,
	'net_total_eng':net_total_eng,'highereducationtaxprint' : 
	highereducationtaxprint,'educationtaxprint':educationtaxprint,
	'bill':bill, 'job' : job, 'jobid':jobid,'getjob' : getjob, 
	'getadd' : getadd,'tdstotal':tdstotal,'job_date':job_date,}
	return render_to_response('tcc/suspence_report.html',dict(template.\
	items() + tmp.items()), context_instance = RequestContext(request))

@stop_caching	
def g_report(request):
	"""
	** g_report **

	g_report Function shows the total vouchers generated in a job.
	"""
	tmp = material_site()
	id = Job.objects.aggregate(Max('job_no'))
	maxid =id['job_no__max']
	amt = Job.objects.filter(job_no = maxid)
	temp =  {'amt':amt}
	return render_to_response('tcc/get_report.html',dict(temp.items() + 
	tmp.items()), context_instance=RequestContext(request))	


@stop_caching	
#@login_required	
def rep(request):
	"""
	** rep **

	Rep Function Displays the voucher in html format. This dispays the 
	all the distributions with there amount like college incomee, 
	admincharge, etc.
	"""
	from ofau.tcc.variable import *
	query =request.GET.get('id')
	client = TestTotal.objects.all().get(job_id =query)
	amount = Amount.objects.all().get(job_id =query)
	user = Job.objects.all().get(id=query)
	job = user.job_no
	job_date = user.date
	get_bill_id = Bill.objects.filter(job_no=job).filter(date=job_date).\
	values('id')
	bill = Bill.objects.get(id=get_bill_id)
	name = Job.objects.all().filter(id=query).values(\
	'client__client__first_name', 'client__client__middle_name', 
	'client__client__last_name','client__client__address',
	'client__client__city','client__client__company','pay',
	'check_number','check_dd_date','clientjob__material__matcomment_id',
	'suspencejob__field__name') 
	try:
		use = ClientJob.objects.all().get(job_id=query)
		mate = use.material.name
		lab = use.material.lab_id
		con_type = use.material.distribution.name
	except Exception:
		use = SuspenceJob.objects.all().get(job_id=query)
		mate = use.field.name
		lab = use.field.lab_id
		con_type = use.field.distribution.name
	staff = Staff.objects.all().filter(lab_id = lab)
	ratio1 = ratio1(con_type)
	ratio2 = ratio2(con_type)
	net_total = amount.unit_price
	from ofau.tcc.convert_function import *
	net_total_eng = num2eng(net_total)
	template = {'net_total_eng' : net_total_eng,'servicetaxprint':
	servicetaxprint,'highereducationtaxprint':highereducationtaxprint,
	'educationtaxprint':educationtaxprint,'client': client,'amount':
	amount,'con_type':con_type, 'ratio1':ratio1, 'ratio2':ratio2, 
	'collegeincome':collegeincome, 'admincharge' : admincharge, 'user'
	:user, 'name':name, 'mate':mate, 'staff':staff,'bill':bill,'job':job,
	'jobid':user}
	return render_to_response('tcc/report.html', dict(template.items() + 
	tmp.items()), context_instance = RequestContext(request))
	
def transport(request):
	"""
	** transport **

	Transport Function displays the form that get the information like 
	kilometeres travelled etc from the user to get the transportation 
	charges.
	"""
	if request.method == 'POST':
		form = TransportForm(request.POST)
		if form.is_valid():
			cd = form.cleaned_data
			job_no =cd['job_no']
			test_date =cd['test_date']
			kilometer =cd['kilometer']
			date =cd ['date']
			id = Transport.objects.aggregate(Max('id'))
			maxid =id['id__max']
			if maxid== None :
				maxid = 1
			else:
				maxid = maxid + 1
			bill_no = maxid
			#rate = cd ['rate']
			form.save()
			Transport.objects.filter(job_no = job_no).update( bill_no
			= maxid )
			data = {'job_no':job_no,'rate':rate, 'kilometer': kilometer,
			'bill_no':bill_no,'test_date':test_date}
			return render_to_response('tcc/trans.html', dict(data.\
			items()+tmp.items()),context_instance=RequestContext(request))
	else:
		form = TransportForm()
	temp = {'form': form}
	return render_to_response('tcc/client.html', dict(temp.items() + 
	tmp.items()),context_instance=RequestContext(request))

def transport_bill(request):
	"""
	** transport_bill **

	Transport Bill Function generates transport Bill
	"""
	transport_old = Transport.objects.get(job_no=request.GET['job_no'])
	job = Job.objects.get(id=request.GET['job_no'])
	client = Job.objects.filter(job_no =
	job.job_no).values('client__client__first_name',
	'client__client__middle_name', 'client__client__last_name','client__client__address','client__client__city')
	kilometer = transport_old.kilometer
	temp = [0,0,0,0,0,0,0,0,0,0]
	range = kilometer.split(',')
	i=0
	while i < len(range):
		temp[i] = range[i]
		i+=1
	rate = transport_old.vehicle.rate
	amount1 = int(temp[0])*rate
	amount2 = int(temp[1])*rate
	amount3 = int(temp[2])*rate
	amount4 = int(temp[3])*rate
	amount5 = int(temp[4])*rate
	amount6 = int(temp[5])*rate
	amount7 = int(temp[6])*rate
	amount8 = int(temp[7])*rate
	amount9 = int(temp[8])*rate
	amount10 = int(temp[9])*rate
	total = amount1 + amount2 + amount3 + amount4 + amount5 + amount6 + amount7 + amount8 + amount9 + amount10
	
	all_amounts = amount1,amount2,amount3,amount4,amount5,amount6,
	amount7,amount8,amount9,amount10
	net_balance_eng = num2eng(total)
	Transport.objects.filter(job_no = transport_old.job_no).update(\
	total = total, amounts = all_amounts )
	transport = Transport.objects.get(job_no=transport_old.job_no)
	template ={'transport':transport, 'rate':rate, 'client':client, 'net_balance_eng':net_balance_eng,}
	return render_to_response('tcc/transportbill.html',dict(template.\
	items() + tmp.items()) , context_instance=RequestContext(request))


@login_required
def ta_da(request):
	"""
	** ta_da **

	Ta_Da Function displays the form for filling the Transport and Daily 
	Allowance charges for a Job.
	"""
	query = request.GET.get('q', '')
	try :
		sus = Suspence.objects.get(job=query)
	except Exception:	
		sus =[]
	if request.method == 'POST':
		form = TadaForm(request.POST)
		if form.is_valid():
			cd = form.cleaned_data
			test_date =cd['test_date']
			end_date =cd['end_date']
			reach_site =cd['reach_site']
			profile = form.save(commit=False)
			jobid = Job.objects.get(id=query)
			profile.job = jobid
			profile.save()
			return HttpResponseRedirect(reverse(\
			'ofau.tcc.views.tada_view'))
	else:
		form = TadaForm()
	temp = {'form': form,'query':query,'sus':sus}
	return render_to_response('tcc/suspenceclear.html', dict(temp.\
	items() + tmp.items()), context_instance=RequestContext(request))

def tada_view(request):
	"""
	** tada_view **
	Tada_view function confirms that tada is saved.', '')
	try :
	"""
	id = TaDa.objects.aggregate(Max('id'))
	maxid =id['id__max']
	tada = TaDa.objects.all().get(id=maxid)
	data = {'tada':tada }			
	return render_to_response('tcc/tada_ok.html', dict(data.items() + 
	tmp.items()), context_instance=RequestContext(request))

def ta_da_bill(request):
	"""
	** ta_da_bill **

	Report of TA/DA Bill For Particular Date.
	"""
	tada = TaDa.objects.get(job=request.GET['job'],test_date=request.\
	GET['test_date'])
	job = Job.objects.get(id=request.GET['job'])
	c = job.id
	client = Job.objects.filter(id=c).values('client__client__first_name','client__client__address','client__client__city')
	lab_staff = tada.testing_staff_code
        t1=0
        temp = [0,0,0,0,0,0,0,0,0,0]
	range = lab_staff.split(',')
	i=0
	while i < len(range):
		temp[i] = range[i]
		i+=1
	amount1 = temp[0]
	amount2 = temp[1]
	amount3 = temp[2]
	amount4 = temp[3]
	amount5 = temp[4]
	amount6 = temp[5]
	amount7 = temp[6]
	amount8 = temp[7]
	amount9 = temp[8]
	amount10 = temp[9]
	
	staff =Staff.objects.all().filter(Q(code=amount1)| Q(code=amount2) 
	| Q(code=amount3) | Q(code=amount4) | Q(code=amount5) | Q(code=\
	amount6) | Q(code=amount7)| Q(code=amount8) | Q(code=amount9) | 
	Q(code=amount10)).order_by('id') 
	daily_income = Staff.objects.filter(Q(code=amount1)| Q(code=\
	amount2) | Q(code=amount3) | Q(code=amount4) | Q(code=amount5) | 
	Q(code=amount6) | Q(code=amount7)| Q(code=amount8)| Q(code=amount9) 
	| Q(code=amount10)).aggregate(Sum('daily_income'))
	daily = int(daily_income['daily_income__sum']) 
	net_balance_eng = num2eng(daily)
	TaDa.objects.filter(job = tada.job).update( tada_amount = daily )
	data = {'tada':tada,'job':job,'staff':staff,  'daily':daily,
	'client':client,'net_balance_eng':net_balance_eng}
	return render_to_response('tcc/ta_da_bill.html', data , 
	context_instance = RequestContext(request))

def search_transport(request):
	query = request.GET.get('q', '')
	if query :
		results = Transport.objects.filter(job_no = query).values()
		results1 = TaDa.objects.filter(job = query).values()
	else:
		results = []
		results1 = []
	temp = {"results": results,"results1": results1,"query": query,}
	return render_to_response("tcc/search_transport.html", 
	dict(temp.items() + tmp.items()), context_instance=RequestContext(request) )
def distance(request):
	"""
	** distance **

	Distance Function is for calculation of distance of the site on 
	the map. This displays a form fo filling the site.
	"""
	mee = Job.objects.aggregate(Max('id'))
	jobid =mee['id__max']
	if jobid== None :
		jobid = 1
	else:
		jobid = jobid +1
	if request.method =='POST':
		form = DistanceForm(request.POST)
  		if form.is_valid():
			cd = form.cleaned_data
			sandy = cd['sandy']
			profile = form.save(commit=False)
			profile.job = jobid
			profile.save()
			return render_to_response('tcc/map_ok.html',tmp, 
			context_instance = RequestContext(request))
	else:
  		form = DistanceForm()
	return render_to_response('tcc/siteinmap.html', {"form": form,}, 
	context_instance=RequestContext(request))

def clientreport(request):
	"""
	** clientreport **

	Retrieves out the bill or receipt on demand for a particular job.
	"""
	query =request.GET.get('q', '')
	if query:
		job = Job.objects.filter(job_no = query).values('id', 
		'client__client__first_name', 'client__client__address', 
		'client__client__city', 'clientjob__material__name',
		'report_type', 'suspencejob__field__name', 'site', 
		'testtotal__unit_price','amount__report_type').order_by('id').distinct()
		amt = Job.objects.filter(job_no=query).values(\
		'amount__report_type')
		bill = Bill.objects.filter(job_no=query)
		temp = {'job':job,'query':query,'amt':amt,'bill':bill}
	else:	
		job =[]
		temp = {'job':job,'query':query,}
	return render_to_response('tcc/clientreport.html',dict(temp.items() 
	+ tmp.items()),context_instance=RequestContext(request))
	
def suspence_clearance(request):
	"""
	** suspence_clearance **

	Suspence Clearance Function clears the suspence work. It has the 
	form for filling the extra charges. 
	"""
	query = request.GET.get('q', '')
	try :
		sus = Suspence.objects.get(job=query)
	except Exception:	
		sus =[]
	if request.method == 'POST':
		form = SuspenceClearence(request.POST)
		if form.is_valid():
			cd = form.cleaned_data
			labour_charge =cd['labour_charge']
			car_taxi_charge =cd['car_taxi_charge']
			boring_charge_external=cd['boring_charge_external']
			boring_charge_internal=cd['boring_charge_internal']
			lab_testing_staff=cd['lab_testing_staff']
			field_testing_staff =cd['field_testing_staff']
			test_date =cd['test_date']
			clear_date = cd['clear_date']
			job =query
			Suspence.objects.filter(job = job).update(labour_charge = 
			labour_charge, boring_charge_external=boring_charge_external, 
			boring_charge_internal = boring_charge_internal, 
			field_testing_staff = field_testing_staff, car_taxi_charge 
			= car_taxi_charge, lab_testing_staff = lab_testing_staff, test_date = test_date,
		 	clear_date = clear_date)
			data = {'job_no' : job, 'labour_charge':labour_charge, 
			'boring_charge_external' : boring_charge_external,
			'boring_charge_internal' : boring_charge_internal, 
			'car_taxi_charge' : car_taxi_charge, 'lab_testing_staff' : 
			lab_testing_staff, 'sus':sus,'test_date':test_date}
			return render_to_response('tcc/suspence_clearence_ok.html', 
			dict(data.items() + tmp.items()), context_instance=
			RequestContext(request))
	else:
		form = SuspenceClearence()
	temp ={'form': form,'query':query,'sus':sus}
	return render_to_response('tcc/suspenceclear.html', dict(temp.items() + 
	tmp.items()), context_instance=RequestContext(request))
	
def search_new(request):
	"""
	** search **
	Here's the new search.
	The function get_query is defined in funcions.py file
	"""
	query_string = ''
	found_entries = None
	if ('q' in request.GET) and request.GET['q'].strip():
		query_string = request.GET['q']
		entry_query = get_query(query_string, ['first_name', 'middle_name',
	'last_name', 'address','city'])
		found_entries = UserProfile.objects.filter(entry_query).order_by('date')
	temp = { 'query_string': query_string, 'found_entries': found_entries }
	return render_to_response('tcc/search_results.html', dict(temp.items() + tmp.items()), context_instance=
	RequestContext(request))
                          
@login_required
def search(request):
	"""
	** search **

	Search Function is used to search a client using his/her name, 
	type of work and address. The 'icontain' keyword is used 
	which 
	fetches all the rows that contain the query. THen the data related 
	to that client that is required is also enlisted.
	"""
	query = request.GET.get('q', '')
	addquery=request.GET.get('add', '')
	if query:
		qset = (
			Q(first_name__icontains=query) |
			Q(middle_name__icontains=query) |
			Q(last_name__icontains=query)
			
	   	)	
		aset = (
	     	Q(address__icontains=addquery)|
			Q(city__icontains=addquery)
		)
		results = UserProfile.objects.filter(aset).filter(qset).\
		distinct()
	else:
		results = []
	temp = {'results': results,'query': query,}
	return render_to_response("tcc/search.html", dict(temp.items() + 
	tmp.items()),context_instance=RequestContext(request))

def other_charge(request):
	client = Job.objects.get(id=request.GET['job_no'])
	job = Job.objects.filter(id=client.id).values('client__client__first_name',
	'client__client__middle_name','client__client__last_name',
	'client__client__address','client__client__city')
#	transport = Transport.objects.get(job_no=client.id)
	amount = Amount.objects.get(job=request.GET['job_no'])
	suspence = Suspence.objects.get(job=request.GET['job_no'])
	try:
		#tada = TaDa.objects.get(job=request.GET['job_no'])
		#tada_sum = tada.tada_amount
		
			tada = Job.objects.get(id=request.GET['job_no'])
			tada_amount = TaDa.objects.values_list('tada_amount' , flat=True).filter(job_id=tada.id)
			tada_sum = sum(tada_amount)
	except Exception:
		tada= []
		tada_sum = 0
	try:  
		transport = Transport.objects.get(job_no=client.id)                                                                              
		total = tada_sum + suspence.labour_charge + suspence.car_taxi_charge \
		+ suspence.boring_charge_external + transport.total
		other =suspence.labour_charge+suspence.car_taxi_charge \
		+ suspence.boring_charge_external + transport.total
	except Exception:
		transport = []
		total = tada_sum + suspence.labour_charge + suspence.car_taxi_charge \
		+ suspence.boring_charge_external
		other =suspence.labour_charge+suspence.car_taxi_charge \
		+ suspence.boring_charge_external
	total_temp =tada_sum+suspence.labour_charge+suspence.car_taxi_charge
	+ suspence.boring_charge_external
	total_final = other + tada_sum
	temp = {'transport' : transport, 'client' :client, 'amount': amount, 	'suspence':suspence,'tada_sum':tada_sum,'total_temp': total_temp, 'total' :total, 'other':other,'job':job, 'total_final':total_final}
	return render_to_response('tcc/other_charge_report.html', 
	dict(temp.items() + 
tmp.items()), context_instance=RequestContext(request))
	
def suspence_clearence_report(request):
	"""
	** suspence_clearance_report **

	This function generates the report for the suspence job after 
	clearing it. Here the split function splits out the staff code 
	entry to fetch its name from the tables.
	"""
	
	suspence = Suspence.objects.get(job=request.GET['job_no'])
	amount = Amount.objects.get(job=request.GET['job_no'])
	try:
		suspencejob = SuspenceJob.objects.get(job=request.GET['job_no'])
		con_type = suspencejob.field.distribution.name
	except Exception:
		suspencejob = ClientJob.objects.get(job=request.GET['job_no'])
		con_type = suspencejob.material.distribution.name
	client =Job.objects.get(id=request.GET['job_no'])
	clientname = Job.objects.filter(id=client.id).values(\
	'client__client__first_name','client__client__middle_name',
	'client__client__last_name','client__client__address', 'report_type',
	'client__client__city',	'suspencejob__field__name', 'clientjob__material__name')
	lab_staff = suspence.lab_testing_staff
        t1=0
        temp = [0,0,0,0,0,0,0,0,0,0]
	range = lab_staff.split(',')
	i=0
	while i < len(range):
		temp[i] = range[i]
		i+=1
	amount1 = temp[0]
	amount2 = temp[1]
	amount3 = temp[2]
	amount4 = temp[3]
	amount5 = temp[4]
	amount6 = temp[5]
	amount7 = temp[6]
	amount8 = temp[7]
	amount9 = temp[8]
	amount10 = temp[9]
	
	field_staff = suspence.field_testing_staff
	temp = [0,0,0,0,0,0,0,0,0,0]
	range = field_staff.split(',')
	i=0
	while i < len(range):
		temp[i] = range[i]
		i+=1
	amounts1 = temp[0]
	amounts2 = temp[1]
	amounts3 = temp[2]
	amounts4 = temp[3]
	amounts5 = temp[4]
	amounts6 = temp[5]
	amounts7 = temp[6]
	amounts8 = temp[7]
	amounts9 = temp[8]
	amounts10 = temp[9]
	staff =Staff.objects.all().filter(Q(code=amount1)|Q(code=amount2) 
	| Q(code=amount3) | Q(code=amount4) | Q(code=amount5) | Q(code=
	amount6) | Q(code=amount7)| Q(code=amount8)| Q(code=amount9) | \
	Q(code=amount10)| Q(code=amounts1)| Q(code=amounts2) | Q(code=
	amounts3) | Q(code=amounts4) | Q(code=amounts5) | Q(code=amounts6) 
	| Q(code=amounts7)| Q(code=amounts8)| Q(code=amounts9) | Q(code=
	amounts10)).order_by('id')
	from ofau.tcc.variable import *
	balance = amount.unit_price
	college_income = round(collegeincome * balance / 100.00)
	admin_charge = round(admincharge * balance / 100.00)
	balance_temp = balance - college_income - admin_charge 
	ratio1 = ratio1(con_type)
	ratio2 = ratio2(con_type)
	consultancy_asst = round(ratio1 * balance_temp / 100)
	development_fund = round(ratio2 * balance_temp / 100)
	net_total1 = amount.unit_price
	net_balance_eng = num2eng(net_total1)
	retrieve()
	Amount.objects.filter(job = client).update( college_income = 
	college_income, admin_charge = admin_charge, consultancy_asst = 
	consultancy_asst, development_fund = development_fund )
	data = {'transport' : transport, 'net_balance_eng' : 
	net_balance_eng, 'teachers' : staff, 'servicetaxprint' : 
	servicetaxprint, 'highereducationtaxprint':highereducationtaxprint, 
	'educationtaxprint' : educationtaxprint, 'ratio1' : ratio1, 
	'job_no' :client.job_no , 'ratio2' : ratio2, 'collegeincome' : collegeincome,
	 'admincharge' : admincharge, 'client' : client, 'amount' : amount, 
	 'suspence' : suspence, 'clientname' : clientname,'con_type':con_type}
	return render_to_response('tcc/suspence_clearence_report.html', 
	dict(data.items() + tmp.items()) , context_instance=
	RequestContext(request))
	
def suspence_clearence_report_transport(request):
	"""
	** suspence_clearance_report **

	This function generates the report for the suspence job after 
	clearing it. Here the split function splits out the staff code 
	entry to fetch its name from the tables.
	"""
	
	suspence = Suspence.objects.get(job=request.GET['job_no'])
	amount = Amount.objects.get(job=request.GET['job_no'])
	try:
		suspencejob = SuspenceJob.objects.get(job=request.GET['job_no'])
		con_type = suspencejob.field.distribution.name
	except Exception:
		suspencejob = ClientJob.objects.get(job=request.GET['job_no'])
		con_type = suspencejob.material.distribution.name
	client =Job.objects.get(id=request.GET['job_no'])
	clientname = Job.objects.filter(id=client.id).values(\
	'client__client__first_name','client__client__middle_name',
	'client__client__last_name','client__client__address', 'report_type',
	'client__client__city',	'suspencejob__field__name', 'clientjob__material__name')
	lab_staff = suspence.lab_testing_staff
        t1=0
        temp = [0,0,0,0,0,0,0,0,0,0]
	range = lab_staff.split(',')
	i=0
	while i < len(range):
		temp[i] = range[i]
		i+=1
	amount1 = temp[0]
	amount2 = temp[1]
	amount3 = temp[2]
	amount4 = temp[3]
	amount5 = temp[4]
	amount6 = temp[5]
	amount7 = temp[6]
	amount8 = temp[7]
	amount9 = temp[8]
	amount10 = temp[9]
	
	field_staff = suspence.field_testing_staff
	temp = [0,0,0,0,0,0,0,0,0,0]
	range = field_staff.split(',')
	i=0
	while i < len(range):
		temp[i] = range[i]
		i+=1
	amounts1 = temp[0]
	amounts2 = temp[1]
	amounts3 = temp[2]
	amounts4 = temp[3]
	amounts5 = temp[4]
	amounts6 = temp[5]
	amounts7 = temp[6]
	amounts8 = temp[7]
	amounts9 = temp[8]
	amounts10 = temp[9]
	staff =Staff.objects.all().filter(Q(code=amount1)|Q(code=amount2) 
	| Q(code=amount3) | Q(code=amount4) | Q(code=amount5) | Q(code=
	amount6) | Q(code=amount7)| Q(code=amount8)| Q(code=amount9) | \
	Q(code=amount10)| Q(code=amounts1)| Q(code=amounts2) | Q(code=
	amounts3) | Q(code=amounts4) | Q(code=amounts5) | Q(code=amounts6) 
	| Q(code=amounts7)| Q(code=amounts8)| Q(code=amounts9) | Q(code=
	amounts10)).order_by('id')
	testtotal= TestTotal.objects.get(job=request.GET['job_no'])                 #added for taking the amount of trans_total
	bill = Bill.objects.get(job_no=client.job_no)
	trans_total=bill.trans_total                                                #which will be added to testtoal_unit_price further.
	tried = testtotal.unit_price + bill.trans_total	               
	num_balance_eng = num2eng(testtotal.unit_price)
	try :
		transport=Transport.objects.get(job_no=client.id)
		tempr = suspence.labour_charge+transport.total+suspence.\
		boring_charge_external+suspence.car_taxi_charge
	except Exception :
		tempr = suspence.labour_charge + suspence.boring_charge_external + suspence.car_taxi_charge
	if request.GET['val']:                                            #done for getting total with and without tranportation charges
		try :
			tada = Job.objects.get(id=request.GET['job_no'])
		
			tada_amount = TaDa.objects.values_list('tada_amount' , flat=True).filter(job_id=tada.id)
			tada_sum = sum(tada_amount)
			balance= testtotal.unit_price - (tada_sum + tempr + suspence.boring_charge_internal)
		except Exception :
			tada =[]
			balance= testtotal.unit_price - (tempr + suspence.boring_charge_internal)
			tada_sum =0
		from ofau.tcc.variable import *
		work_charge = round(workcharge * balance / 100.00)
		college_income = round(collegeincome * balance / 100.00)
		admin_charge = round(admincharge * balance / 100.00)
		balance_temp = balance - college_income - admin_charge -work_charge
		ratio1 = ratio1(con_type)
		ratio2 = ratio2(con_type)
		consultancy_asst = round(ratio1 * balance_temp / 100)
		development_fund = round(ratio2 * balance_temp / 100)
		net_total1 = amount.unit_price
		net_balance_eng = num2eng(net_total1)
		net_balance_eng = num2eng(tried)                                                                          
		retrieve()
		Suspence.objects.filter(job = client).update( work_charge = 
		work_charge)
		Amount.objects.filter(job = client).update( college_income = 
		college_income, admin_charge = admin_charge, consultancy_asst = 
		consultancy_asst, development_fund = development_fund )
		data = {'transport' : transport, 'net_balance_eng' :                                              
		net_balance_eng, 'teachers' : staff, 'servicetaxprint' : 
		servicetaxprint, 'highereducationtaxprint':highereducationtaxprint, 
		'educationtaxprint' : educationtaxprint, 'ratio1' : ratio1, 
		'job_no' :client.job_no , 'ratio2' : ratio2, 'other' : tempr, 
		'collegeincome' : collegeincome, 'admincharge' : admincharge, 
		'client' : client, 'amount' : amount, 'suspence' : suspence, 
		'clientname' : clientname, 'tada_sum':tada_sum,'con_type':con_type,\
		'trans_total':trans_total,'tried':tried,'testtotal':testtotal,'num_balance_eng':num_balance_eng}		
		return render_to_response('tcc/suspence_clearence_report_without_transport.html',
		dict(data.items() + tmp.items()) , context_instance=
		RequestContext(request))
	else:
		try :
			tada = Job.objects.get(id=request.GET['job_no'])
			tada_amount = TaDa.objects.values_list('tada_amount' , flat=True).filter(job_id=tada.id)
			tada_sum = sum(tada_amount)
			balance= tried - (tada_sum + tempr + suspence.boring_charge_internal)
		except Exception :
			tada =[]
			balance= tried - (tempr + suspence.boring_charge_internal)
			tada_sum = 0
		from ofau.tcc.variable import *
		work_charge = round(workcharge * balance / 100.00)
		college_income = round(collegeincome * balance / 100.00)
		admin_charge = round(admincharge * balance / 100.00)
		balance_temp = balance - college_income - admin_charge -work_charge
		ratio1 = ratio1(con_type)
		ratio2 = ratio2(con_type)
		consultancy_asst = round(ratio1 * balance_temp / 100)
		development_fund = round(ratio2 * balance_temp / 100)
		net_total1 = amount.unit_price
		net_balance_eng = num2eng(net_total1)
		net_balance_eng = num2eng(tried)                                                                          
		retrieve()
		Suspence.objects.filter(job = client).update( work_charge = 
		work_charge)
		Amount.objects.filter(job = client).update( college_income = 
		college_income, admin_charge = admin_charge, consultancy_asst = 
		consultancy_asst, development_fund = development_fund )
		data = {'transport' : transport, 'net_balance_eng' :                                              
		net_balance_eng, 'teachers' : staff, 'servicetaxprint' : 
		servicetaxprint, 'highereducationtaxprint':highereducationtaxprint, 
		'educationtaxprint' : educationtaxprint, 'ratio1' : ratio1, 
		'job_no' :client.job_no , 'ratio2' : ratio2, 'other' : tempr, 
		'collegeincome' : collegeincome, 'admincharge' : admincharge, 
		'client' : client, 'amount' : amount, 'suspence' : suspence, 
		'clientname' : clientname, 'tada_sum':tada_sum,'con_type':con_type,\
		'trans_total':trans_total,'tried':tried,'testtotal':testtotal,'num_balance_eng':num_balance_eng}
		return render_to_response('tcc/suspence_clearence_report_transport.html',
		dict(data.items() + tmp.items()) , context_instance=
		RequestContext(request))
	
@stop_caching			
def prevwork(request):
	"""
	** prevwork **

	Prevwork function is used to list down all the previous jobs for 
	the client that was searched using search function. It also states 
	which suspence job is cleared and which is still to be cleared, 
	thus requiring the link to clear that job. The values with double 
	underscore indicates that foreign key values are fetched.		
	"""
	user = UserProfile.objects.get(id=request.GET['id'])
	client = user.id
	job = Job.objects.filter(client__client__id = client).values(
	'clientjob__material__name', 'suspencejob__field__name', 'id', 
	'job_no', 'date', 'site',	'amount__report_type', 'report_type', 
	'amount__college_income')
	data = {'user':user, 'job':job,}
	return render_to_response('tcc/prevwork.html',dict(data.items() + 
	tmp.items()), context_instance=RequestContext(request))
	
def clearjob(request):
	"""
	** clearjob **

	Clearjob Function points to the job that is to be cleared listing 
	all the necessary data that is required to be filled. 
	"""

	user = Job.objects.get(id=request.GET['job_id'])
	job = user.id
	temp = {'job':job}
	return render_to_response('tcc/compwork.html',dict(temp.items() 
	+ tmp.items()), context_instance=RequestContext(request))



def contact(request):
	"""
	** contact **

	The contact function defines the contact form that is to be filled
	and emailed	by user to give the feedback or to define the problem.
	"""
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
			template = {'form': form}
			return render_to_response('contact/thanks.html',
			dict(template.items() + tmp.items()), context_instance=
			RequestContext(request))
	else:
		form = ContactForm()
	temp ={'form': form}
	if request.user.is_staff == 1 and request.user.is_active == 1 and \
	request.user.is_superuser == 1:
		return render_to_response('contact/contact.html', dict(temp.\
		items() + tmp.items()), context_instance=RequestContext(request))
	elif request.user.is_staff == 0 and request.user.is_active == 1 and \
	request.user.is_superuser == 0 :
		return render_to_response('contact/contact1.html', dict(temp.\
		items()+tmp.items()), context_instance=RequestContext(request))
	else:
		return render_to_response('contact/contact2.html', dict(temp.\
		items()+tmp.items()), context_instance=RequestContext(request))
		
def registered_user(request):
	user_list=UserProfile.objects.all()
	temp = {'user_list': user_list}
	return render_to_response("tcc/registered_user.html", dict(temp.items() + 
	tmp.items()),context_instance=RequestContext(request))

def registered_user(request):
	user_list=UserProfile.objects.all()
	temp = {'user_list': user_list}
	return render_to_response("tcc/registered_user.html", dict(temp.items() + 
	tmp.items()),context_instance=RequestContext(request))
def programme(request):
	if request.method == 'POST':
		form = ProgrammeForm(request.POST)
		if form.is_valid():
			cd = form.cleaned_data		
		staff = request.POST.getlist('name')
		profile = form.save(commit=False)
       		profile.save()
       		form.save_m2m()
		staffmax = Programme.objects.aggregate(Max('id'))
        	staffid =staffmax['id__max']
        	staff = Programme.objects.filter(id=staffid).values('staff__name')
       		#temp = {'form':form,'staff':staff}
		organisation = Organisation.objects.all()
		department = Department.objects.all().filter(id = 1)		
		done = Programme.objects.all().filter(id=staffid).values('client_department_name', 'phone_no', 'on', 'at', 'addr', 			'city', 'site') 
		usermax = Programme.objects.aggregate(Max('id'))
		userid =usermax['id__max']		
		name_list = UserProfile.objects.all().filter(id=userid).values('first_name', 'last_name')
		id = Job.objects.aggregate(Max('id'))
		maxid =id['id__max']
		job = Job.objects.get(id = maxid)
	
		job_date =job.date
		amtid = Amount.objects.aggregate(Max('id'))
		amtmaxid =amtid['id__max']
		amt = Amount.objects.filter(id = amtmaxid).values('report_type')
		template = {'form': form, 'organisation':organisation,'department':department, 'done':done, 'staff':staff}
		return render_to_response('tcc/report11.html', template, context_instance=RequestContext(request))	
			
	else:
		form = ProgrammeForm()
	temp ={'form': form}
	return render_to_response('tcc/new_client.html',dict(temp.items() + 
	tmp.items()),context_instance=RequestContext(request))

