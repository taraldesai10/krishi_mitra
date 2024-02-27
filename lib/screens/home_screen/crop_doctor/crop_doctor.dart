import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishi_mitra/screens/home_screen/crop_doctor/choose_crop.dart';

class CropDoctor extends StatefulWidget {
  const CropDoctor({super.key});

  @override
  State<CropDoctor> createState() => _CropDoctorState();
}

class _CropDoctorState extends State<CropDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(CupertinoIcons.arrow_left),
        ),
        title: Text("crop doctor".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          children: [
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green.shade900,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "crop doctor info".tr,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChooseCrop(),
                        ),
                      );
                      setState(() {});
                    },
                    child: Text(
                      "take picture".tr,
                      style: GoogleFonts.lato(
                        color: Colors.green.shade900,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
