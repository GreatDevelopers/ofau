"""
%% functions.py %%

This file is defines some important functions that are then called views.py file.  
"""
from ofau.tcc.header import *
import re

from django.db.models import Q
#:::::::::::::::::::::::CONSTANTS:::::::::::::::::::::::::::::::::::#
individual_ratio1 = 60
individual_ratio2 = 40
institutional_ratio1 = 40
institutional_ratio2 = 60
routine_ratio1 = 30
routine_ratio2 = 70
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::#

#:::::::::::::::DEFINE THE FUNCTIONS HERE:::::::::::::::::::::::::::#

def retrieve():
	"""
	** retrieve **

	Retrieve function is used to retrieve the data defined in variable.py file
	"""

	from ofau.tcc.variable import *
	collegeincome = collegeincome
	admincharge = admincharge
	servicetaxprint = servicetaxprint
	educationtaxprint =educationtaxprint
	highereducationtaxprint = highereducationtaxprint

def dates(start_date, end_date):
	import datetime
	from django import forms
	if start_date > datetime.date.today() or end_date > datetime.date.today():
		raise forms.ValidationError("The date cannot be in the future!")
	elif end_date < start_date :
		raise forms.ValidationError("The start_date is greater than end_date!")
	else:
		pass

def ratio1(con_type):
	"""
	** ratio1 **
	
	ratio1 function is creates the numerator of the ratio depanding upon the consultancy(Individual, Routine) type of the work.
	"""

	if con_type == 'ROUTINE':
		ratio1 = routine_ratio1
		ratio2 = routine_ratio2
	elif con_type == 'INDIVIDUAL':
		ratio1 = individual_ratio1
		ratio2 = individual_ratio2
	else :
		ratio1 = institutional_ratio1
		ratio2 = institutional_ratio2
	return ratio1

def ratio2(con_type):
	"""
	** ratio2 **
	
	ratio2 function is creates the denomenator of the ratio depending upon the consultancy type of the work.
	"""

	if con_type == 'ROUTINE':
		
		ratio2 = routine_ratio2
	elif con_type == 'INDIVIDUAL':
		
		ratio2 = individual_ratio2
	else :
		ratio2 = institutional_ratio2
	return ratio2

def months(month):
	"""
	** months **
	
	months Function converts the months name to there number.
	"""
	if month =='November':
		month =11
	elif month == 'December':
		month =12
	elif month == 'October':
		month =10
	elif month == 'September':
		month =9
	elif month == 'August':
		month =8
	elif month == 'July':
		month =7
	elif month == 'June':
		month = 6
	elif month == 'May':
		month =5
	elif month == 'April':
		month =4
	elif month == 'March':
		month =3
	elif month == 'February':
		month =2
	else :
		month =1
	return month
	
def normalize_query(query_string,
	findterms=re.compile(r'"([^"]+)"|(\S+)').findall,
                    normspace=re.compile(r'\s{2,}').sub):
    ''' Splits the query string in invidual keywords, getting rid of unecessary spaces
        and grouping quoted words together.
        Example:
        
        >>> normalize_query('  some random  words "with   quotes  " and   spaces')
        ['some', 'random', 'words', 'with quotes', 'and', 'spaces']
    
    '''
    return [normspace(' ', (t[0] or t[1]).strip()) for t in findterms(query_string)] 

def get_query(query_string, search_fields):
    ''' Returns a query, that is a combination of Q objects. That combination
        aims to search keywords within a model by testing the given search fields.
    
    '''
    query = None # Query to search for every search term        
    terms = normalize_query(query_string)
    for term in terms:
        or_query = None # Query to search for a given term in each field
        for field_name in search_fields:
            q = Q(**{"%s__icontains" % field_name: term})
            if or_query is None:
                or_query = q
            else:
                or_query = or_query | q
        if query is None:
            query = or_query
        else:
            query = query & or_query
    return query

def soundex(name):                 # Added....
	"""Get the soundex code for the string"""
	name = name.upper() 
	soundex = "" 
	soundex += name[0] 
	dictionary = {"BFPV": "1", "CGJKQSXZ":"2", "DT":"3", "L":"4", "MN":"5", "R":"6", "AEIOUHWY":"."} 
	for char in name[1:]: 
		for key in dictionary.keys(): 
			if char in key: 
				code = dictionary[key] 
				if code != soundex[-1]:
					soundex += code 
	soundex = soundex.replace(".", "")
	soundex = soundex[:4].ljust(4, "0") 	
	return  soundex	

	
