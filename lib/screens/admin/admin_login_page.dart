import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text(
          "Welcome Admin",
          style: GoogleFonts.lato(color: Colors.white),
        ),
      ),
    );
  }
}
