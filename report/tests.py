"""
This file demonstrates writing tests using the unittest module. These will pass
when you run "manage.py test".

Replace this with more appropriate tests for your application.
"""

from django.test import TestCase
from django.db import models


class SimpleTest(TestCase):
    def test_basic_addition(self):
        """
        Tests that 1 + 1 always equals 2.
        """
        self.assertEqual(1 + 1, 2)
'''
class SeparatedValuesField(models.TextField):
    __metaclass__ = models.SubfieldBase

    def __init__(self, *args, **kwargs):
        self.token = kwargs.pop('token', ',')
        super(SeparatedValuesField, self).__init__(*args, **kwargs)

    def to_python(self, value):
        if not value: return
        if isinstance(value, list):
            return value
        return value.split(self.token)

    def get_db_prep_value(self, value):
        if not value: return
        assert(isinstance(value, list) or isinstance(value, tuple))
        return self.token.join([unicode(s) for s in value])

    def value_to_string(self, obj):
        value = self._get_val_from_obj(obj)
'''



"""
Steel Sample( IS 1786, Fe 500)
"""
def Fe_500(request):
    # This class is used to make empty formset forms required
    class RequiredFormSet(BaseFormSet):
        def __init__(self, *args, **kwargs):
            super(RequiredFormSet, self).__init__(*args, **kwargs)
            for form in self.forms:
                form.empty_permitted = False

    job =Job.objects.get(id=request.GET['id'])
    Fe_500_FormSet = formset_factory(MS_1786_fe_500Form, max_num=30, formset=RequiredFormSet)

    if request.method == 'POST': # If the form has been submitted...
        form1 = ReportForm(request.POST) # A form bound to the POST data
        if form1.is_valid():
                cd = form1.cleaned_data
                profile = form1.save(commit=False)
                profile.job =job
                profile.save()

        # Create a formset from the submitted data
        Fe_500_formset = Fe_500_FormSet(request.POST, request.FILES)

        if form1.is_valid() and Fe_500_formset.is_valid():
           report = form1.save(commit=False)
           report.save()
           for form in Fe_500_formset.forms:
                Fe_500 = form.save(commit=False)
                Fe_500.Report_id = report
                Fe_500.ip_address = request.META['REMOTE_ADDR']
                Fe_500.save()

           #return HttpResponseRedirect('thanks') # Redirect to a 'success' page
           return HttpResponseRedirect(reverse('Automation.report.views.result_Fe_500'))
    else:
        report_form = ReportForm()
        Fe_500_formset = Fe_500_FormSet()

    # For CSRF protection
    c = {'report_form': report_form,
         'Fe_500_formset': Fe_500_formset,
        }
    c.update(csrf(request))
    return render_to_response('report/index.html', c)

def result_Fe_500(request):
	Id = MS_1786_fe_500.objects.aggregate(Max('Report_id'))
	ID = Id['Report_id__max']
	st = MS_1786_fe_500.objects.filter(Report_id = ID)
	Id = Report.objects.aggregate(Max('id'))
	ID = Id['id__max']
	Head = Report.objects.filter(id = ID)
      
	Id = Report.objects.aggregate(Max('job'))
	ID = Id['job__max']
	job = Report.objects.filter(job = ID)
	client = Job.objects.all().filter(id=ID).values('client__client__first_name',
	'client__client__middle_name', 'client__client__last_name',
	'client__client__address', 'client__client__city', 'date', 'letter_no',
	'letter_date','clientjob__material__name',)

	organisation = Organisation.objects.all().filter(id = 1)
	department = Department.objects.all().filter(id = 1)
	return render_to_response('report/MS_1786_fe_500.html', {'st': st, 'Head':Head, 	'organisation':organisation,'department':department,'client':client,},context_instance=RequestContext(request))
 


