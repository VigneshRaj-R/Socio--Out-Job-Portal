import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sociout/features/jobs/model/get_saved_job.dart';
import 'package:sociout/features/jobs/model/job_apply_model.dart';
import 'package:sociout/features/jobs/model/job_apply_response.dart';
import 'package:sociout/features/jobs/services/job_apply.dart';
import 'package:sociout/services/connection_check.dart';
import 'package:sociout/utils/snackbar.dart';

class JobApplyController extends ChangeNotifier {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final qulificationController = TextEditingController();
  final experienceController = TextEditingController();
  String resume = '';
  bool isLoading = false;

  Future<void> applyButton(GetSaved jobid, context) async {
    if (await connectionCheck()) {
      isLoading = true;
      notifyListeners();

      final applyObj = Applymodel(
          jobId: jobid.id,
          userId: jobid.userId,
          fname: firstnameController.text,
          lname: lastnameController.text,
          phone: phoneNumberController.text,
          email: emailController.text,
          qualification: qulificationController.text,
          experience: experienceController.text);
      Applyresponse? jobApplyResponse =
          await JobApplyServices().jobapplyRepo(applyObj, context);
      if (jobApplyResponse == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('No Response.....'));
        isLoadingFalse();
        return;
      } else if (jobApplyResponse.applied == true) {
        log('apply Done');

        // RouteNavigator.pushRoute(context, const SavedJobPage());
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Job Applied Succesfully'));
        isLoadingFalse();
        return;
      } else if (jobApplyResponse.applied == false) {
        log('UnSave Done');

        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Job is already applied'));

        isLoadingFalse();
        return;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Something went wrong'));
        isLoadingFalse();
        return;
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(ShowDialogs.popUp('Please check interent connection'));
    }
  }

  void isLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }
}
