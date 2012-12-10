from django.db import models

from django.utils.translation import ugettext_lazy as _

# Create your models here.
class Tour(models.Model):
    name = models.CharField(max_length=50)
    description = models.TextField()

    class Meta:
        verbose_name = _('Tour')
        verbose_name_plural = _('Tours')

    def __unicode__(self):
        return "%s" % (self.name)

class TourStop(models.Model):
    tour = models.ForeignKey(Tour)
    name = models.CharField(max_length=50)

    class Meta:
        verbose_name = _('Tour Stop')
        verbose_name_plural = _('Tour Stops')

    def __unicode__(self):
        return "%s - %s" % (self.name, self.tour.name)