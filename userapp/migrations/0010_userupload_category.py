# Generated by Django 4.0.4 on 2022-05-12 06:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userapp', '0009_alter_activitiesmodel_action'),
    ]

    operations = [
        migrations.AddField(
            model_name='userupload',
            name='category',
            field=models.CharField(max_length=100, null=True),
        ),
    ]
