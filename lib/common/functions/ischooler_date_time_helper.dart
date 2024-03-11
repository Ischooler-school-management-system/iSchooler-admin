import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IschoolerDateAndTimeHelper {
  static String? dateFormat(DateTime? date) {
    if (date != null) {
      return DateFormat('dd MMM, yyyy').format(date).toString();
    }
    return null;
  }

  R? processValue<T, R>(T? value, R? Function(T?) function) {
    if (value == null) {
      return null;
    }

    return function(value);
  }

  static String? timeFormat(DateTime? date) {
    final formatter = DateFormat('h:mm a');
    if (date != null) {
      return formatter.format(date);
    }
    return null;
  }

  static List<String> generateDateTimeList(
      DateTime startingDateTime, int count, Duration step) {
    List<String> result = [];
    for (int i = 0; i < count; i++) {
      DateTime add = startingDateTime.add(step * i);
      result.add(timeFormat(add) ?? '');
    }
    return result;
  }

  static DateTime toDateTime(dynamic dateMapValue) {
    DateTime date = DateTime(5000);
    try {
      if (dateMapValue != null && dateMapValue is String) {
        date = DateTime.parse(dateMapValue);
      }
      return date;
    } catch (e) {
      return date;
    }
  }

  static TimeOfDay toTimeOfDay(dynamic timeMapValue) {
    // Default time
    TimeOfDay time = const TimeOfDay(hour: 0, minute: 0);
    try {
      if (timeMapValue != null && timeMapValue is String) {
        // Parsing the time from the string representation
        List<String> timeParts = timeMapValue.split(":");
        int hour = int.parse(timeParts[0]);
        int minute = int.parse(timeParts[1]);
        time = TimeOfDay(hour: hour, minute: minute);
      }
      return time;
    } catch (e) {
      return time; // Return default time if parsing fails
    }
  }

  static String timeOfDayToMap(TimeOfDay timeOfDay) =>
      '${timeOfDay.hour}:${timeOfDay.minute}';

  static String timeOfDayToString(TimeOfDay timeOfDay) {
    return timeFormat(timeOfDay.toDateTime()) ?? '';
  }

  static DateTime? parseOrNull(String? value) {
    // DateTime date = DateTime(5000);
    if (value != null) {
      return DateTime.parse(value);
    }
    return null;
  }
}

extension TimeOfDayExtension on TimeOfDay {
  DateTime toDateTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hour, minute);
  }
}
