import 'package:flutter/material.dart';
import 'package:sociout/utils/colors.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget(
      {Key? key,
      required this.text,
      required this.controller,
      required this.validatorErrorMessage,
      this.keyboardtype = TextInputType.number})
      : super(key: key);
  final String text;
  final TextEditingController controller;
  final String validatorErrorMessage;
  final TextInputType keyboardtype;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardtype,
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kBlack),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kBlack),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorErrorMessage;
        } else {
          return null;
        }
      },
    );
  }
}
