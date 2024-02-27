// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishi_mitra/models/crop_doctor_maps.dart';
import 'package:krishi_mitra/screens/home_screen/crop_doctor/add_crop.dart';
import 'package:krishi_mitra/screens/login_page.dart';

class AddCropDetail extends StatefulWidget {
  const AddCropDetail({super.key, required this.image, required this.name});
  static String? selectedCondition;
  static String? plantedDate;
  static String? acers;

  @override
  State<AddCropDetail> createState() => _AddCropDetailState();
  final String image;
  final String name;
}

class _AddCropDetailState extends State<AddCropDetail> {
  int? selectedTap;
  TextEditingController txtAcresController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  String errorCondition = "";
  String errorDate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("add crop detail".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(
                      image: AssetImage(
                        widget.image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "select infection".tr,
                    style: GoogleFonts.lato(
                      fontSize: 17,
                      color: Colors.green[1000],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(
                      cropCondition.length,
                      (index) => GestureDetector(
                        onTap: () {
                          selectedTap = index;

                          //selectedCondition is for upload data in firebase
                          AddCropDetail.selectedCondition =
                              cropCondition[index]["name"];
                          print(AddCropDetail.selectedCondition);
                          setState(() {});
                        },
                        child: Container(
                          height: 130,
                          width: 100,
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (selectedTap == index)
                                ? Colors.green[600]
                                : Colors.green[200],
                            image: DecorationImage(
                              image: AssetImage(
                                cropCondition[index]["image"],
                              ),
                            ),
                          ),
                          child: Text(
                            cropCondition[index]["name"],
                            style: GoogleFonts.lato(
                              color: (selectedTap == index)
                                  ? Colors.white
                                  : Colors.green[900],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(errorCondition,
                    style: GoogleFonts.lato(color: Colors.red)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        // initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
                        firstDate: DateTime(2021),

                        lastDate: DateTime.now(), context: context,
                      );
                      if (picked != null && picked != selectedDate) {
                        setState(() {
                          AddCropDetail.plantedDate =
                              "${selectedDate.toLocal()}".split(' ')[0];

                          selectedDate = picked;
                        });
                      }
                    },
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.calendar),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Select date"),
                      ],
                    ),
                  ),
                ),
                Text(
                  errorDate,
                  style: GoogleFonts.lato(color: Colors.red),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Acres :"),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: 100,
                      // height: 30,
                      child: TextFormField(
                        cursorErrorColor: Colors.red,
                        validator: MultiValidator([
                          RequiredValidator(
                            errorText: "please enter acres",
                          ),
                          LengthRangeValidator(
                              min: 0, max: 4, errorText: "not allowed")
                        ]).call,
                        controller: txtAcresController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Text(PhoneVerificationScreen.comPhone),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      if (AddCropDetail.selectedCondition == null) {
                        errorCondition = "please select Condition";
                      }
                      if (AddCropDetail.plantedDate == null) {
                        errorDate = "please Enter date";
                        log(AddCropDetail.plantedDate.toString());
                      }
                      if (key.currentState!.validate()) {
                        AddCropDetail.acers = txtAcresController.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddCrop(),
                          ),
                        );
                      }

                      setState(() {});
                    },
                    child: const Text("next"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
