from django.shortcuts import render
from .forms import RiskAssesmentForm

def risk_assesment_create(request):
    form = RiskAssesmentForm()

    context = {
        'title':'Risk Assesment',
        'form': form,
        }
    return render(request, 'risk_assesment/create.html', context=context)