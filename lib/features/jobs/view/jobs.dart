import 'package:flutter/material.dart';
import 'package:sociout/features/jobs/view/job_search.dart';
import 'package:sociout/features/jobs/view/jobs_ave.dart';
import 'package:sociout/features/jobs/widgets/saved/saved_list.dart';
import 'package:sociout/features/jobs/widgets/tabbar_widget.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';
import 'package:sociout/utils/route.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            title: const Text('jobs',
                style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold, color: kWhite)),
            centerTitle: true,
            backgroundColor: kBlack,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kheight20,
                    Row(children: [
                      GestureDetector(
                        onTap: (() {
                          RouteNavigator.pushRoute(
                              context, const JobSearchPage());
                        }),
                        child: Container(
                          height: 65,
                          width: MediaQuery.of(context).size.width / 1.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: kBlack)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 22),
                            child: Text(
                              'Search ',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kBlack,
                              minimumSize: const Size(50, 50)),
                          child: const Icon(
                            Icons.filter_list,
                            color: kWhite,
                          )),
                    ]),
                    kheight20,
                    Row(
                      children: [
                        const Text(
                          'Saved Jobs',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kBlack),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              RouteNavigator.pushRoute(
                                  context, const SavedJobPage());
                            },
                            child: const Text(
                              'View all',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            )),
                      ],
                    ),
                    kheight,
                    const SavedListWidget(),
                    kheight40,
                    // const Text(
                    //   'Posted Jobs',
                    //   style: TextStyle(
                    //       fontSize: 20, fontWeight: FontWeight.bold, color: kBlack),
                    // ),
                    // const PostedListWidget(),
                    const TabbarWidget()
                  ]),
            ),
          ),
        ));
  }
}
