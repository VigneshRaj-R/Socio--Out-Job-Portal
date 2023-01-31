import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/create/controller/job_post.dart';
import 'package:sociout/features/create/widgets/image_obtain.dart';
import 'package:sociout/features/create/widgets/radio_button.dart';
import 'package:sociout/features/create/widgets/textform.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';
import 'package:sociout/utils/route.dart';

class JobCreate extends StatelessWidget {
  const JobCreate({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JobPostController>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        toolbarHeight: 70,
        backgroundColor: kWhite,
        leading: IconButton(
            onPressed: () {
              RouteNavigator.popRoute(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kBlack,
              size: 30,
            )),
        title: const Text(
          'Post Jobs',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: kBlack),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: provider.jobFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kheight20,
                const Text(
                  'Company Details',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Divider(
                  thickness: 1,
                ),
                kheight40,
                Row(
                  children: [
                    ImageObtainWidget(),
                    kWidth20,
                    Expanded(
                      child: Column(
                        children: [
                          TextFormWidget(
                            keyboardtype: TextInputType.text,
                            controller: provider.companyName,
                            text: 'Company Name',
                            validatorErrorMessage: 'Please Enter Company Name',
                          ),
                          kheight,
                          TextFormWidget(
                            keyboardtype: TextInputType.text,
                            validatorErrorMessage: 'Please Enter place',
                            text: 'Place',
                            controller: provider.companyPlace,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                kheight20,
                Row(
                  children: [
                    Expanded(
                        child: TextFormWidget(
                      keyboardtype: TextInputType.text,
                      validatorErrorMessage: 'Please Enter State',
                      text: 'State',
                      controller: provider.companystate,
                    )),
                    kWidth10,
                    Expanded(
                        child: TextFormWidget(
                      keyboardtype: TextInputType.text,
                      validatorErrorMessage: 'Please Enter Country',
                      text: 'Country',
                      controller: provider.companyCountry,
                    ))
                  ],
                ),
                kheight20,
                const Text(
                  'Job Details',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Divider(
                  thickness: 1,
                ),
                kheight20,
                Row(
                  children: [
                    Expanded(
                        child: TextFormWidget(
                      keyboardtype: TextInputType.text,
                      validatorErrorMessage: 'Job Designation required',
                      text: 'Job Designation ',
                      controller: provider.jobDesignation,
                    )),
                    kWidth10,
                    Expanded(
                        child: TextFormWidget(
                            keyboardtype: TextInputType.text,
                            validatorErrorMessage: 'Please Enter Job vacancies',
                            text: 'Job Vacancies ',
                            controller: provider.jobVaccancies)),
                  ],
                ),
                kheight20,
                RadioButton(),
                kheight,
                Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 10),
                  child: Consumer<JobPostController>(
                    builder: (context, value, child) {
                      return DropdownButton<String>(
                        elevation: 5,
                        iconEnabledColor: kBlack,
                        hint: Text(
                          value.dropdownValue,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        items: ['Full Time', 'Part Time', 'Remote']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          value.dropdownValue = newValue!;
                          value.notifyListeners();
                        },
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      '₹',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                    ),
                    kWidth,
                    Expanded(
                        child: TextFormWidget(
                            keyboardtype: TextInputType.number,
                            validatorErrorMessage: 'Required',
                            text: 'Min Salary',
                            controller: provider.minSalary)),
                    kWidth10,
                    const Text(
                      'to',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    kWidth10,
                    Expanded(
                        child: TextFormWidget(
                            keyboardtype: TextInputType.number,
                            validatorErrorMessage: 'Required',
                            text: 'Max Salary',
                            controller: provider.maxSalary))
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
                kheight20,
                TextFormField(
                  controller: provider.jobDiscription,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  maxLength: 400,
                  decoration: InputDecoration(
                      // contentPadding: const EdgeInsets.only(top: 10),
                      labelText: 'Description',
                      hintStyle: const TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Discription is Required';
                    }
                    return null;
                  },
                ),
                kheight,
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        // provider.isloading
                        //     ? const CircularProgressIndicator()
                        //     :
                        provider.jobPostButton(context);
                        // provider.dispos(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kBlack,
                          minimumSize: const Size(100, 50)),
                      child: const Text('Post')),
                ),
                kheight
              ],
            ),
          ),
        ),
      ),
    );
  }
}
