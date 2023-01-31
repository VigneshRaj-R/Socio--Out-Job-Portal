import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/jobs/controller/post_search.dart';
import 'package:sociout/features/jobs/widgets/search_full_view.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';
import 'package:sociout/utils/route.dart';

class JobSearchPage extends StatelessWidget {
  const JobSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JobSearchController>(context);
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        backgroundColor: mainColor,
        elevation: 0,
        toolbarHeight: 80,
        title: const Text(
          'Search',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: kWhite),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: SingleChildScrollView(
            child: Column(children: [
              kheight50,
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        RouteNavigator.pushRoute(
                            context,
                            SearchDetailView(
                                searchModel: provider.searchResponse[index]));
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
                                        provider
                                            .searchResponse[index].designation
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
                                        margin: const EdgeInsets.only(left: 10),
                                        height: 55,
                                        width: 55,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: const Color.fromARGB(
                                              255, 224, 223, 223),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(provider
                                                .searchResponse[index].image
                                                .toString()),
                                          ),
                                        ),
                                      ),
                                      kWidth10,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5),
                                            child: Text(
                                              provider
                                                  .searchResponse[index].company
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5),
                                            child: Text(
                                              provider
                                                  .searchResponse[index].place
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
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
                                                .searchResponse[index].jobType
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
                                      'Posted Date:     ${provider.searchResponse[index].createdAt!.day} : ${provider.searchResponse[index].createdAt!.month} : ${provider.searchResponse[index].createdAt!.year}',
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
                  itemCount: provider.searchResponse.length),
            ]),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 100, bottom: 20, left: 10),
        child: ColoredBox(
          color: kWhite,
          child: Row(
            children: [
              const Expanded(child: Textwidget()),
              IconButton(
                  onPressed: () {
                    provider.jobSearch(context);
                  },
                  icon: const Icon(
                    Icons.search,
                    color: kBlack,
                    size: 30,
                  ))
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
    );
  }
}

class Textwidget extends StatelessWidget {
  const Textwidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JobSearchController>(context, listen: false);
    return TextFormField(
      controller: provider.searchController,
      decoration: InputDecoration(
          //contentPadding: const EdgeInsets.all(16),
          // prefixIcon: const Icon(
          //   Icons.search,
          //   color: kBlack,
          // ),
          hintText: 'Search...',
          hintStyle: const TextStyle(color: kBlack),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kBlack),
          )),
    );
  }
}
