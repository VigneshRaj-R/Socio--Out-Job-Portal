import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/create/widgets/textform.dart';
import 'package:sociout/features/jobs/controller/job_apply.dart';
import 'package:sociout/features/jobs/model/get_saved_job.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';
import 'package:sociout/utils/route.dart';

class JobApplyPage extends StatelessWidget {
  const JobApplyPage({
    super.key,
    required this.saveModel,
  });

  final GetSaved saveModel;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JobApplyController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              RouteNavigator.popRoute(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kBlack,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(saveModel.image.toString()),
              ),
            ),
            kheight20,
            Center(
              child: Text(
                saveModel.designation.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            kheight,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on_rounded,
                  color: kBlack,
                ),
                kWidth,
                Text(
                  saveModel.state.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 114, 114, 114)),
                ),
              ],
            ),
            kheight40,
            Row(
              children: [
                Expanded(
                  child: TextFormWidget(
                    keyboardtype: TextInputType.text,
                    text: 'First Name',
                    controller: provider.firstnameController,
                    validatorErrorMessage: 'First Name is Required',
                  ),
                ),
                kWidth10,
                Expanded(
                  child: TextFormWidget(
                    keyboardtype: TextInputType.text,
                    text: 'Last Name',
                    controller: provider.lastnameController,
                    validatorErrorMessage: 'First Name is Required',
                  ),
                )
              ],
            ),
            kheight20,
            TextFormWidget(
              text: 'Phone',
              controller: provider.phoneNumberController,
              validatorErrorMessage: 'First Name is Required',
            ),
            kheight20,
            TextFormWidget(
              keyboardtype: TextInputType.emailAddress,
              text: 'Email ',
              controller: provider.emailController,
              validatorErrorMessage: 'First Name is Required',
            ),
            kheight20,
            TextFormWidget(
              keyboardtype: TextInputType.text,
              text: 'Qulification',
              controller: provider.qulificationController,
              validatorErrorMessage: 'First Name is Required',
            ),
            kheight20,
            TextFormWidget(
              keyboardtype: TextInputType.text,
              text: 'Experience',
              controller: provider.experienceController,
              validatorErrorMessage: 'First Name is Required',
            ),
            kheight20,
            Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: kGrey),
              child: Column(
                children: [
                  kheight,
                  const Text(
                    'Upload Resume',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: kWhite, borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Text(
                        'DOC, png, PDF, jpge (Max 10mb)',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            kheight20,
            ElevatedButton(
                onPressed: () {
                  provider.applyButton(saveModel, context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: kBlack, minimumSize: const Size(280, 50)),
                child: const Text(
                  'Apply Now',
                  style: TextStyle(fontSize: 17),
                )),
            kheight20,
          ]),
        ),
      ),
    );
  }
}
