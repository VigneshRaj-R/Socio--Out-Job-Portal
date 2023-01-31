import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/route.dart';

import '../controller/job_post.dart';

class ImageObtainWidget extends StatelessWidget {
  ImageObtainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final control = Provider.of<JobPostController>(context);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Container(
                    height: 100,
                    color: kWhite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              RouteNavigator.popRoute(context);
                              getImageFromCamera();
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0, backgroundColor: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  color: kBlack,
                                  size: 40,
                                ),
                                Text(
                                  'Camera',
                                  style: TextStyle(
                                    color: kBlack,
                                  ),
                                )
                              ],
                            )),
                        const SizedBox(
                          width: 80,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              RouteNavigator.popRoute(context);
                              control.getImageFromGallery();
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0, backgroundColor: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.image,
                                  color: kBlack,
                                  size: 40,
                                ),
                                Text(
                                  'Gallery',
                                  style: TextStyle(
                                    color: kBlack,
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  );
                });
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: kWhite, borderRadius: BorderRadius.circular(20)),
            child: Image.network(
              'https://static.thenounproject.com/png/396915-200.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  String cameraImage = '';
  getImageFromCamera() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    final bytes = File(pickedFile!.path);
    //notifyListeners();
  }

  var formData = FormData.fromMap({
    'name': 'wendux',
    'file': MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),
    'files': [
      MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
      MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
    ]
  });
}
