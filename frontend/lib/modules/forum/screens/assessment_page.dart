import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_alert/modules/forum/bloc/forum_cubit/forum_cubit.dart';
import 'package:we_alert/modules/forum/models/questionare_model.dart';
import 'package:we_alert/modules/forum/widgets/custom_sign_up_button.dart';
import 'package:we_alert/modules/forum/widgets/option_cart.dart';
import 'package:we_alert/modules/home/constants/color_const.dart';

class Assessment extends StatelessWidget {
  const Assessment({Key? key, required this.forumCubit}) : super(key: key);
  final ForumCubit forumCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: forumCubit,
      child: BlocBuilder<ForumCubit, ForumState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 1.5,
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                title: const Text('Flood Assessment Survey',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                centerTitle: true),
            body: state.questionStatus == QuestionStatus.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Question',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.amber),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '${state.questions!.question}',
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Options',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.amber),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          itemCount: state.questions!.options!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: OptionCart(
                                title:
                                    "${state.questions!.options![index].option}",
                                onTap: () {
                                  if (state.questions!.options![index]
                                          .followQuestion !=
                                      null) {
                                    forumCubit.getNexttQuestion(
                                        questionId:
                                            "${state.questions!.options![index].followQuestion}");
                                  } else {
                                    forumCubit.changeSurveyResult(
                                        res:
                                            "${state.questions!.options![index].result}");
                                    Navigator.pop(context);
                                  }
                                },
                                isSelected: false,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
