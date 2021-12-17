from django.shortcuts import render,redirect
from django.contrib.auth.forms import UserCreationForm
from .forms import *
from django.contrib.auth import authenticate,login,logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import Group, Permission
from .models import CustomUser as User

def login_page(request):
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

def logout_user(request):
    logout(request)
    return redirect('/login')

def register(request):
    user_form = CreateUserForm()
    if request.method == 'POST':
        user_form = CreateUserForm(request.POST,request.FILES)
        if user_form.is_valid():
            user = user_form.save()
            return redirect('authentication:user_index')
    context = {
        'user_form':user_form,
        'title':'User'
    }
    return render(request,'authentication/register.html',context)

def change_password(request):
    form = UserPasswordChangeForm()
    context = {
        'user_form':form,
        'title':'Change Password'
    }
    return render(request,'authentication/register.html',context)

def user_update(request,id):
    user = User.objects.get(id=id)
    form = UserUpdateForm(instance = user)
    if request.method == 'POST':
        form = UserUpdateForm(request.POST,request.FILES,instance=user)
        if form.is_valid():
            form.save()
            return redirect('authentication:user_index')
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
        'active_menu':'authentication',
        'users': User.objects.all(),
    }
    return render(request,'authentication/index.html',context=context)

def user_delete(request):
    id = request.POST.get('id')
    user = User.objects.get(id=id);
    print(user)

def group_index(request):
    context = {
        'title':'Group',
        'active_menu':'authentication',
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
    form = GroupForm()
    if request.method == 'POST':
        form = GroupForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('authentication:group_index')
    context = {
        'title':'Group',
        'form': form,
    }
    return render(request,'authentication/group/create.html',context=context)

def group_update(request,id):
    group = Group.objects.get(id=id)
    form = GroupForm(instance=group)
    if request.method == 'POST':
        form = GroupForm(request.POST,instance=group)
    if form.is_valid():
        form.save()
        return redirect('authentication:group_index')
    context = {
        'title':'Group',
        'form': form,
    }
    return render(request,'authentication/group/create.html',context=context)
