import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerComponent extends StatefulWidget {
  final String label;
  final double borderRadius;
  final Color borderColor;
  final Color focusedBorderColor;
  final EdgeInsetsGeometry contentPadding;
  final ValueChanged<DateTime> onDateSelected;
  final String format;

  const DatePickerComponent(
      {super.key,
      required this.onDateSelected,
      this.label = '',
      this.borderRadius = 8.0,
      this.borderColor = Colors.blue,
      this.focusedBorderColor = Colors.green,
      this.contentPadding = const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      this.format = "dd-MMM-yyyy"});

  @override
  _DatePickerComponentState createState() => _DatePickerComponentState();
}

class _DatePickerComponentState extends State<DatePickerComponent> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }

  String get formattedDate {
    if (selectedDate == null) return '';
    return DateFormat(widget.format).format(selectedDate!);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius)),
            borderSide: BorderSide(
              color: widget.borderColor,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius)),
            borderSide: BorderSide(
              color: widget.borderColor,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius)),
            borderSide: BorderSide(
              color: widget.focusedBorderColor,
              width: 2.0,
            ),
          ),
          contentPadding: widget.contentPadding,
        ),
        child: Text(
          formattedDate,
          style: TextStyle(
            fontSize: 12.0,
            color: selectedDate == null ? Colors.grey : Colors.black,
          ),
        ),
      ),
    );
  }
}
