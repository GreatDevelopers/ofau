from django.db import models

"""
Models for cart module
"""
class cart(models.Model):
    user_id = models.CharField(max_length=11)

class attributes(models.Model):
    name = models.CharField(max_length=200)
    is_number = models.BooleanField()
    is_string = models.BooleanField()
    def __unicode__(self):
	return self.name

class category(models.Model):
    parent = models.ForeignKey('self',null = True)
    def __unicode__(self):
        return self.id

class product(models.Model):
    name = models.CharField(max_length = 100)
    category = models.ForeignKey(category)
    ammount = models.IntegerField()
    def __unicode__(self):
        return self.name

class items(models.Model):
    cost_id = models.ForeignKey(cart)
    product_id = models.ForeignKey(product)

class attributeValue(models.Model):
    attribute = models.ForeignKey(attributes)
    value = models.CharField(max_length = 200)
    product = models.ForeignKey(product)
    def __unicode__(self):
        return self.name

