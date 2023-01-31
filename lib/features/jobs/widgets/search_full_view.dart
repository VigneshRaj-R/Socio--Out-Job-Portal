import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/jobs/controller/post_save.dart';
import 'package:sociout/features/jobs/model/job_search_response.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';
import 'package:sociout/utils/route.dart';

class SearchDetailView extends StatelessWidget {
  const SearchDetailView({
    super.key,
    required this.searchModel,
  });

  final JobSearchModelResponse searchModel;

  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<JobSaveController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              RouteNavigator.popRoute(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kBlack,
            )),
        actions: [
          IconButton(
              onPressed: () {
                provide.postSaveButton(context, searchModel);
              },
              icon: const Icon(
                Icons.bookmark_border_rounded,
                color: kBlack,
                size: 28,
              ))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight20,
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(searchModel.image.toString()),
                ),
              ),
              kheight20,
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    searchModel.designation.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              kheight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  kWidth20,
                  kWidth10,
                  Expanded(
                    child: Text(
                      searchModel.jobType.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 114, 114, 114)),
                    ),
                  ),
                  kWidth20,
                  const Text(
                    '•',
                    style: TextStyle(color: kGrey, fontSize: 20),
                  ),
                  kWidth20,
                  Expanded(
                    child: Text(
                      searchModel.state.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 114, 114, 114)),
                    ),
                  ),
                  kWidth20,
                  const Text(
                    '•',
                    style: TextStyle(color: kGrey, fontSize: 20),
                  ),
                  kWidth20,
                  Expanded(
                    child: Text(
                      searchModel.jobFor.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 114, 114, 114)),
                    ),
                  ),
                ],
              ),
              kheight,
              const Divider(
                thickness: 1,
              ),
              kheight20,
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/dollar_sign_PNG21539.png',
                          height: 60,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Salary',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 80, 80, 80)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "₹${searchModel.salaryMin.toString()} - ${searchModel.salaryMax.toString()} LPA",
                          style: const TextStyle(
                              color: kBlack,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor:
                              const Color.fromARGB(255, 209, 194, 237),
                          child: Image.asset(
                            'assets/clock.png',
                            height: 40,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Job Type',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 80, 80, 80)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          searchModel.jobType.toString(),
                          style: const TextStyle(
                              color: kBlack,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: const Color(0XFFbae5f5),
                          child: Image.asset(
                            'assets/516821-200.png',
                            height: 40,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Position',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 80, 80, 80)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          searchModel.jobFor.toString(),
                          style: const TextStyle(
                              color: kBlack,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              kheight40,
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Discreption',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              kheight20,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  searchModel.description.toString(),
                  maxLines: 50,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              kheight20,
            ],
          ),
        ),
      )),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            //  RouteNavigator.pushRoute(context, const JobApplyPage());
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: kBlack, minimumSize: const Size(280, 50)),
          child: const Text(
            'Apply Now',
            style: TextStyle(fontSize: 17),
          )),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
