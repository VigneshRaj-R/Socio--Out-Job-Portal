import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/jobs/controller/posted_job.dart';
import 'package:sociout/features/jobs/widgets/posted/job_full_view.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';
import 'package:sociout/utils/route.dart';

class RandomJobsWidget extends StatelessWidget {
  const RandomJobsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostedJobsController>(context, listen: false);
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            RouteNavigator.pushRoute(
                context, JobDetailsPage(jobModel: provider.alljobs[index]));
          },
          child: SizedBox(
              height: 200,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.all(13),
                elevation: 5,
                color: kGrey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kheight20,
                    Row(
                      children: [
                        kWidth10,
                        Expanded(
                          child: Text(
                            provider.alljobs[index].designation.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 20,
                                letterSpacing: 0.5,
                                wordSpacing: 0.5,
                                fontWeight: FontWeight.bold,
                                color: kBlack),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.bookmark_border))
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "${provider.alljobs[index].salaryMin.toString()} - ${provider.alljobs[index].salaryMax.toString()} LPA",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                        kWidth20,
                        kWidth20,
                        Container(
                          height: 25,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: kWhite),
                          child: Center(
                              child: Text(
                                  provider.alljobs[index].jobType.toString())),
                        )
                      ],
                    ),
                    kheight20,
                    Row(
                      children: [
                        kWidth10,
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: kWhite,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: MemoryImage(const Base64Decoder()
                                      .convert(provider.alljobs[index].image
                                          .toString())))),
                        ),
                        kWidth10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                provider.alljobs[index].company.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                provider.alljobs[index].place.toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          "\n${provider.alljobs[index].createdAt!.day} : ${provider.alljobs[index].createdAt!.month} : ${provider.alljobs[index].createdAt!.year}",
                          style: const TextStyle(
                              color: kBlack, fontWeight: FontWeight.w500),
                        ),
                        kWidth10,
                      ],
                    )
                  ],
                ),
              )),
        );
      },
      itemCount: provider.alljobs.length,
    );
  }
}
