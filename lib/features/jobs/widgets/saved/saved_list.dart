import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/jobs/controller/get_saved.dart';
import 'package:sociout/features/jobs/widgets/saved/saved_details.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';
import 'package:sociout/utils/route.dart';

class SavedListWidget extends StatelessWidget {
  const SavedListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final saveprovider = Provider.of<SavedJobsController>(context);

    return LimitedBox(
      maxHeight: MediaQuery.of(context).size.height / 4.3,
      child: saveprovider.alljobs.isEmpty
          ? const Center(
              child: Text(
                'No Saved Data',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: saveprovider.alljobs.length < 2
                  ? saveprovider.alljobs.length
                  : 2,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    RouteNavigator.pushRoute(
                        context,
                        SavedDetailsPage(
                            saveModel: saveprovider.alljobs[index]));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), color: kGrey),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 8, top: 8),
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color.fromARGB(
                                          255, 224, 223, 223),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            saveprovider.alljobs[index].image
                                                .toString(),
                                          ))),
                                ),
                                kWidth10,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      saveprovider.alljobs[index].company
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      saveprovider.alljobs[index].place
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 20,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              saveprovider.alljobs[index].designation
                                  .toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 5,
                          ),
                          child: Text(
                            "₹ ${saveprovider.alljobs[index].salaryMin.toString()} - ${saveprovider.alljobs[index].salaryMax.toString()}LPA",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            top: 15,
                          ),
                          height: 25,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: kWhite),
                          child: Center(
                              child: Text(saveprovider.alljobs[index].jobType
                                  .toString())),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return kWidth20;
              },
            ),
    );
  }
}
