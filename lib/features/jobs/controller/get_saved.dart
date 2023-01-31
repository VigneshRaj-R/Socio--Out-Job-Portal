import 'package:flutter/material.dart';
import 'package:sociout/features/jobs/model/get_saved_job.dart';
import 'package:sociout/features/jobs/services/get_saved.dart';
import 'package:sociout/services/connection_check.dart';
import 'package:sociout/utils/snackbar.dart';

class SavedJobsController extends ChangeNotifier {
  List<GetSaved> alljobs = [];
  bool isLoading = false;
  bool buttonColor = false;

  SavedJobsController(context) {
    getAllSavedJobs(context);
  }

  Future<void> getAllSavedJobs(context) async {
    isLoading = true;
    notifyListeners();
    if (await connectionCheck()) {
      final response = await GetSavedServices().savedResponse(context);
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
