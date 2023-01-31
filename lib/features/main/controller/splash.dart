import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sociout/features/main/view/main_screen.dart';
import 'package:sociout/features/main/view/onboard.dart';
import 'package:sociout/utils/route.dart';

class SplashController extends ChangeNotifier {
  String? data = '';

  final storage = const FlutterSecureStorage();

  splashCheck(context) async {
    await Future.delayed(const Duration(seconds: 3));

    storage.read(key: "login").then((value) {
      data = value;

      if (data == 'true') {
        RouteNavigator.pushReplacement(context, MainScreen());
      } else {
        RouteNavigator.pushReplacement(context, const OnBoardPage());
      }
    });
  }
}
