import 'package:flutter/material.dart';

class ReceivingsScreen extends StatefulWidget {
  const ReceivingsScreen({super.key});

  @override
  State<ReceivingsScreen> createState() => _ReceivingsScreenState();
}

class _ReceivingsScreenState extends State<ReceivingsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("ReceivingsScreen"),
      ),
    );
  }
}
