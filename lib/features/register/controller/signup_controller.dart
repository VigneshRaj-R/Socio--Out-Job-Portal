import 'package:flutter/material.dart';
import 'package:sociout/features/main/view/main_screen.dart';
import 'package:sociout/features/register/model/register/register_model.dart';
import 'package:sociout/features/register/model/register/register_respomse.dart';
import 'package:sociout/features/register/services/register_services.dart';
import 'package:sociout/utils/route.dart';
import 'package:sociout/utils/snackbar.dart';

class SignupController extends ChangeNotifier {
  final signupKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final mobileController = TextEditingController();
  bool isloading = false;

  void registerButton(context) async {
    if (signupKey.currentState!.validate()) {
      isloading = true;

      final modelObj = RegisterModel(
          email: emailController.text,
          name: userNameController.text,
          password: passwordController.text,
          mobile: mobileController.text);

      RegisterResponse? registerResponse =
          await RegisterServices().signupServices(modelObj);

      if (registerResponse == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Some data is already in used'));
        _isLoadingFalse();
        return;
      } else if (registerResponse.loggedin == true) {
        RouteNavigator.pushRemoveUntil(context, MainScreen());
        _isLoadingFalse();
        return;
      } else if (registerResponse.success == false ||
          registerResponse.loggedin != true) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('${registerResponse.message}'));
        _isLoadingFalse();
        return;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Something Went Wrong'));
        _isLoadingFalse();
      }
    }
  }

  void _isLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  bool _isHidden = false;
  get isHidden => _isHidden;
  set isHidden(value) {
    _isHidden = value;
    notifyListeners();
  }

  bool _isCheck = false;
  get isCheck => _isCheck;
  set isCheck(value) {
    _isCheck = value;
    notifyListeners();
  }

  void disposes() {
    signupKey.currentState!.reset();
    emailController.clear();
    passwordController.clear();
    isHidden = true;
    notifyListeners();
  }
}
