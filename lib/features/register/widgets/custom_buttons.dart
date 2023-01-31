import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      required this.width,
      required this.height,
      required this.fontsize,
      required this.ontap,
      required this.color,
      required this.buttonColor,
      required this.borderColor})
      : super(key: key);

  final String text;
  final double width;
  final double height;
  final Function ontap;
  final double fontsize;
  final Color color;
  final Color buttonColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          ontap();
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ), backgroundColor: buttonColor,
            side: BorderSide(
              width: 5.0,
              color: borderColor,
            ),
            minimumSize: Size(width, height)),
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontsize, fontWeight: FontWeight.w500, color: color),
        ));
  }
}
