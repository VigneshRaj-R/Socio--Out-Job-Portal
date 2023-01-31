import 'package:flutter/material.dart';

class RouteNavigator {
  static pushRoute(context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => screen));
  }

  static pushReplacement(context, Widget screen) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => screen));
  }

  static popRoute(context) {
    Navigator.of(context).pop();
  }

  static pushRemoveUntil(context, Widget screen) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => screen), (route) => false);
  }
}
