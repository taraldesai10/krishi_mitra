import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:krishi_mitra/screens/more/edit_profile.dart';
import 'package:krishi_mitra/screens/bottomsheet.dart';
import 'package:krishi_mitra/screens/for_doctors/doctor_login.dart';
import 'package:krishi_mitra/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  PlatformFile? pickedFile;

  int count = 1;
  UploadTask? uploadTask;
  Future uploadFile() async {
    final path = "files/${pickedFile!.name}";
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });
    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    log("Downlod Link : $urlDownload");
    setState(() {
      uploadTask = null;
    });
  }

  Future selectFile() async {
    var result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.green.shade800),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfile(),
                  ),
                );
                setState(() {});
              },
              child: Text("edit profile".tr),
            ),
            ElevatedButton(
              onPressed: () {
                HapticFeedback.heavyImpact();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DoctorLogin(),
                    ));
              },
              child: Text("doctor login".tr),
            ),
            ElevatedButton(
              onPressed: () {
                ForgetPasswordBottomSheet.buildBottomSheet(context);
              },
              child: Text(
                'lenguage button'.tr,
                style: TextStyle(color: Colors.green.shade900),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                var sharedPref = await SharedPreferences.getInstance();
                sharedPref.setBool(SplashScreen.keyLogin, false);
                Get.offAll(SplashScreen());
              },
              child: Text(
                'logout',
                style: TextStyle(color: Colors.green.shade900),
              ),
            )
          ],
        ),
      ),
    );
  }
}
