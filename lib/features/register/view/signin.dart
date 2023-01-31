import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/register/controller/signin_controller.dart';
import 'package:sociout/features/register/view/signup.dart';
import 'package:sociout/features/register/widgets/custom_buttons.dart';
import 'package:sociout/features/register/widgets/textform_widget.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';
import 'package:sociout/utils/route.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SigninController>(context, listen: false);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: provider.signinKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kheight50,
                kheight50,
                const Center(
                  child: Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                kheight50,
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                kheight,
                TextFormWidget(
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
                  validatorErrorMessage: "Please enter Email", text: '',
                ),
                kheight20,
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                kheight,
                Consumer<SigninController>(
                  builder: (context, value, child) {
                    return TextFormWidget(
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
                      validatorErrorMessage: "Please enter Password", text: '',
                    );
                  },
                ),
                kheight,
                Row(
                  children: [
                    Consumer<SigninController>(
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
                    text: 'Login',
                    width: 300,
                    height: 70,
                    fontsize: 20,
                    ontap: () {
                      provider.loginButton(context);
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
                        color: mainColor,
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
                      "You don't have an account yet?",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                        onPressed: () {
                          RouteNavigator.pushRoute(
                              context, const SignupScreen());
                        },
                        child: const Text(
                          'Sign up',
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
