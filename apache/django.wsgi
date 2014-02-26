import os
import sys

os.environ['DJANGO_SETTINGS_MODULE'] = 'ofau.settings'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
sys.path.append('/home/sandy/Documents/githubwork/great_dev/')

