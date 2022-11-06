import 'package:flutter/material.dart';

class CalButton extends StatelessWidget {

  final btnColor;
  final btnText;
  final textColor;
  final onTap;

  const CalButton(this.btnColor, this.btnText, this.textColor, this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: btnColor,
              borderRadius: const BorderRadius.all(Radius.circular(50))
          ),
          child: Center(
            child: Text(
              btnText,
              style: TextStyle(
                color: textColor,
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
          )
      )
    );
  }
}
