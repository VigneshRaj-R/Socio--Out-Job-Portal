import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/jobs/controller/posted_job.dart';
import 'package:sociout/features/jobs/widgets/posted/job_full_view.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';
import 'package:sociout/utils/route.dart';

class ViewPostedJobs extends StatelessWidget {
  const ViewPostedJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostedJobsController>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight20,
          provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (() {
                        RouteNavigator.pushRoute(
                            context,
                            JobDetailsPage(
                              jobModel: provider.alljobs[index],
                            ));
                      }),
                      child: SizedBox(
                        height: 100,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 1,
                          color: Colors.white70,
                          child: Row(
                            children: [
                              kWidth10,
                              Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color.fromARGB(
                                        255, 224, 223, 223),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: MemoryImage(const Base64Decoder()
                                            .convert(provider
                                                .alljobs[index].image
                                                .toString())))),
                              ),
                              kWidth10,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    provider.alljobs[index].designation
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: kBlack),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    provider.alljobs[index].place.toString(),
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: kBlack),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    '4 days Left',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.bookmark_border,
                                          size: 30,
                                        )),
                                    kheight,
                                    Expanded(
                                      child: Text(
                                        "${provider.alljobs[index].salaryMax} LPA",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: kBlack),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: provider.alljobs.length,
                ),
        ],
      ),
    );
  }
}
