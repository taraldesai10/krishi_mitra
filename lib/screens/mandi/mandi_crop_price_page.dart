import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MandiCropPrice extends StatefulWidget {
  const MandiCropPrice({super.key});

  @override
  State<MandiCropPrice> createState() => _MandiCropPriceState();
}

class _MandiCropPriceState extends State<MandiCropPrice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("cropPrices").snapshots(),
        builder: (context, snapshot) => snapshot.data != null
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...List.generate(
                      snapshot.data!.docs.length,
                      (index) => Column(
                        children: [
                          Text(
                            snapshot.data!.docs[index]["crop"],
                          ),
                          // data = snapshot.data!.docs[index]["price"][index],
                          ...List.generate(
                            snapshot.data!.docs[index]["price"].length,
                            (var pIndex) => Text(
                              snapshot.data!.docs[index]["price"][pIndex],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
