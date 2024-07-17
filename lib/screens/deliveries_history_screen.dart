import 'package:flutter/material.dart';

class DeliveriesHistoryScreen extends StatefulWidget {
  const DeliveriesHistoryScreen({super.key});

  @override
  State<DeliveriesHistoryScreen> createState() =>
      _DeliveriesHistoryScreenState();
}

class _DeliveriesHistoryScreenState extends State<DeliveriesHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Deleivery History"),
      ),
    );
  }
}
