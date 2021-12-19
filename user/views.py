
from django.shortcuts import render, HttpResponse, HttpResponseRedirect
from django.contrib.auth import authenticate, login, logout
from django.shortcuts import redirect
from django.contrib import messages
from .form import UserForm,UserProfileForm
from django.contrib.auth.decorators import login_required


def LoginPage(request):
    if request.user.is_authenticated:
        return redirect('home')
    else:
        error_message = ' '
        if request.method == 'POST':
            email = request.POST.get('email')
            password = request.POST.get('password')
            user = authenticate(request, username=email, password=password)
            if user is not None:
                login(request, user)
                next_url = request.GET.get('next')
                if next_url:
                    return HttpResponseRedirect(next_url)
                else:
                    return redirect('home')
            else:
                error_message = "Invalid Email or password !!!"
                return render(request, "login.html", {'error_message': error_message})

        else:
            return render(request, 'login.html', {})

def RegisterUser(request):
    if request.method == "POST":
        form1 = UserForm(request.POST)
        form2=UserProfileForm(request.POST)
        if form1.is_valid() and form2.is_valid():
            form1.save()
            form2.save()
            messages.success("User added successfully")
            return redirect('login')
    form1= UserForm()
    form2=UserProfileForm()
    template = 'register.html'
    context = {
        'form1': form1,
        'form2':form2
    }
    return render(request, template, context)

@login_required(login_url='/login')
def logout_user(request):
    logout(request)
    return redirect('login')


