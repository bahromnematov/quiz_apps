import 'package:flutter/material.dart';

class ResultItem extends StatelessWidget {
  final String text;
  final String trueAnswers;
  final String selected_variant;
  final bool isTrue;

  const ResultItem(
      {super.key,
      required this.text,
      required this.isTrue,
      required this.selected_variant,
      required this.trueAnswers});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black, offset: Offset(1, 4))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "True Answers: $trueAnswers",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Selected Variant: $selected_variant",
                style: TextStyle(
                    color: isTrue ? Colors.green : Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
          isTrue
              ? Image.asset(
                  "assets/images/checked.png",
                  width: 30,
                  height: 30,
                )
              : Image.asset(
                  "assets/images/cancel.jpg",
                  width: 30,
                  height: 30,
                ),
        ],
      ),
    );
  }
}
