"""CloudHost URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

import imp
from django.conf import settings
from django.contrib import admin
from django.urls import path
from django.conf.urls.static import static
from mainapp import views as main_views
from userapp import views as user_views
from managerapp import views as manager_views
from cloudapp import views as cloud_views

urlpatterns = [
    path('admin/', admin.site.urls),

    # main view app
    path('',main_views.index,name='index-page'),

    # user view app
    path('user-login',user_views.user_login,name='user-login'),
    path('user-register',user_views.user_register,name='user-register'),
    path('user-otp',user_views.user_otp,name='user-otp'),
    path('user-dashboard',user_views.user_dashboard,name='user-dashboard'),
    path('user-upload',user_views.user_upload,name='user-upload'),
    path('user-view-files',user_views.user_view_files,name='user-view-files'),
    path('user-profile',user_views.user_profile,name='user-profile'),
    path('delete-file/<int:id>/',user_views.delete_file,name='delete-file'),
    # path('edit-file/<int:id>/',user_views.edit_file,name='edit-file'),
    path('download-file/<int:id>/',user_views.download_file,name='download-file'),
    path('user-edit-file/<int:id>/',user_views.user_edit_file,name='user-edit-file'),
    path('download-otp-file',user_views.download_otp_file,name='download-otp-file'),

    # manager view app
    path('manager-login',manager_views.manager_login,name='manager-login'),
    path('manager-index',manager_views.manager_index,name='manager-index'),
    path('manager-view-user',manager_views.manager_view_users,name='manager-view-user'),
    path('manager-view-activities',manager_views.manager_view_activities,name='manager-view-activities'),
    path('manage-users',manager_views.manager_manage_user,name='manage-users'),
    path('suspend/<int:pk>/',manager_views.suspend,name='suspend'),
    path('activate/<int:pk>/',manager_views.activate,name='activate'),


    # cloud view app
    path('cloud-login',cloud_views.cloud_login,name='cloud-login'),
    path('cloud-index',cloud_views.cloud_index,name='cloud-index'),
    path('cloud-verify-files',cloud_views.cloud_verify_files,name='cloud-verify-files'),
    path('cloud-check-integrity',cloud_views.cloud_check_integrity,name='cloud-check-integrity'),
    path('cloud-notify',cloud_views.cloud_notify,name='cloud-notify'),
    path('notify/<int:id>/',cloud_views.notify,name='notify'),
]

urlpatterns+= static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)