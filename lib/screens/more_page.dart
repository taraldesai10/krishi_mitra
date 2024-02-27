import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:krishi_mitra/screens/bottomsheet.dart';
import 'package:krishi_mitra/screens/for_doctors/doctor_login.dart';

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
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green.shade800),
                ),
                GestureDetector(
                  onTap: () {
                    HapticFeedback.heavyImpact();
                    selectFile();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 140, bottom: 10),
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green.shade400),
                    child: const Center(
                      child: Icon(
                        CupertinoIcons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
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
            )
          ],
        ),
      ),
    );
  }
}
