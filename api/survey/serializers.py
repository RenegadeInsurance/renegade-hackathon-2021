from rest_framework import serializers
from .models import Question, Answer

class AnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Answer
        fields = ['id', 'answer']

class QuestionSerializer(serializers.ModelSerializer):
    answers = AnswerSerializer(source ='parent_question', many=True)

    class Meta:
        model = Question
        fields = ['id', 'question', 'answers']