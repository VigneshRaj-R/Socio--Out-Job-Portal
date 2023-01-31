import 'package:flutter/material.dart';
import 'package:sociout/features/jobs/model/posted_job.dart';
import 'package:sociout/features/jobs/services/posted_job_services.dart';
import 'package:sociout/services/connection_check.dart';
import 'package:sociout/utils/snackbar.dart';

class PostedJobsController extends ChangeNotifier {
  List<Postedjobsmodel> alljobs = [];
  bool isLoading = false;

  PostedJobsController(context) {
    getAllJobs(context);
  }

  Future<void> getAllJobs(context) async {
    isLoading = true;
    notifyListeners();
    if (await connectionCheck()) {
      final response = await PostedJobServices().postedResponse(context);
      if (response == null) {
        ShowDialogs.popUp('Error');
        isLoadingFalse();
        return;
      } else if (response.isNotEmpty) {
        alljobs.clear();
        alljobs.addAll(response);
        isLoadingFalse();
        notifyListeners();
        return;
      } else if (response.isEmpty) {
        ShowDialogs.popUp("Nothing returned");
        isLoadingFalse();
        notifyListeners();
      }
    } else {
      ShowDialogs.popUp("No internet");
    }
    isLoadingFalse();
    notifyListeners();
  }

  void isLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }
}
