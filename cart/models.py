from django.db import models
from django.contrib.auth.models import User

"""
Models for cart module
"""

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

class attributes(models.Model):
    name = models.CharField(max_length=200)
    is_number = models.BooleanField()
    is_string = models.BooleanField()
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

class purchase_order(models.Model):
    """docstring for purchase_order"""
    total = models.IntegerField()
    buyer_id = models.ForeignKey(User)
    is_debit = models.BooleanField()
    def __init__(self, arg):
        super(purchase_order, self).__init__()
        self.arg = arg
        
class purchased_item(object):
    """docstring for purchased_item"""
    purchase_orderid = models.ForeignKey(purchase_order)
    price = models.IntegerField()
    item_id = models.ForeignKey(product)
    def __init__(self, arg):
        super(purchased_item, self).__init__()
        self.arg = arg
        
