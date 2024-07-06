from distutils.command.upload import upload
from pyexpat import model
from django.db import models

# Create your models here.

class UserModel(models.Model):
    user_id=models.AutoField(primary_key=True)
    name=models.CharField(max_length=100)
    email=models.EmailField(max_length=100)
    mobile=models.BigIntegerField()
    category=models.CharField(max_length=100)
    pwd=models.CharField(max_length=100)
    cpwd=models.CharField(max_length=100)
    otp=models.IntegerField(null=True)
    status=models.TextField(default='pending',null=True)

    class Meta():
        db_table='user_details'



class UserUpload(models.Model):
    upload_id=models.AutoField(primary_key=True)
    user=models.ForeignKey(UserModel,db_column='user_id',on_delete=models.CASCADE,null=True,blank=True)
    uploaded_file=models.FileField(upload_to='files/',null=True)
    size = models.BigIntegerField(null=True)
    name=models.TextField(null=True)
    date_of_upload=models.DateField(auto_now=True)
    content_type=models.CharField(max_length=100,null=True)
    category=models.CharField(max_length=100,null=True)
    # uploaded_image=models.ImageField(upload_to='images/',null=True)
    status=models.TextField(default='pending',null=True)

    class Meta():
        db_table='user_uploaded_files'

    # def delete(self, *args, **kwargs):
    #     self.files.delete()
    #     super().delete(*args, **kwargs)  # Call the "real" save() method.
        



class ActivitiesModel(models.Model):
    activity_id=models.AutoField(primary_key=True)
    user_id=models.IntegerField(null=True)
    file_name=models.FileField(upload_to='files/')
    date=models.DateField(auto_now=True)
    time=models.TimeField(auto_now=True)
    action=models.CharField(max_length=100,default='upload')
    upload_id=models.IntegerField(null=True)
    owner_id=models.IntegerField(null=True)
    key=models.CharField(max_length=100,null=True)

    class Meta():
        db_table='activities_table'