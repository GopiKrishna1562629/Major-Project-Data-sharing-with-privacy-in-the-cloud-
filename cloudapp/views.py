from django.shortcuts import render, redirect, get_object_or_404
from userapp.models import *
from django.contrib import messages
# Create your views here.
from CloudHost.settings import DEFAULT_FROM_EMAIL
from django.core.mail import EmailMultiAlternatives


def cloud_login(request):

    if request.method == "POST":
        name=request.POST.get('name')
        pwd=request.POST.get('pwd')

        if name == 'cloud' and pwd == 'cloud':
            messages.success(request,'Welcome')
            return redirect('cloud-index')

    return render(request,'admin/cloud-login.html')


def cloud_index(request):

    user=UserModel.objects.all().count()
    group=UserModel.objects.all().count()
    files=UserUpload.objects.all().count()
    download=ActivitiesModel.objects.all().values('action').filter(action='download').count()
    print(download)
    delete=ActivitiesModel.objects.all().values('action').filter(action='delete').count()
    return render(request,'admin/cloud-index.html',{'user':user,'group':group,'files':files,'download':download,'delete':delete})


def cloud_verify_files(request):

    file=UserUpload.objects.all()
    return render(request,'admin/cloud-verify-files.html',{'file':file})


def cloud_check_integrity(request):

    file=ActivitiesModel.objects.all()
    return render(request,'admin/cloud-check-integrity.html',{'file':file})


def cloud_notify(request):

    file=ActivitiesModel.objects.all()
    return render(request,'admin/cloud-notify.html',{'file':file})


def notify(request,id):
    
    
    # a=ActivitiesModel.objects.get(user_id=id)
    user_name=ActivitiesModel.objects.filter(activity_id=id)
    print(user_name)
    print('-----------')
    user_id=UserModel.objects.get(user_id=id).user_id
    print(user_id)
    # user_name=ActivitiesModel.objects.get(activity_id=id)
    # print(user_name)
    owner_name=UserModel.objects.get(user_id=id).name
    print(owner_name)
    email=UserModel.objects.get(user_id=id).email
    print(email)
    html_content = "<br/><p>Hello, " + str(owner_name) + " Your file has been Modified/Deleted/Downloaded ." 
    from_mail = DEFAULT_FROM_EMAIL
    to_mail = [email]
    # if send_mail(subject,message,from_mail,to_mail):
    msg = EmailMultiAlternatives("Connection Status", html_content, from_mail, to_mail)
    msg.attach_alternative(html_content, "text/html")
    if msg.send():
        print("Sent")
    return redirect('cloud-notify')