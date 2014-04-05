from django.db import models

"""
Models for cart module
"""

class category(models.Model):
    parent = models.ForeignKey('self',null = True)
    def __unicode__(self):
        return self.id

class attributeValue(models.Model):
    attribute = models.ForeignKey(attributes)
    value = models.CharField(max_length = 200)
    product = models.ForeignKey(product)
    def __unicode__(self):
        return self.name

class product(models.Model):
    name = models.CharField(max_length = 100)
    category = models.ForeignKey(category)
    ammount = models.IntegerField()
    def __unicode__(self):
        return self.name
