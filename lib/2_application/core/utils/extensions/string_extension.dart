import 'package:intl/intl.dart';

extension Stringx on String {
  String dateTimeFormat() {
    List<String> spliter = split(' ');
    List<String> date = spliter[0].split('-');
    List<String> time = spliter[1].split(':');

    String finalDate = DateFormat('EEE, MMM d, yyyy h:mm a').format(
      DateTime(
        int.parse(date[0]),
        int.parse(date[1]),
        int.parse(date[2]),
        int.parse(time[0]),
        int.parse(time[1]),
        int.parse(time[2]),
      ),
    );

    return finalDate;
  }

  String dateFormat() {
    List<String> spliter = split(' ');
    List<String> date = spliter[0].split('-');
    List<String> time = spliter[1].split(':');

    String finalDate = DateFormat('EEEE, MMM d, yyyy').format(
      DateTime(
        int.parse(date[0]),
        int.parse(date[1]),
        int.parse(date[2]),
        int.parse(time[0]),
        int.parse(time[1]),
        int.parse(time[2]),
      ),
    );

    return finalDate;
  }

  String timeFormat() {
    List<String> spliter = split(' ');
    List<String> date = spliter[0].split('-');
    List<String> time = spliter[1].split(':');

    String finalDate = DateFormat('h:mm a').format(
      DateTime(
        int.parse(date[0]),
        int.parse(date[1]),
        int.parse(date[2]),
        int.parse(time[0]),
        int.parse(time[1]),
        int.parse(time[2]),
      ),
    );

    return finalDate;
  }
}
