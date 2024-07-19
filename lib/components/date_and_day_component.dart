import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateAndDayComponent extends StatefulWidget {
  const DateAndDayComponent({super.key});

  @override
  State<DateAndDayComponent> createState() => _DateAndDayComponentState();
}

class _DateAndDayComponentState extends State<DateAndDayComponent> {
  DateTime selectedDate = DateTime.now();

  String _formatDateToDDMMYYYY(DateTime date) {
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  String _getDayName(DateTime date) {
    return DateFormat('EEEE').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              _formatDateToDDMMYYYY(selectedDate),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
    );
  }
}
