import 'package:flutter/material.dart';

class ResultItem extends StatelessWidget {
  final String text;
  final bool isTrue;

  const ResultItem({super.key, required this.text, required this.isTrue});

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
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
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
