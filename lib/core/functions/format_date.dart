 import 'package:intl/intl.dart';

String getFormattedTime(String createdAt) {
    DateTime dateTime = DateTime.parse(createdAt);
    return DateFormat('HH:mm').format(dateTime);
  }