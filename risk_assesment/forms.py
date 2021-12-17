
from crispy_forms.layout import Layout, HTML
from crispy_forms.helper import FormHelper
from django import forms
from .models import RiskAssesment


class RiskAssesmentForm(forms.ModelForm):

    class Meta:
        model = RiskAssesment
        exclude = ["created_at", "updated_at"]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_method = "post"
        self.helper.layout = Layout(

            'title', 'description',
            HTML(
                '<a class="btn btn-danger float-left" href ="" style="color:white; margin-right:3px;">Back</a>'
            ),
            HTML(
                '<button class="btn btn-success" type="submit">Save</button>'
            ),
        )
