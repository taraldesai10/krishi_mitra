import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishi_mitra/models/mapfor_government_schemes.dart';

class GovernmentSchemes extends StatefulWidget {
  const GovernmentSchemes({super.key});

  @override
  State<GovernmentSchemes> createState() => _GovernmentSchemesState();
}

class _GovernmentSchemesState extends State<GovernmentSchemes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("government".tr),
      ),
      body: Column(
        children: [
          ...List.generate(
              governmentTitles.length,
              (index) => Container(
                    height: 60,
                    decoration: BoxDecoration(color: Colors.green[300]),
                  ))
        ],
      ),
    );
  }
}
