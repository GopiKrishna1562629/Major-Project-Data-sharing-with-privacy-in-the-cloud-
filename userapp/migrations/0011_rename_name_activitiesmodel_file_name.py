# Generated by Django 4.0.4 on 2022-05-13 09:23

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('userapp', '0010_userupload_category'),
    ]

    operations = [
        migrations.RenameField(
            model_name='activitiesmodel',
            old_name='name',
            new_name='file_name',
        ),
    ]