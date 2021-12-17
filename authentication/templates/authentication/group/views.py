from django.shortcuts import render,redirect
from django.contrib.auth.forms import UserCreationForm
from .forms import *
from .models import UserProfile
from django.contrib.auth import authenticate,login,logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User, Group, Permission
def loginPage(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request,username = username,password = password)
        if user is not None:
            login(request,user)
            return redirect('/')
        else:
            messages.info(request, 'Username or Password is incorrect')

    return render(request,'authentication/login.html')

def logoutuser(request):
    logout(request)
    return redirect('/login')

def register(request):
    user_form = CreateUserForm()
    profile_form = UserProfileForm()
    if request.method == 'POST':
        user_form = CreateUserForm(request.POST,request.FILES)
        # profile_form = UserProfileForm(request.POST,request.FILES)
        if user_form.is_valid():
            print(user_form.cleaned_data['image'])
            user = user_form.save()
            user_profile = UserProfile.objects.create(user=user,image=user_form.cleaned_data['image'])
            return redirect('/')
        print(user_form.cleaned_data)

    context = {
        'user_form':user_form,
        'title':'User'
    }
    return render(request,'authentication/register.html',context)

def user_update(request,id):
    user = User.objects.get(id=id)
    form = UserCreationForm(instance = user)
    if request.method == 'POST':
        user_form = CreateUserForm(request.POST,request.FILES)
     
    context = {
        'user_form':form,
        'title':'User'
    }
    return render(request,'authentication/register.html',context)  


def home(request):
    context = {
        'title':'Dashboard',
    }
    return render(request,'home/index.html',context=context)

def user_list(request):
    context = {
        'title':'User',
        'users': UserProfile.objects.all(),
    }
    print(User.objects.all())
    return render(request,'authentication/index.html',context=context)

def group_index(request):
    context = {
        'title':'Group',
        'groups': Group.objects.all(),
    }
    return render(request,'authentication/group/index.html',context=context)

def permission_index(request):
    context = {
        'title':'Permission',
        'group': Permission.objects.all(),
    }
    return render(request,'authentication/permission/index.html',context=context)

def group_create(request):
    context = {
        'title':'Group',
        'groups': Group.objects.all(),
    }
    return render(request,'authentication/group/index.html',context=context)