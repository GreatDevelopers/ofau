from django import forms


#class ConfirmForm(ModelForm):
    #class Meta:
         #model = QuotedItem
         #fields = ['quote_item', 'quote_qty']


class ConfirmForm(forms.Form):
    quote_item = forms.CharField()
    quote_qty = forms.IntegerField()
    discount = forms.IntegerField()