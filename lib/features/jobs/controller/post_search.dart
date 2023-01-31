import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sociout/features/jobs/model/job_search.dart';
import 'package:sociout/features/jobs/model/job_search_response.dart';
import 'package:sociout/features/jobs/services/job_search.dart';
import 'package:sociout/services/connection_check.dart';
import 'package:sociout/utils/snackbar.dart';

class JobSearchController extends ChangeNotifier {
  bool isLoading = false;
  List<JobSearchModelResponse> searchResponse = [];
  final searchController = TextEditingController();

  jobSearch(context) async {
    if (await connectionCheck()) {
      isLoading = true;
      notifyListeners();

      JobSearchModel searchObj =
          JobSearchModel(designation: searchController.text);

      ModelSearch? jobSearchModelResponse =
          await JobSearchServies().jobSearchRepo(searchObj, context);

      if (jobSearchModelResponse == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('No Response'));
        isLoadingFalse();
        return;
      }
      //  else if (jobSearchModelResponse.success == "false") {
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(ShowDialogs.popUp('Something Went Wrong'));
      //   isLoadingFalse();
      //   return;
      // }
      else {
        log('============');
        searchResponse.clear();
        searchResponse.addAll(jobSearchModelResponse.listOfSearchResponse!);
        log(searchResponse.first.designation.toString());
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
