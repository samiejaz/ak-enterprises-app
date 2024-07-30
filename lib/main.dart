import 'package:ak_enterprises_app/screens/dash_board_screen.dart';
import 'package:ak_enterprises_app/screens/day_closing_screen.dart';
import 'package:ak_enterprises_app/screens/deliveries_history_screen.dart';
import 'package:ak_enterprises_app/screens/deliveries_screen.dart';
import 'package:ak_enterprises_app/screens/history_screen.dart';
import 'package:ak_enterprises_app/screens/login_screen.dart';
import 'package:ak_enterprises_app/screens/receivings_history_screen.dart';
import 'package:ak_enterprises_app/screens/receivings_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          datePickerTheme:
              const DatePickerThemeData(backgroundColor: Colors.white),
          textTheme: TextTheme(
              displayLarge: GoogleFonts.montserrat(),
              displayMedium: GoogleFonts.montserrat(),
              displaySmall: GoogleFonts.montserrat(),
              labelLarge: GoogleFonts.montserrat(),
              labelMedium: GoogleFonts.montserrat(),
              labelSmall: GoogleFonts.montserrat(),
              headlineLarge: GoogleFonts.montserrat(),
              headlineMedium: GoogleFonts.montserrat(),
              headlineSmall: GoogleFonts.montserrat(),
              bodySmall: GoogleFonts.montserrat(),
              bodyLarge: GoogleFonts.montserrat(),
              titleLarge: GoogleFonts.montserrat(),
              titleMedium: GoogleFonts.montserrat(),
              titleSmall: GoogleFonts.montserrat(),
              bodyMedium: GoogleFonts.montserrat()),
          dialogBackgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white),
      initialRoute: "/login",
      routes: {
        "/login": (context) => const LoginScreen(),
        "/dashboard": (context) => const DashBoardScreen(),
        "/deliveries": (context) => const DeliveriesScreen(),
        "/deliverieshistory": (context) => const DeliveriesHistoryScreen(),
        "/receivings": (context) => const ReceivingsScreen(),
        "/receivingshistory": (context) => const ReceivingsHistoryScreen(),
        "/dayclosing": (context) => const DayClosingScreen(),
        "/history": (context) => const HistoryScreen(),
      },
    );
  }
}
