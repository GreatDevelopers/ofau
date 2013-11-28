import datetime
from haystack import indexes
from Automation.tcc.models import *


class UserprofileIndex(indexes.SearchIndex, indexes.Indexable):
    	text = indexes.CharField(document=True, use_template=True)
	first_name = indexes.CharField(model_attr='first_name')
	
	def get_model(self):
	        return UserProfile
	
	#def index_queryset(self, using=None):
	 #       """Used when the entire index for model is updated."""
	  #      return self.get_model().objects.all()

