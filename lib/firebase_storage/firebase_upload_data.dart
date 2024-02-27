// ignore_for_file: invalid_return_type_for_catch_error, avoid_print

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:krishi_mitra/models/crop_detail_model.dart';
import 'package:krishi_mitra/screens/home_screen/crop_doctor/add_crop.dart';
import 'package:krishi_mitra/screens/home_screen/crop_doctor/add_crop_detail.dart';
import 'package:krishi_mitra/screens/home_screen/crop_doctor/choose_crop.dart';
import 'package:krishi_mitra/screens/home_screen/crop_doctor/crop_doctor.dart';

class UploadData {
  static String uploadCollection = "upload";
  static CollectionReference upload =
      FirebaseFirestore.instance.collection(uploadCollection);
  static Future<void> addUploadData() async {
    final newUpload = CropDetail(
      acres: AddCropDetail.acers.toString(),
      condition: AddCropDetail.selectedCondition.toString(),
      cropName: ChooseCrop.cropName.toString(),
      date: AddCropDetail.plantedDate.toString(),
      picture: AddCrop.url.toString(),
      name: ChooseCrop.cropName.toString(),
    );
    return await upload.doc().set(newUpload.toJson()).then(
      (value) {
        Get.offAll(
          MaterialPageRoute(
            builder: (context) => const CropDoctor(),
          ),
        );
        log("data Upload");
      },
    ).catchError((onError) => print(onError));
  }
}
