import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sociout/features/create/model/job_post.dart';
import 'package:sociout/features/create/model/job_response.dart';
import 'package:sociout/features/create/services/job_create_services.dart';
import 'package:sociout/features/main/view/main_screen.dart';
import 'package:sociout/utils/route.dart';
import 'package:sociout/utils/snackbar.dart';

class JobPostController extends ChangeNotifier {
  final companyName = TextEditingController();
  final companyPlace = TextEditingController();
  final companystate = TextEditingController();
  final companyCountry = TextEditingController();
  final jobDesignation = TextEditingController();
  final jobVaccancies = TextEditingController();
  final minSalary = TextEditingController();
  final maxSalary = TextEditingController();
  final jobDiscription = TextEditingController();
  final minExp = TextEditingController();
  final maxExp = TextEditingController();
  bool displayNewTextfield = false;
  final jobFormKey = GlobalKey<FormState>();
  String dropdownValue = 'Select';
  String jobType = '';
  String image = '';

  void jobPostButton(context) async {
    log(image);
    if (jobFormKey.currentState!.validate() && jobType.isNotEmpty) {
      isloading = true;
      notifyListeners();
      log(image.toString());
      final jobObj = JobPostModel(
          company: companyName.text,
          country: companyCountry.text,
          description: jobDiscription.text,
          designation: jobDesignation.text,
          jobFor: jobType,
          jobType: dropdownValue,
          place: companyPlace.text,
          salaryMax: maxSalary.text,
          salaryMin: minSalary.text,
          state: companystate.text,
          vacancy: jobVaccancies.text,
          expMax: minExp.text,
          expMin: minExp.text,
          image: image);

      JobResponseModel? jobResponseModel =
          await JobCreateServices().jobPostServices(jobObj);

      if (jobResponseModel == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('No Response.....'));
        _isLoadingFalse();
        return;
      } else if (jobResponseModel.success == true) {
        RouteNavigator.pushRemoveUntil(context, MainScreen());
        _isLoadingFalse();
        return;
      } else if (jobResponseModel.success == false) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Invalid Data'));
        _isLoadingFalse();
        return;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Something Went Wrong'));
        _isLoadingFalse();
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(ShowDialogs.popUp('Please select the Job Type'));
    }
  }

  String groupValue = '';
  radioButton(value) {
    groupValue = value;
    notifyListeners();
  }

  // validator(context) {
  //   if (jobFormKey.currentState!.validate() && jobType.isNotEmpty) {
  //     RouteNavigator.pushRoute(context, MainScreen());
  //   } else {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(ShowDialogs.popUp('Please select the Job Type'));
  //   }
  // }

  bool isloading = false;
  void _isLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  Future<void> getImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 100,
        maxWidth: 100,
        imageQuality: 50);
    if (pickedFile == null) {
      return;
    } else {
      // final byte = pickedFile.path.toString().split("//").last;
      // image = byte;
      final bytes = File(pickedFile.path).readAsBytesSync();
      image = base64Encode(bytes);
      log(image);
      notifyListeners();
    }
  }

  void dispos(context) {
    jobFormKey.currentState!.reset();
    companyCountry.clear();
    companyName.clear();
    companyPlace.clear();
    companystate.clear();
    jobDesignation.clear();
    jobDiscription.clear();
    jobVaccancies.clear();
    minSalary.clear();
    maxSalary.clear();
    minExp.clear();
    maxExp.clear();
    notifyListeners();
  }
}
