from django.db import models

# Create your models here.

class Category(models.Model):
    categoryID = models.IntegerField(auto_created = True)
    categoryName = models.TextField()
    isExceeded = models.BooleanField()
    isExpense = models.BooleanField()
    isDeactivated = models.BooleanField()

    def __str__(self):
        return self.categoryName

    class Meta:
        ordering = ['-categoryID']