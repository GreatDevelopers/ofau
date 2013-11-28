"""
File contains urls of the Report
"""
from django.conf.urls.defaults import *
from django.contrib import admin
from django.views.generic import TemplateView

"""
Urls of views.py
"""
urlpatterns = patterns('Automation.report.views',
	(r'^report/$', 'report'),
	(r'^chemical_analysis/$', 'chemical_analysis'),
	(r'^result_chem/$', 'result_chem'),
	(r'^result_cube/$', 'result_cube'),
	(r'^index/$', 'index'),
	(r'^water_test/$', 'water_test'),
	(r'^result_water/$', 'result_water'),
	(r'^brick_test/$', 'brick_test'),
	(r'^result_brick/$', 'result_brick'),
	(r'^soil_ohsr/$', 'soil_ohsr'),
	(r'^result_Soil_ohsr/$', 'result_Soil_ohsr'),
	(r'^soil_building/$', 'soil_building'),
	(r'^result_soil_building/$', 'result_soil_building'),
	(r'^admixture/$', 'admixture'),
	(r'^result_Admixture/$', 'result_Admixture'),
	(r'^cement_ppc/$', 'cement_ppc'),
	(r'^result_Cement_PPC/$', 'result_Cement_PPC'),
	(r'^cement_opc_33/$', 'cement_opc_33'),
	(r'^result_Cement_OPC_33/$', 'result_Cement_OPC_33'),
	(r'^cement_opc_43/$', 'cement_opc_43'),
	(r'^result_Cement_OPC_43/$', 'result_Cement_OPC_43'),
	(r'^cement_opc_53/$', 'cement_opc_53'),
	(r'^result_Cement_OPC_53/$', 'result_Cement_OPC_53'),
    (r'^steel/$', 'steel'),
    (r'^result_steel/$', 'result_steel'),
    (r'^concretePaver/$', 'concretePaver'),
    (r'^result_concretepaver/$', 'result_concretepaver'),
    (r'^tile/$', 'tile'),
    (r'^result_tile/$', 'result_tile'),
    (r'^pc/$', 'pc'),
    (r'^result_pc/$', 'result_pc'),
    (r'^hammer/$', 'hammer'),
    (r'^result_hammer/$', 'result_hammer'),
    (r'^groundwater/$', 'groundwater'),
    (r'^result_groundwater/$', 'result_groundwater'),
    (r'^ms_steel_plate/$', 'ms_steel_plate'),
    (r'^result_ms_Steel_plate/$', 'result_ms_Steel_plate'),
    (r'^Fe_415/$', 'Fe_415'),
    (r'^result_Fe_415/$', 'result_Fe_415'),
    (r'^Fe_500/$', 'Fe_500'),
    (r'^result_Fe_500/$', 'result_Fe_500'),
    (r'^IS_432_MS_Grade_1_a_20mm/$', 'IS_432_MS_Grade_1_a_20mm'),
    (r'^result_IS_432_MS_Grade_1_a_20mm/$', 'result_IS_432_MS_Grade_1_a_20mm'),
    (r'^is_2062_2006/$', 'is_2062_2006'),
    (r'^result_is_2062_2006/$', 'result_is_2062_2006'),
#    (r'^Soil_sample/$', 'Soil_sample'),
#    (r'^result_soil_sample/$', 'result_soil_sample'),
#    (r'^drinking_water/$', 'drinking_water'),
#    (r'^result_Drinking_water/$', 'result_Drinking_water'),


	(r'thanks$',  TemplateView, {'template': 'report/thanks.html'}),
)

"""
Urls of search.py
"""
urlpatterns += patterns('Automation.report.search',
	(r'^search_report/$', 'search_report'),
	(r'^search/$', 'search'),
	(r'^report_gen/$', 'report_gen'),
)	

"""
Urls of pdf.py
"""
urlpatterns += patterns('Automation.report.pdf',
	(r'^report_pdf/$', 'report_pdf'),
	(r'^myview/$', 'myview'),
)


