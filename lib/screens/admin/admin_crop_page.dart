import 'package:flutter/material.dart';

class AdminCropPage extends StatefulWidget {
  const AdminCropPage({super.key});

  @override
  State<AdminCropPage> createState() => _AdminCropPageState();
}

class _AdminCropPageState extends State<AdminCropPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crop Page"),
      ),
    );
  }
}
