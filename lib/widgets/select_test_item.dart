import 'package:flutter/material.dart';

class SelectTestsItem extends StatelessWidget {
  final String subjectName, iconPath;
  final List<Color> gradientColors;
  final int direction, questionsCount;
  final VoidCallback onTap;

  const SelectTestsItem(
      {Key? key,
      required this.subjectName,
      required this.iconPath,
      required this.gradientColors,
      required this.direction,
      required this.questionsCount,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(top: 25),
            padding: EdgeInsets.all(22),
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: gradientColors),
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subjectName,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 33),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Questions Count:$questionsCount",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 15),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
        direction == 1
            ? Positioned(
                right: 0,
                top: 0,
                child: Image.asset(iconPath),
              )
            : Positioned(left: 0, top: 0, child: Image.asset(iconPath))
      ],
    );
  }
}
