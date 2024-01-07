import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VariantItem extends StatelessWidget {
  final String variantText;
  final bool isSelected;
  final VoidCallback onTap;

  const VariantItem(
      {super.key,
      required this.isSelected,
      required this.variantText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 52,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  blurRadius: 17,
                  spreadRadius: 2,
                  color: Colors.grey.shade300,
                  offset: Offset(1, 4))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(
              variantText,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
            )),
            isSelected
                ? SvgPicture.asset(
                    "assets/svg/tick.svg",
                    width: 27,
                    height: 27,
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
