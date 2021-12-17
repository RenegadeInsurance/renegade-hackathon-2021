from django.urls import path
from .views import *
app_name = 'auth'
urlpatterns = [
    path('user',user_list,name="user_index"),
    path('group',group_index,name="group_index"),
    path('permission',permission_index,name="permission_index"),
    path('user/register',register,name="user_create"),
    path('group/create',group_create,name="group_create"),
    path('user/edit/<id>/',user_update,name="user_update"),
    path('user/delete',user_delete,name="user_delete"),
    path('user/edit/<id>/password/',change_password,name="password_change"),
    path('group/edit/<id>/',group_update,name="group_update"),
]
