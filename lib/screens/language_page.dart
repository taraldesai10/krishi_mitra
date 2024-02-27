// ignore: file_names

// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishi_mitra/common/media_query.dart';
import 'package:krishi_mitra/screens/bottomsheet.dart';
import 'package:krishi_mitra/screens/login_page.dart';
import 'package:lottie/lottie.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              "assets/lottie/1-intro.json",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Text(
                "intro1 title".tr,
                style: TextStyle(
                    fontSize: displayHeight(context) * 0.03,
                    color: Colors.green.shade900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Text(
                "select language".tr,
                style: TextStyle(
                    fontSize: displayHeight(context) * 0.02,
                    color: Colors.green.shade700),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 165, 221, 166),
                    ),
                  ),
                  onPressed: () {
                    ForgetPasswordBottomSheet.buildBottomSheet(context);
                  },
                  child: Text(
                    'lenguage button'.tr,
                    style: TextStyle(
                        fontSize: displayHeight(context) * 0.014,
                        color: Colors.green.shade900),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.green),
                    shape: MaterialStatePropertyAll(
                      OutlinedBorder.lerp(
                          const CircleBorder(), const CircleBorder(), 360),
                    ),
                  ),
                  onPressed: () {
                    setState(
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PhoneVerificationScreen(),
                            ));
                      },
                    );
                  },
                  child: SizedBox(
                    // height: 100,
                    width: 60,
                    child: Lottie.asset("assets/lottie/arrow_icon.json"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
