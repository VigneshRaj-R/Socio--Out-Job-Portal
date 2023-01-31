import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/jobs/controller/get_saved.dart';
import 'package:sociout/features/jobs/widgets/saved/saved_details.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';
import 'package:sociout/utils/route.dart';

class SavedJobPage extends StatelessWidget {
  const SavedJobPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SavedJobsController>(context);
    return Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          backgroundColor: kBlack,
          elevation: 0,
          toolbarHeight: 80,
          title: const Text(
            'Saved Jobs',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: kWhite),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            RouteNavigator.pushRoute(
                                context,
                                SavedDetailsPage(
                                    saveModel: provider.alljobs[index]));
                          },
                          child: SizedBox(
                              height: 170,
                              child: Card(
                                margin: const EdgeInsets.all(13),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 5,
                                color: const Color.fromARGB(255, 213, 213, 213),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //kheight20,
                                    Row(
                                      children: [
                                        kWidth10,
                                        Expanded(
                                          child: Text(
                                            provider.alljobs[index].designation
                                                .toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: kBlack),
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.bookmark_border,
                                              color: Colors.transparent,
                                            ))
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            height: 55,
                                            width: 55,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: const Color.fromARGB(
                                                    255, 224, 223, 223),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                      provider
                                                          .alljobs[index].image
                                                          .toString(),
                                                    ))),
                                          ),
                                          kWidth,
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Text(
                                                  provider
                                                      .alljobs[index].company
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Text(
                                                  provider.alljobs[index].place
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 25,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: kWhite),
                                            child: Center(
                                                child: Text(provider
                                                    .alljobs[index].jobType
                                                    .toString())),
                                          )
                                        ],
                                      ),
                                    ),
                                    kheight,
                                    Row(
                                      children: [
                                        kWidth10,
                                        Text(
                                          'Posted Date:     ${provider.alljobs[index].createdAt!.day} : ${provider.alljobs[index].createdAt!.month} : ${provider.alljobs[index].createdAt!.year}',
                                          style: const TextStyle(
                                              color: kBlack,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        kWidth10,
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 1,
                        );
                      },
                      itemCount: provider.alljobs.length),
                ],
              ),
            ),
          ),
        ));
  }
}
