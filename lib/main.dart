import 'package:ak_enterprises_app/screens/dash_board_screen.dart';
import 'package:ak_enterprises_app/screens/day_closing_screen.dart';
import 'package:ak_enterprises_app/screens/deliveries_history_screen.dart';
import 'package:ak_enterprises_app/screens/deliveries_screen.dart';
import 'package:ak_enterprises_app/screens/login_screen.dart';
import 'package:ak_enterprises_app/screens/receivings_history_screen.dart';
import 'package:ak_enterprises_app/screens/receivings_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AK Enterprises',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/dashboard",
      routes: {
        "/login": (context) => const LoginScreen(),
        "/dashboard": (context) => const DashBoardScreen(),
        "/deliveries": (context) => const DeliveriesScreen(),
        "/deliverieshistory": (context) => const DeliveriesHistoryScreen(),
        "/receivings": (context) => const ReceivingsScreen(),
        "/receivingshistory": (context) => const ReceivingsHistoryScreen(),
        "/dayclosing": (context) => const DayClosingScreen(),
      },
    );
  }
}
