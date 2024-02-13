import 'package:intl/intl.dart';

class EduconnectDateTimeHelper {
  static String? format(DateTime? date) {
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
