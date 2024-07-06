from dataclasses import fields
from django import forms
from .models import * 

class UploadForm(forms.ModelForm):
    class Meta:
        model = UserUpload
        fields = ('user_id','user')