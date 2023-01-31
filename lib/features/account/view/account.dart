import 'package:flutter/material.dart';
import 'package:sociout/features/home/view/home.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kheight20,
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://cdn.dribbble.com/users/1355613/screenshots/15252730/media/28f348daf9654c440f5dcf398d8e097a.jpg?compress=1&resize=400x300&vertical=top'),
                    ),
                    const Spacer(),
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Brototype',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          kheight,
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black),
                              child: const Text('Edit Profile'))
                        ],
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Navaneeth',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                kheight,
                const Text(
                  "Work until you didn't introduced by yourself ",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                kheight,
                // const Text(
                //   'Friends : 10k',
                //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                // ),
                const Divider(
                  thickness: 0.5,
                  color: kBlack,
                ),
                kheight20,
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 445,
                            width: 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:
                                    const Color.fromARGB(255, 238, 238, 238)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                kheight20,
                                Row(
                                  children: [
                                    kWidth10,
                                    const CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                          'https://images-platform.99static.com//7yC8nnjafc7ewpauYctKnJHhKNo=/20x166:661x807/fit-in/500x500/99designs-contests-attachments/124/124577/attachment_124577102'),
                                    ),
                                    kWidth10,
                                    Column(
                                      children: const [
                                        Text(
                                          'Naagavali',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '12.09.2000',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                kheight,
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ),
                                kheight,
                                Center(
                                  child: Container(
                                    height: 250,
                                    width: 320,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                'https://www.incimages.com/uploaded_files/image/1920x1080/getty_614867390_321301.jpg'))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      PostButton(
                                        icons: const Icon(
                                          Icons.favorite_border,
                                          color: kBlack,
                                        ),
                                        text: 'Like',
                                        ontap: () {},
                                      ),
                                      PostButton(
                                        icons: const Icon(
                                          Icons.mode_comment_outlined,
                                          color: kBlack,
                                        ),
                                        text: 'Comment',
                                        ontap: () {},
                                      ),
                                      PostButton(
                                        icons: const Icon(
                                          Icons.bookmark_border,
                                          color: kBlack,
                                        ),
                                        text: 'Save',
                                        ontap: () {},
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return kheight;
                    },
                    itemCount: 5)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
