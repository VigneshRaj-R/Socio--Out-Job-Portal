import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sociout/features/create/view/job_create.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/route.dart';

class PopUpWidgets extends StatelessWidget {
  const PopUpWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.add_event,
      animatedIconTheme: const IconThemeData(size: 22),
      backgroundColor: mainColor,
      visible: true,
      curve: Curves.bounceIn,
      children: [
        // FAB 1
        SpeedDialChild(
            child: const Icon(
              Icons.image,
              color: kWhite,
            ),
            backgroundColor: mainColor,
            onTap: () {/* do anything */},
            label: 'Image',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500, color: kBlack, fontSize: 16.0),
            labelBackgroundColor: kWhite),
        // FAB 2
        SpeedDialChild(
            child: const Icon(
              Icons.link,
              color: kWhite,
            ),
            backgroundColor: mainColor,
            onTap: () {},
            label: 'Links',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500, color: kBlack, fontSize: 16.0),
            labelBackgroundColor: kWhite),
        SpeedDialChild(
            child: const Icon(
              Icons.work_outline,
              color: kWhite,
            ),
            backgroundColor: mainColor,
            onTap: () {
              RouteNavigator.pushRoute(context, const JobCreate());
            },
            label: 'Post Jobs',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500, color: kBlack, fontSize: 16.0),
            labelBackgroundColor: kWhite)
      ],
    );
  }
}
