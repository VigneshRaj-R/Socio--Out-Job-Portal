import 'package:flutter/material.dart';
import 'package:sociout/features/register/view/signin.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';
import 'package:sociout/utils/route.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                  child: Image.asset(
                'assets/Screenshot 2022-09-30 114026.png',
                height: 400,
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  kheight50,
                  Text(
                    'Find Your',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Dream Job',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w800,
                        color: mainColor),
                  ),
                  Text(
                    'Explore all the most exciting remote job roles\n based on your interest.',
                    style: kTextStyle,
                  )
                ],
              )
            ],
          ),
        ),
      )),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            RouteNavigator.pushRemoveUntil(context, const SigninPage());
          },
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(), backgroundColor: mainColor,
              minimumSize: const Size(60, 100)),
          child: const Icon(Icons.arrow_right_alt_sharp)),
    );
  }
}
