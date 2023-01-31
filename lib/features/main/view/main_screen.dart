import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/account/view/account.dart';
import 'package:sociout/features/create/view/create.dart';
import 'package:sociout/features/home/view/home.dart';
import 'package:sociout/features/jobs/view/jobs.dart';
import 'package:sociout/features/main/controller/navigation_bar.dart';
import 'package:sociout/features/message/view/message.dart';
import 'package:sociout/utils/colors.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final pages = [
    const HomePage(),
    const JobsPage(),
    const CreatePage(),
    const AccountPage(),
    const MessagePage()
  ];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavBarController>(context);
    return Scaffold(
      body: pages[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: kBlack,
          selectedItemColor: kWhite,
          //unselectedItemColor: kWhite,
          selectedFontSize: 25,
          selectedIconTheme: const IconThemeData(size: 32, color: kWhite),
          selectedLabelStyle: const TextStyle(fontSize: 10),
          unselectedLabelStyle: const TextStyle(color: kBlack),
          unselectedIconTheme: const IconThemeData(size: 28, color: kWhite),
          currentIndex: provider.currentIndex,
          onTap: (value) {
            provider.currentIndex = value;
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.supervised_user_circle_rounded,
                ),
                label: 'Jobs'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                ),
                label: 'Create'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                ),
                label: 'Account'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.messenger_outline_rounded,
                ),
                label: 'Message'),
          ]),
    );
  }
}
