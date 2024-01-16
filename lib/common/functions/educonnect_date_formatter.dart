import 'package:intl/intl.dart';

String? educonnectDateFormatter(DateTime? date) {
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
