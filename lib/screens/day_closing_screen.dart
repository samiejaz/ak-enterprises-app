import 'package:ak_enterprises_app/components/title_component.dart';
import 'package:ak_enterprises_app/utils/constants.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DayClosingScreen extends StatefulWidget {
  const DayClosingScreen({super.key});

  @override
  State<DayClosingScreen> createState() => _DayClosingScreenState();
}

class _DayClosingScreenState extends State<DayClosingScreen> {
  DateTime selectedDate = DateTime.now();

  String _formatDateToDDMMYYYY(DateTime date) {
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  String _getDayName(DateTime date) {
    return DateFormat('EEEE').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child: const Icon(Icons.save),
        ),
        body: Column(
          children: [
            TitleComponent(title: "Day Closing"),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final DateTime? dateTime = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000));

                          if (dateTime != null) {
                            setState(() {
                              selectedDate = dateTime;
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            _formatDateToDDMMYYYY(selectedDate),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        _getDayName(selectedDate),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        DataCard(
                          heading: "Total Supplies",
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        DataCard(
                          heading: "Total Receveings",
                          backgroundColor: Colors.green,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [DataCardWithHandOverButtons(heading: 'Total')],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataCard extends StatelessWidget {
  Color? backgroundColor = Colors.blue;
  Color? textColor = Colors.white;
  String heading = "";

  DataCard(
      {super.key,
      this.backgroundColor = Colors.blue,
      this.textColor = Colors.white,
      required this.heading});

  final Map<String, String> data = {
    "Cash": "1900000000000",
    "Receivings": "190000",
    "Cheque": "190000",
    "Online": "190000",
    "Return": "190000"
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: textColor),
          ),
          const SizedBox(height: 15.0),
          ...data.entries.map((item) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "${item.key}: ",
                    children: <TextSpan>[
                      TextSpan(
                        text: item.value,
                        style: GoogleFonts.montserrat(
                            color: textColor, fontWeight: FontWeight.w800),
                      ),
                    ],
                    style: GoogleFonts.montserrat(
                        color: textColor, fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(height: 15.0),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class DataCardWithHandOverButtons extends StatelessWidget {
  Color? backgroundColor = Colors.blue;
  Color? textColor = Colors.white;
  String heading = "";

  DataCardWithHandOverButtons(
      {super.key,
      this.backgroundColor = Constants.primaryColor,
      this.textColor = Colors.white,
      required this.heading});

  final Map<String, String> data = {
    "Cash": "1900000000000",
    "Receivings": "190000",
    "Cheque": "190000",
    "Online": "190000",
    "Return": "190000"
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: textColor),
          ),
          const SizedBox(height: 15.0),
          ...data.entries.map((item) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "${item.key}: ",
                    children: <TextSpan>[
                      TextSpan(
                        text: "${item.value}  ",
                        style: GoogleFonts.montserrat(
                            color: textColor, fontWeight: FontWeight.w800),
                      ),
                      TextSpan(
                        text: "Handover",
                        style: GoogleFonts.montserrat(
                            color: textColor,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                    style: GoogleFonts.montserrat(
                        color: textColor, fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(height: 15.0),
              ],
            );
          }),
        ],
      ),
    );
  }
}
