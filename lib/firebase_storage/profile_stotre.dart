import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishi_mitra/models/profile_detail_model.dart';
import 'package:krishi_mitra/screens/bottom_nav_bar.dart';
import 'package:krishi_mitra/screens/user_detail.dart';

class ProfileStorage {
  static FirebaseFirestore auth = FirebaseFirestore.instance;
  static final user = FirebaseAuth.instance.currentUser;
  static Future<void> addProfileData() async {
    await auth
        .collection("users")
        .doc()
        .set(ProfileDetailModel(
          name: UserDetailPage.userName.toString(),
          phone: "9624266194",
          uid: user!.uid,
          image: UserDetailPage.profilUrl.toString(),
        ).toJson())
        .then(
      (value) {
        Get.offUntil(
            MaterialPageRoute(
              builder: (context) => const CommonBottomNavigation(),
            ),
            (route) => false);
      },
    );
  }
}
