from dataclasses import field
from email import message
from itertools import count
from tkinter.tix import COLUMN
from django.shortcuts import redirect, render, get_object_or_404
from userapp.models import *
from django.contrib import messages
from CloudHost.settings import DEFAULT_FROM_EMAIL
from django.core.mail import EmailMultiAlternatives

# Create your views here.

def manager_login(request):

    if request.method == "POST":
        name=request.POST.get('name')
        pwd=request.POST.get('pwd')

        if name == 'manager' and pwd == 'manager':
            messages.success(request,'wlecome aboard')
            return redirect('manager-index')
        
            
    return render(request,'admin/manager-login.html')


def manager_index(request):

    user=UserModel.objects.all().count()
    group=UserModel.objects.all().count()
    files=UserUpload.objects.all().count()
    download=ActivitiesModel.objects.all().filter(action='download').count()
    delete=ActivitiesModel.objects.all().filter(action='delete').count()
    return render(request,'admin/manager-index.html',{'user':user,'group':group,'files':files,'download':download,'delete':delete})


def manager_view_activities(request):

    uploads=ActivitiesModel.objects.all()
    return render(request,'admin/manager-view-activities.html',{'uploads':uploads})


def manager_view_users(request):

    users=UserModel.objects.all()
    print(users)
    return render(request,'admin/manager-view-users.html',{'users':users})


def manager_manage_user(request):

    users=ActivitiesModel.objects.all()
    return render(request,'admin/manager-manage-users.html',{'users':users})



def suspend(request,pk):

    suspend = get_object_or_404(UserModel,user_id=pk)
    suspend.status = "suspended"
    suspend.save(update_fields=['status'])
    suspend.save()
    user_name=UserModel.objects.get(user_id=pk).name
    print(user_name)
    email=UserModel.objects.get(user_id=pk).email
    print(email)

    html_content = "<p>Hello, " + str(user_name) + " Your account has been <b>Suspended</b> by Admin for malicious acts.</p>" 
    from_mail = DEFAULT_FROM_EMAIL
    to_mail = [email]
    # if send_mail(subject,message,from_mail,to_mail):
    msg = EmailMultiAlternatives("Connection Status", html_content, from_mail, to_mail)
    msg.attach_alternative(html_content, "text/html")
    if msg.send():
        print("Sent")
    return redirect('manage-users')



def activate(request,pk):
    suspend = get_object_or_404(UserModel,user_id=pk)
    suspend.status = "verified"
    suspend.save(update_fields=['status'])
    suspend.save()
    user_name=UserModel.objects.get(user_id=pk).name
    print(user_name)
    email=UserModel.objects.get(user_id=pk).email
    print(email)

    html_content = "<p>Hello, " + str(user_name) + " Your account has been <b>Activated</b> by Admin .</p>"
    from_mail = DEFAULT_FROM_EMAIL
    to_mail = [email]
    # if send_mail(subject,message,from_mail,to_mail):
    msg = EmailMultiAlternatives("Connection Status", html_content, from_mail, to_mail)
    msg.attach_alternative(html_content, "text/html")
    if msg.send():
        print("Sent")
    return redirect('manage-users')