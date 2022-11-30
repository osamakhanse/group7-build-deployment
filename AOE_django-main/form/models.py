from django.db import models


class User(models.Model):
    first_name = models.CharField(max_length=200)
    last_name = models.CharField(max_length=200)
    email = models.CharField(max_length=200)
    phone = models.CharField(max_length=200)
    date = models.DateField()

    def __str__(self):
        return '{0} {1}'.format(self.first_name, self.last_name)
