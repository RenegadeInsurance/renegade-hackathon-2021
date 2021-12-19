from django.db import models
from user.models import User
class AssessmentModel(models.Model):
    IS_TRUE = (
        ('T', 'YES'),
        ('F', 'NO'),
    )
    RISK=(

        ('L', 'LOW RISK'),('M', 'MODERATE RISK'),('H', 'HIGH RISK'),
    )
    Experienced_flood=models.CharField(verbose_name='Have you ever experienced one or more flooding events in your life?',
                                       choices=IS_TRUE,blank=False,max_length=30)
    Muncipality_emergency_system=models.CharField(verbose_name='Has you municipality prepared an emergency plan?',
                                                  max_length=30,choices=IS_TRUE,blank=False)
    Ready_to_face=models.CharField(verbose_name='Do you feel prepared to face a flooding event?',
                                   max_length=30,choices=IS_TRUE,blank=False)
    Flood_risk_at_your_area=models.CharField(verbose_name='In your opinion what is the flood risk area where you live?',
                                             max_length=30,choices=IS_TRUE,blank=False)
    Near_river=models.CharField(verbose_name='Do you live near river?',max_length=30,blank=False,choices=IS_TRUE)
    user = models.OneToOneField(User,on_delete=models.CASCADE)
    risk=models.CharField(choices=RISK,max_length=30,blank=True,null=True)

    def get_risk(self):
        return self.risk

    def save(self, *args, **kwargs):
        super(AssessmentModel, self).save(*args, **kwargs)
        if self.Experienced_flood=='T':
            if self.Muncipality_emergency_system=='T':
                self.risk = 'L'
            else:
                self.risk='M'
        else:
            if self.Ready_to_face=='T':
                if self.Flood_risk_at_your_area=='T':
                    self.risk='M'
                else:
                    self.risk='L'
            else:
                if self.Near_river=='T':
                    if self.Flood_risk_at_your_area=='T':
                        self.risk='H'
                    else:
                        self.risk='M'
                else:
                    self.risk='L'


