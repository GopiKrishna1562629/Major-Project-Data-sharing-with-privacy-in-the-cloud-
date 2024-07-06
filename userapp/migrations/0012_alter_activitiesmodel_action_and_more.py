# Generated by Django 4.0.4 on 2022-05-13 10:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userapp', '0011_rename_name_activitiesmodel_file_name'),
    ]

    operations = [
        migrations.AlterField(
            model_name='activitiesmodel',
            name='action',
            field=models.CharField(default='upload', max_length=100),
        ),
        migrations.AlterField(
            model_name='activitiesmodel',
            name='file_name',
            field=models.FileField(upload_to='files/'),
        ),
    ]
