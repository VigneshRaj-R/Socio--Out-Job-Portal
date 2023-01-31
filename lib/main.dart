import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/create/controller/job_post.dart';
import 'package:sociout/features/home/controller/home.dart';
import 'package:sociout/features/jobs/controller/get_saved.dart';
import 'package:sociout/features/jobs/controller/job_apply.dart';
import 'package:sociout/features/jobs/controller/post_save.dart';
import 'package:sociout/features/jobs/controller/post_search.dart';
import 'package:sociout/features/jobs/controller/posted_job.dart';
import 'package:sociout/features/main/controller/navigation_bar.dart';
import 'package:sociout/features/main/controller/splash.dart';
import 'package:sociout/features/main/view/splash_screen.dart';
import 'package:sociout/features/register/controller/signin_controller.dart';
import 'package:sociout/features/register/controller/signup_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostedJobsController(context)),
        ChangeNotifierProvider(create: (_) => SigninController()),
        ChangeNotifierProvider(create: (_) => JobApplyController()),
        ChangeNotifierProvider(create: (_) => SavedJobsController(context)),
        ChangeNotifierProvider(create: (_) => JobSearchController()),
        ChangeNotifierProvider(create: (_) => JobSaveController()),
        ChangeNotifierProvider(create: (_) => JobPostController()),
        ChangeNotifierProvider(create: (_) => SplashController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => SignupController()),
        ChangeNotifierProvider(create: (_) => BottomNavBarController()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sociout',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashPage()),
    );
  }
}
