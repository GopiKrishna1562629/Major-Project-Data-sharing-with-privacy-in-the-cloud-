# Generated by Django 4.0.4 on 2022-05-13 13:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userapp', '0012_alter_activitiesmodel_action_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='activitiesmodel',
            name='upload_id',
            field=models.IntegerField(null=True),
        ),
    ]