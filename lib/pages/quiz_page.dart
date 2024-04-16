import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:quiz_apps/pages/result_page.dart';
import 'package:quiz_apps/widgets/variant_item.dart';

import '../model/quiz_data.dart';

class QuizPage extends StatefulWidget {
  final List<QuizData> quizList;
  final String quizName;

  const QuizPage({super.key, required this.quizList, required this.quizName});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int expendetValue = 1;
  final CountDownController _controller = CountDownController();
  int duration = 10;
  int currentQuistionIndex = 0;
  String selectedVariant = "";
  List<bool> choseAnswers = [];
  int trueQuistionCount = 0;
  List<String> selected_variant = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Start Test",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.quizName,
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.shade400, width: 2),
                              borderRadius: BorderRadius.circular(26)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 4,
                                            blurRadius: 4,
                                            offset: Offset(1, 4),
                                            color: Colors.grey.shade200)
                                      ],
                                      borderRadius: BorderRadius.circular(26)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: expendetValue,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(26),
                                                color: Colors
                                                    .yellowAccent.shade700),
                                          )),
                                      Expanded(
                                        flex: widget.quizList.length -
                                            expendetValue,
                                        child: SizedBox(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "$expendetValue/${widget.quizList.length}",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        flex: 5,
                      ),
                      Expanded(
                        child: CircularCountDownTimer(
                          duration: duration,
                          controller: _controller,
                          width: 50,
                          height: 50,
                          fillColor: Colors.white,
                          ringColor: Colors.black,
                          textStyle: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          autoStart: true,
                          isReverse: true,
                          onComplete: () {
                            if (currentQuistionIndex < 9) {
                              setState(() {
                                choseAnswers.add(false);
                                expendetValue++;
                                currentQuistionIndex++;
                                selectedVariant = "";
                                selected_variant.add(selectedVariant);
                              });
                              _controller.restart();
                            }
                          },
                        ),
                        flex: 2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Text(
                        "Question: $expendetValue",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: Colors.blueAccent),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.quizList[currentQuistionIndex].quiztext,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 34,
                      ),
                      VariantItem(
                          isSelected: selectedVariant == "A",
                          variantText: widget.quizList[currentQuistionIndex].v1,
                          onTap: () {
                            setState(() {
                              selectedVariant = "A";
                              selected_variant.add(selectedVariant);
                            });
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      VariantItem(
                          isSelected: selectedVariant == "B",
                          variantText: widget.quizList[currentQuistionIndex].v2,
                          onTap: () {
                            setState(() {
                              selectedVariant = "B";
                              selected_variant.add(selectedVariant);
                            });
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      VariantItem(
                          isSelected: selectedVariant == "C",
                          variantText: widget.quizList[currentQuistionIndex].v3,
                          onTap: () {
                            setState(() {
                              selectedVariant = "C";
                              selected_variant.add(selectedVariant);
                            });
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      VariantItem(
                          isSelected: selectedVariant == "D",
                          variantText: widget.quizList[currentQuistionIndex].v4,
                          onTap: () {
                            setState(() {
                              selectedVariant = "D";
                              selected_variant.add(selectedVariant);
                            });
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.yellow.shade700,
                          borderRadius: BorderRadius.circular(6)),
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      _controller.restart();
                      setState(() {
                        if (selectedVariant != "") {
                          if (currentQuistionIndex + 1 <
                              widget.quizList.length) {
                            if (selectedVariant ==
                                widget.quizList[currentQuistionIndex]
                                    .trueAnswer) {
                              choseAnswers.add(true);
                              trueQuistionCount += 1;
                            } else {
                              choseAnswers.add(false);
                            }
                            currentQuistionIndex++;
                            expendetValue++;
                            selectedVariant = "";
                          } else if (currentQuistionIndex + 1 ==
                              widget.quizList.length) {
                            if (selectedVariant ==
                                widget.quizList[currentQuistionIndex]
                                    .trueAnswer) {
                              choseAnswers.add(true);
                              trueQuistionCount += 1;
                            } else {
                              choseAnswers.add(false);
                            }
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return ResultPage(
                                toatalQuestionCount: widget.quizList.length,
                                trueQuestionCount: trueQuistionCount,
                                answers: choseAnswers,
                                pracents: trueQuistionCount /
                                    widget.quizList.length *
                                    100,
                                Questins: widget.quizList,
                                selectedVariant: selected_variant,
                              );
                            }));
                          }
                        }
                      });
                    },
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
