import 'package:intl/intl.dart';

class TimeConverter {
  static String readableDate(DateTime? dateTime) {
    if (dateTime == null) return '-';
    try {
      final formattedDate = DateFormat('dd MMMM yyyy');
      return '${formattedDate.format(dateTime.toLocal())} ${dateTime.toLocal().timeZoneName}';
    } catch (e) {
      return '-';
    }
  }
}
