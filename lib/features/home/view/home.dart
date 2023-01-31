import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/home/controller/home.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        toolbarHeight: 70,
        backgroundColor: kWhite,
        title: Text(
          'Sociout',
          style: TextStyle(
              fontSize: 40,
              color: kBlack,
              fontFamily: GoogleFonts.teko(
                fontWeight: FontWeight.w500,
              ).fontFamily),
        ),
        actions: [
          IconButton(
              onPressed: () {
                provider.logout(context);
              },
              icon: const Icon(
                Icons.logout,
                color: kBlack,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 445,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 238, 238, 238)),
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
                                  style: TextStyle(fontWeight: FontWeight.w500),
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
                                fontWeight: FontWeight.w500, fontSize: 15),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              return kheight20;
            },
            itemCount: 10),
      ),
    );
  }
}

class PostButton extends StatelessWidget {
  const PostButton({
    Key? key,
    required this.icons,
    required this.text,
    required this.ontap,
  }) : super(key: key);

  final Icon icons;
  final String text;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: kWhite, minimumSize: const Size(80, 40)),
        child: Column(
          children: [
            icons,
            Text(
              text,
              style: const TextStyle(fontSize: 13, color: kBlack),
            )
          ],
        ));
  }
}
