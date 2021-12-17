from django.contrib.auth.forms import UserCreationForm, UserChangeForm,  PasswordChangeForm
from django.forms import ModelForm
from django import forms
from django.contrib.auth.models import User, Group, Permission
from crispy_forms.layout import Layout, Row, Column, Submit, Button, HTML, Hidden, Div
from crispy_forms.helper import FormHelper
from django.contrib.admin.widgets import FilteredSelectMultiple
from django.utils.safestring import mark_safe
from authentication.models import CustomUser as User

class CreateUserForm(UserCreationForm):
    image = forms.ImageField( required=False)
    class Meta:
        model = User
        fields = ['first_name', 'last_name',
                  'email', 'password1', 'password2','is_superuser','is_staff','is_active','image']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_method = 'post'
        self.helper.layout = Layout(
        'first_name', 'last_name','email','password1','password2',
        'is_superuser','is_staff','is_active','image',
        HTML('<button class="btn btn-success float-right" type="submit">Save</button><input type="hidden" name="slug" value=""></div></form>'),
    )

class UserUpdateForm(UserChangeForm):
    image = forms.ImageField( required=False)
    class Meta:
        model = User
        fields = ['first_name', 'last_name','email','user_permissions','groups',
                  'password','is_superuser','is_staff','is_active','image']
        help_text = {
            'password': None
        }
        widgets = {
            'user_permissions': FilteredSelectMultiple("Permission", False, attrs={'rows':'2'}),
            'groups': FilteredSelectMultiple("Group", False, attrs={'rows':'2'}),
        }
        

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_method = 'post'
        self.helper.layout = Layout(
        'first_name', 'last_name', 'email','password',
        Row(
            Column('groups', css_class="form-group col-md-8 mb-0"),
        ),
        Row(
            Column('user_permissions', css_class="form-group col-md-8 mb-0"),
        ),
        'email','is_superuser','is_staff','is_active','image',
        HTML('<button class="btn btn-success float-right" type="submit">Save</button><input type="hidden" name="slug" value=""></div></form>'),
    )

class GroupForm(ModelForm):
    class Meta:
        model = Group
        fields = '__all__'
        widgets = {
            'permissions': FilteredSelectMultiple("Permission", False, attrs={'rows':'2'}),
        }
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_method = 'post'
        self.helper.layout = Layout(
            Row(
                Column('name', css_class="form-group col-md-4 mb-0"),
            ),
                Row('permissions'),

            HTML('<button class="btn btn-success" type="submit">Save</button><input type="hidden" name="slug" value=""></div></form>'),
        )


class UserPasswordChangeForm(PasswordChangeForm):
    class Meta:
        field = '__all__'