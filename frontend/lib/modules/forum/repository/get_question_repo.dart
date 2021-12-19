import 'package:dio/dio.dart';
import 'package:we_alert/modules/forum/models/questionare_model.dart';

class GetQuestionRepo {
  Future<QuestionareModel> getFirstQuestion() async {
    try {
      String url = 'http://renegade.nirmansolution.com/survey/1';
      Dio dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["accept"] = "application/json";
      var response = await dio.get(url);
      QuestionareModel questionModel =
          QuestionareModel.fromMap(response.data['question']);

      return questionModel;
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<QuestionareModel> getNextQuestion({required String questionId}) async {
    try {
      String url =
          'http://renegade.nirmansolution.com/complex-question/question/$questionId';
      Dio dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["accept"] = "application/json";
      var response = await dio.get(url);
      QuestionareModel questionModel = QuestionareModel.fromMap(response.data);
      return questionModel;
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
