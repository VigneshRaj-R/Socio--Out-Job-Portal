import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/register/controller/signup_controller.dart';
import 'package:sociout/features/register/widgets/custom_buttons.dart';
import 'package:sociout/features/register/widgets/textform_widget.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';
import 'package:sociout/utils/route.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupController>(context, listen: false);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Form(
            key: provider.signupKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kheight50,
                const Center(
                  child: Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                kheight50,
                const Text(
                  'Full name',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                kheight,
                TextFormWidget(
                  hiddentext: false,
                  icon: Icons.person_outline_rounded,
                  hintText: 'Full name',
                  iconsize: 23,
                  textHeight: 15,
                  padding: 20,
                  color: kGrey,
                  radius: 10,
                  iconcolor: kBlack,
                  controller: provider.userNameController,
                  validatorErrorMessage: "Please enter Name",
                  text: '',
                ),
                kheight20,
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                kheight,
                TextFormWidget(
                  text: '',
                  hiddentext: false,
                  icon: Icons.email_outlined,
                  hintText: 'Email',
                  iconsize: 23,
                  textHeight: 15,
                  padding: 20,
                  color: kGrey,
                  radius: 10,
                  iconcolor: kBlack,
                  controller: provider.emailController,
                  validatorErrorMessage: "Please enter Email",
                ),
                kheight20,
                const Text(
                  'Moblie',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                kheight,
                TextFormWidget(
                  text: '',
                  hiddentext: false,
                  icon: Icons.phone_android_outlined,
                  hintText: 'Mobile Number',
                  iconsize: 23,
                  textHeight: 15,
                  padding: 20,
                  color: kGrey,
                  radius: 10,
                  iconcolor: kBlack,
                  controller: provider.mobileController,
                  validatorErrorMessage: "Please enter Mobile Number",
                ),
                kheight20,
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                kheight,
                Consumer<SignupController>(
                  builder: (context, value, child) {
                    return TextFormWidget(
                      text: '',
                      sufixIcon: IconButton(
                          onPressed: () {
                            provider.isHidden = !provider.isHidden;
                          },
                          icon: Icon(
                            provider.isHidden
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: kBlack,
                          )),
                      icon: Icons.lock_outline_rounded,
                      hintText: 'Password',
                      iconsize: 23,
                      textHeight: 15,
                      padding: 20,
                      color: kGrey,
                      radius: 10,
                      iconcolor: kBlack,
                      controller: provider.passwordController,
                      hiddentext: value.isHidden ? false : true,
                      validatorErrorMessage: "Please enter Password",
                    );
                  },
                ),
                kheight,
                Row(
                  children: [
                    Consumer<SignupController>(
                        builder: (context, value, child) {
                      return Checkbox(
                        splashRadius: 10,
                        checkColor: kWhite,
                        activeColor: const Color.fromARGB(255, 99, 100, 100),
                        value: provider.isCheck,
                        onChanged: (value) {
                          provider.isCheck = !provider.isCheck;
                        },
                      );
                    }),
                    const Text(
                      'Remember me',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Forgot Password ?'))
                  ],
                ),
                kheight20,
                Center(
                  child: CustomButton(
                    borderColor: mainColor,
                    buttonColor: mainColor,
                    text: 'Sign Up',
                    width: 300,
                    height: 70,
                    fontsize: 20,
                    ontap: () {
                      provider.registerButton(context);
                    },
                    color: kWhite,
                  ),
                ),
                kheight20,
                Center(
                  child: Container(
                    height: 70,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kWhite,
                      border: Border.all(
                        width: 2,
                        color: kBlack,
                      ),
                    ),
                    child: Row(
                      children: [
                        kWidth20,
                        Image.network(
                          'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png',
                          height: 50,
                        ),
                        kWidth10,
                        const Text(
                          'Sign in with Google',
                          style: kTextStyle2,
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You have an account ?",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                        onPressed: () {
                          RouteNavigator.popRoute(context);
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20, color: mainColor),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
