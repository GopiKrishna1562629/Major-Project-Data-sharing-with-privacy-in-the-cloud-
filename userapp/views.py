from distutils.command.upload import upload
from itertools import groupby
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from userapp.models import *
from django.conf import settings
import requests
import string
import random
from django.core.files.storage import FileSystemStorage
from pathlib import Path
from django.core.files import File
from CloudHost.settings import DEFAULT_FROM_EMAIL
from django.core.mail import EmailMultiAlternatives
import urllib.parse   #for send SMS
import urllib.request #for send SMS
from django.core.mail import send_mail
# Create your views here.

def sendSMS(name, otp, mobile):
    data = urllib.parse.urlencode({
        'username': 'Codebook',
        'apikey': '56dbbdc9cea86b276f6c',
        'mobile': mobile,
        'message': f'Hello {name}, your OTP for account activation is {otp}. This message is generated from https://www.codebook.in server. Thank you',
        'senderid': 'CODEBK'
    })
    data = data.encode('utf-8')
    # Disable SSL certificate verification
    # context = ssl._create_unverified_context()
    request = urllib.request.Request("https://smslogin.co/v3/api.php?")
    f = urllib.request.urlopen(request, data)
    return f.read()
def user_register(request):
    if request.method == "POST":
        name = request.POST.get('name')
        email = request.POST.get('email')
        mobile = request.POST.get('mobile')
        category = request.POST.get('category')
        pwd = request.POST.get('pwd')
        cpwd = request.POST.get('cpwd')

        if UserModel.objects.filter(email=email):
            messages.error(request, "Email ALready Exists!")

        else:
            otp = random.randint(1111, 9999)
            print(otp, "generate otp")

            #sendSMS(name, otp, mobile)
            mail_message = f"register successfully \nYour four digit pin is below \n {otp}"
            print(mail_message)
            send_mail("student password", mail_message, settings.EMAIL_HOST_USER,
                      [email])  # we take the register name variable in this case which is "email"

            UserModel.objects.create(name=name, email=email, mobile=mobile, category=category, pwd=pwd, cpwd=cpwd,
                                     otp=otp)
            messages.success(request, 'Account Created Successfully!')
            return redirect('user-otp')

    return render(request, 'main/user-register.html')


def user_otp(request):
    # user_id=request.session['user_id']

    if request.method == "POST":
        otp = request.POST.get('otp')
        print(otp)
        try:
            print('ppppppppppppppppppppp')
            check = UserModel.objects.get(otp=otp)
            email = check.email
            user_id = request.session['user_id'] = check.user_id
            otp = check.otp
            print(otp)
            if otp == otp:
                UserModel.objects.filter(user_id=user_id).update(status='verified')
                messages.info(request, '')
                return redirect('user-login')
            else:
                return redirect('user-otp')
        except:
            pass

    return render(request, 'main/user-login-otp.html')


def user_login(request):
    if request.method == "POST":
        email = request.POST.get('email')
        pwd = request.POST.get('pwd')
        try:
            check = UserModel.objects.get(email=email, pwd=pwd)
            request.session['user_id'] = check.user_id
            status = check.status
            if status == "verified":
                messages.success(request, 'Logged-in Successfully!')
                return redirect('user-dashboard')
            elif status == "Suspended":
                messages.error(request, 'Your account is suspended..!')
            elif status == "Activated":
                messages.success(request, 'Logged-in Successfully!')
            else:
                messages.error(request, 'Invalid Credentials')
        except:
            pass
    return render(request, 'main/user-login.html')


def user_dashboard(request):
    return render(request, 'main/user-dashboard.html')


def user_upload(request):
    user_id = request.session['user_id']
    group = UserModel.objects.filter(user_id=user_id).values_list('category')[0][0]
    print(group)
    print(user_id)
    print('...................................')
    if request.method == "POST" and 'upload' in request.FILES:
        uploaded_file = request.FILES['upload']
        user = UserModel.objects.get(user_id=user_id)
        category = group
        name = uploaded_file.name
        size = uploaded_file.size
        content_type = uploaded_file.content_type

        UserUpload.objects.create(uploaded_file=uploaded_file, name=name, size=size, user=user,
                                  content_type=content_type, category=category)
        messages.success(request, 'Uploaded Successfully!')
        ActivitiesModel.objects.create(file_name=name, user_id=user_id)
    return render(request, 'main/user-upload.html')


def user_view_files(request):
    user_id = request.session['user_id']
    category = UserUpload.objects.filter(user_id=user_id).all().values_list('category')[0][0]
    # print(category)
    group = UserUpload.objects.all().filter(category=category)
    # print(group)
    upload = UserUpload.objects.filter(user_id=user_id)

    # print(upload)
    return render(request, 'main/user-view-files.html', {'upload': upload, 'group': group})


def user_profile(request):
    user_id = request.session['user_id']

    if request.method == "POST":
        name = request.POST.get('name')
        email = request.POST.get('email')
        mobile = request.POST.get('mobile')
        category = request.POST.get('category')
        pwd = request.POST.get('pwd')
        cpwd = request.POST.get('cpwd')
        UserModel.objects.filter(user_id=user_id).update(name=name, email=email, mobile=mobile, category=category,
                                                         pwd=pwd, cpwd=cpwd)
    data = UserModel.objects.filter(user_id=user_id)
    return render(request, 'main/user-profile.html', {'data': data})


def user_edit_file(request, id):
    user_id = request.session['user_id']
    upload = UserUpload.objects.filter(upload_id=id)
    upload_id = UserUpload.objects.get(upload_id=id).upload_id
    data = UserUpload.objects.get(upload_id=id)
    # print(upload.uploaded_file)
    f = open("media/" + str(data.uploaded_file), "r")
    file_data = f.read()
    f.close()

    file = UserUpload.objects.get(upload_id=id)

    if request.method == "POST":
        print('********************')
        updated_file = request.POST.get('update')
        filename = request.POST.get('filename')
        f = open('media/' + str(file.uploaded_file), 'w')
        print(f)
        f.write(updated_file)
        print(f)
        f.close()

        owner_id = UserUpload.objects.get(upload_id=id).user_id
        owner_name = UserModel.objects.get(user_id=owner_id).name
        user_name = UserModel.objects.get(user_id=user_id).name
        print("USERNAME" + user_name)
        print("OWNERNAME" + owner_name)
        print(user_id)
        # print(email)
        print(owner_id)
        # file.delete()

        a = ActivitiesModel.objects.create(user_id=user_id, file_name=filename, action='edited', upload_id=upload_id)

        email = UserModel.objects.get(user_id=owner_id).email
        html_content = "<p>Hello, " + str(owner_name) + " Your file " + 'media/' + str(
            a.file_name) + " has been <b>Edited</b> by " + str(user_name) + ".</p>"
        from_mail = DEFAULT_FROM_EMAIL
        to_mail = [email]
        # if send_mail(subject,message,from_mail,to_mail):
        msg = EmailMultiAlternatives("Connection Status", html_content, from_mail, to_mail)
        print(msg)
        msg.attach_alternative(html_content, "text/html")
        if msg.send():
            print("Sent")
        return redirect('user-view-files')
    return render(request, 'main/user-edit-file.html', {'upload': upload, 'file': file_data})


def delete_file(request, id):
    user_id = request.session["user_id"]
    file = UserUpload.objects.get(upload_id=id)
    upload_id = UserUpload.objects.get(upload_id=id).upload_id
    print('--------------------')
    print(upload_id)
    owner_id = UserUpload.objects.get(upload_id=id).user_id
    owner_name = UserModel.objects.get(user_id=owner_id).name
    user_name = UserModel.objects.get(user_id=user_id).name
    print("USERNAME" + user_name)
    print("OWNERNAME" + owner_name)
    print(user_id)
    # print(email)
    print(owner_id)
    # file.delete()
    a = ActivitiesModel.objects.create(user_id=user_id, file_name=file.name, action='delete', upload_id=upload_id,
                                       owner_id=owner_id)

    email = UserModel.objects.get(user_id=owner_id).email
    html_content = "<p>Hello, " + str(owner_name) + " Your file " + 'media/' + str(
        a.file_name) + " has been <b>deleted</b> by " + str(user_name) + ".</p>"
    from_mail = DEFAULT_FROM_EMAIL
    to_mail = [email]
    # if send_mail(subject,message,from_mail,to_mail):
    msg = EmailMultiAlternatives("Connection Status", html_content, from_mail, to_mail)
    msg.attach_alternative(html_content, "text/html")
    if msg.send():
        print("Sent")

    return redirect('user-view-files')


def download_file(request, id):
    user_id = request.session["user_id"]
    file = UserUpload.objects.get(upload_id=id)
    upload_id = UserUpload.objects.get(upload_id=id).upload_id
    owner_id = UserUpload.objects.get(upload_id=id).user_id
    owner_name = UserModel.objects.get(user_id=owner_id).name
    user_name = UserModel.objects.get(user_id=user_id).name
    print("USERNAME" + user_name)
    print("OWNERNAME" + owner_name)
    print(user_id)
    # print(email)
    print(owner_id)

    # file.delete()
    def key_generator(size=10,
                      chars=string.ascii_uppercase + string.ascii_lowercase + string.digits + '!@#$%^&*()_+?~'):
        return ''.join(random.choice(chars) for _ in range(size))

    key = key_generator()

    print(key)

    #Key sent To USER


    a = ActivitiesModel.objects.create(user_id=user_id, file_name=file.name, upload_id=upload_id, key=key,
                                       owner_id=owner_id)

    email = UserModel.objects.get(user_id=owner_id).email
    email1 = UserModel.objects.get(user_id=user_id).email
    html_content = "<br/><p>Hello, " + str(owner_name) + " Your file " + 'media/' + str(
        a.file_name) + " has been <b>downloaded</b> by " + str(user_name) + "."
    from_mail = DEFAULT_FROM_EMAIL
    to_mail = [email]
    # if send_mail(subject,message,from_mail,to_mail):
    msg = EmailMultiAlternatives("Connection Status", html_content, from_mail, to_mail)
    msg.attach_alternative(html_content, "text/html")

    html_content = "<br/><p>Hello, Your File key :  " +key +  '  media/' + str(
        a.file_name) + " has been <b>downloaded</b> by " + str(user_name) + "."
    from_mail = DEFAULT_FROM_EMAIL
    to_mail = [email1]
    # if send_mail(subject,message,from_mail,to_mail):
    msg = EmailMultiAlternatives("Connection Status", html_content, from_mail, to_mail)
    msg.attach_alternative(html_content, "text/html")
    if msg.send():
        print("Sent")
    return redirect('download-otp-file')


def download_otp_file(request):
    user_id = request.session["user_id"]

    if request.method == "POST":
        key = request.POST.get('key')
        try:
            print('ppppppppppppppppppppp')
            check = ActivitiesModel.objects.get(key=key)
            user_id = request.session['user_id'] = check.user_id
            key = check.key
            if key == key:
                ActivitiesModel.objects.filter(user_id=user_id).update(action='download')
                messages.info(request, '')
                return redirect('user-view-files')
            else:
                return redirect('download-otp-file')
        except:
            pass

    return render(request, 'main/download-file-otp.html')