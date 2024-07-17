import 'package:flutter/material.dart';

class ReceivingsHistoryScreen extends StatefulWidget {
  const ReceivingsHistoryScreen({super.key});

  @override
  State<ReceivingsHistoryScreen> createState() =>
      _ReceivingsHistoryScreenState();
}

class _ReceivingsHistoryScreenState extends State<ReceivingsHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("ReceivingsHistoryScreen"),
      ),
    );
  }
}
