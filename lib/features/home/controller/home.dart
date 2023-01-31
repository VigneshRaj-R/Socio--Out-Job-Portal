import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sociout/features/register/view/signin.dart';
import 'package:sociout/utils/route.dart';

class HomeController extends ChangeNotifier {
  void logout(context) async {
    const FlutterSecureStorage storage = FlutterSecureStorage();

    await storage.write(key: 'login', value: 'false');
    RouteNavigator.pushRemoveUntil(context, const SigninPage());
  }
}
