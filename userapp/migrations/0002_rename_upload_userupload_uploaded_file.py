# Generated by Django 4.0.4 on 2022-05-11 07:43

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('userapp', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='userupload',
            old_name='upload',
            new_name='uploaded_file',
        ),
    ]