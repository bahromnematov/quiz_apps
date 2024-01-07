import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/result_item.dart';

class ResultPage extends StatefulWidget {
  final int toatalQuestionCount;
  final int trueQuestionCount;
  final List<bool> answers;
  final double pracents;

  const ResultPage(
      {super.key,
      required this.toatalQuestionCount,
      required this.trueQuestionCount,
      required this.answers,
      required this.pracents});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String lottie = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.pracents >= 80) {
      lottie = "assets/lottie/tick.json";
    } else if (widget.pracents >= 60 && widget.pracents < 80) {
      lottie = "assets/lottie/good.json";
    } else {
      lottie = "assets/lottie/bad.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(lottie),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Results Question",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "${widget.trueQuestionCount}/${widget.toatalQuestionCount}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: ResultItem(
                          text: 'Question ${index + 1}',
                          isTrue: widget.answers[index],
                        ),
                      );
                    },
                    itemCount: widget.answers.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
