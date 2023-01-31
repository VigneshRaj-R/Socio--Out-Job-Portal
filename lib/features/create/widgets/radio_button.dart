import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/create/controller/job_post.dart';
import 'package:sociout/features/create/widgets/textform.dart';
import 'package:sociout/utils/constraints.dart';

class RadioButton extends StatelessWidget {
  RadioButton({
    Key? key,
  }) : super(key: key);

  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JobPostController>(context);
    return Column(
      children: [
        Row(
          key: globalKey,
          children: [
            Expanded(
              child: RadioListTile(
                title: const Text('Fresher'),
                value: "Fresher",
                groupValue: provider.groupValue,
                onChanged: (value) {
                  provider.radioButton('Fresher');
                  provider.displayNewTextfield = false;
                  provider.jobType = value.toString();
                },
              ),
            ),
            kWidth10,
            Expanded(
              child: RadioListTile(
                title: const Text('Experenced'),
                value: "Experenced",
                groupValue: provider.groupValue,
                onChanged: (value) {
                  provider.radioButton('Experenced');
                  provider.jobType = value.toString();
                  provider.displayNewTextfield = true;
                },
              ),
            ),
          ],
        ),
        Visibility(
            visible: provider.displayNewTextfield,
            child: Row(
              children: [
                Expanded(
                    child: SizedBox(
                        height: 70,
                        child: TextFormWidget(
                            validatorErrorMessage: 'Required',
                            text: 'Min Experience',
                            controller: provider.minExp))),
                kWidth10,
                const Text(
                  'to',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                kWidth10,
                Expanded(
                    child: SizedBox(
                        height: 70,
                        child: TextFormWidget(
                            validatorErrorMessage: 'Required',
                            text: 'Min Experience',
                            controller: provider.maxExp))),
              ],
            ))
      ],
    );
  }
}
