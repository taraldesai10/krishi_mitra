import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController txtNameEditController = TextEditingController();
  var currentUser = FirebaseAuth.instance.currentUser;
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
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .where("uid", isEqualTo: currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) => Column(
          children: [
            ...List.generate(
                snapshot.data!.docs.length,
                (index) => Column(
                      children: [
                        Text(
                          snapshot.data!.docs[index]["name"],
                        ),
                      ],
                    ))
          ],
        ),
      ),
    );
  }
}
