import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDateToDDMMYYYY(DateTime date) {
  return DateFormat('dd-MMM-yyyy').format(date);
}

String getDayName(DateTime date) {
  return DateFormat('EEEE').format(date);
}

Color getColor(String status) {
  if (status.toUpperCase() == "PENDING") {
    return Colors.white;
  } else if (status.toUpperCase() == "COMPLETED" ||
      status.toUpperCase() == "OVERDUE") {
    return Colors.white;
  } else {
    return Colors.white;
  }
}
