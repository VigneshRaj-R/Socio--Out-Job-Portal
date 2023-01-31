import 'package:flutter/material.dart';
import 'package:sociout/features/jobs/widgets/posted/posted_jobs.dart';
import 'package:sociout/utils/colors.dart';

class TabbarWidget extends StatefulWidget {
  const TabbarWidget({super.key});

  @override
  State<TabbarWidget> createState() => _TabbarWidgetState();
}

class _TabbarWidgetState extends State<TabbarWidget> {
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          const TabBar(
            unselectedLabelStyle: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: kGrey),
            indicatorColor: Colors.grey,
            labelColor: kBlack,
            labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            tabs: [
              Tab(
                text: 'Posted Jobs',
              ),
              Tab(
                text: 'Applied Jobs',
              ),
            ],
          ),

          // create widgets for each tab bar here
          Expanded(
            child: TabBarView(
              children: [
                // first tab bar view widget
                const PostedListWidget(),

                // second tab bar viiew widget
                Container(
                  child: const Center(
                    child: Text(
                      'Car',
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
