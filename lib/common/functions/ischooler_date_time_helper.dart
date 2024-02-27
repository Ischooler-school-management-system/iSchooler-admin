import 'package:intl/intl.dart';

class IschoolerDateTimeHelper {
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

  static DateTime fromMapItem(dynamic dateMapValue) {
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

  static DateTime? parseOrNull(String? value) {
    // DateTime date = DateTime(5000);
    if (value != null) {
      return DateTime.parse(value);
    }
    return null;
  }
}
