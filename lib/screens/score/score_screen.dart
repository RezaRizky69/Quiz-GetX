import 'package:flutter/material.dart';
import 'package:flutter_quiz/controllers/question_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/icons/bg_fix.svg",
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Spacer(
                flex: 3,
              ),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                width: 150.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 15.0),
                  child: Text(
                    "${_controller.numOfCorrectAns * 10}/${_controller.questions.length * 10}",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.black),
                  ),
                ),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
