import 'package:intl/intl.dart';

class DateTimeHelper {
  DateTime _now;

  DateTimeHelper() : _now = DateTime.now();

  // Método para obtener la fecha en formato dd/mm/yyyy
  String getFormattedDate() {
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(_now);
  }

  // Método para obtener la hora en formato HH:mm
  String getFormattedTime() {
    final DateFormat timeFormat = DateFormat('HH:mm');
    return timeFormat.format(_now);
  }

  // Método para obtener el timestamp de tipo DateTime
  DateTime getTimestamp() {
    return _now;
  }
}