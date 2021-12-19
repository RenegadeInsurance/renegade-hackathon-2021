from django.db import models
from users.models import User

class Question(models.Model):

    question = models.TextField()
    next_question = models.ForeignKey('self', blank=True, null=True, related_name='prev_ques', on_delete=models.CASCADE)
    lower = models.DecimalField(decimal_places=2, max_digits=5)
    upper = models.DecimalField(decimal_places=2, max_digits=5)

    def __str__(self) -> str:
        return f'{self.question}'

class AnsweredQuestion(models.Model):
    question = models.ForeignKey(Question, related_name='ques', on_delete=models.CASCADE)
    user = models.ForeignKey(User, related_name='answered_questions', on_delete=models.CASCADE)

class Answer(models.Model):
    answer = models.CharField(max_length=50)
    score = models.DecimalField(decimal_places=2, max_digits=5)
    question = models.ForeignKey(Question, related_name='parent_question', on_delete=models.CASCADE)

    def __str__(self) -> str:
        return f'{self.id} {self.answer}'