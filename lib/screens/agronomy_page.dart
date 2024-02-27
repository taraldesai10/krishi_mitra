import 'package:flutter/material.dart';

class AgronomiPage extends StatefulWidget {
  const AgronomiPage({super.key});

  @override
  State<AgronomiPage> createState() => _AgronomiPageState();
}

class _AgronomiPageState extends State<AgronomiPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Agronomy"),
      ),
    );
  }
}
