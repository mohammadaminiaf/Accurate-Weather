import 'package:jiffy/jiffy.dart';

extension ConvertTimestamp on int {
  String get time =>
      Jiffy.parseFromMillisecondsSinceEpoch(this * 1000).format(pattern: 'Hm');

  String get dateTime => Jiffy.parseFromMillisecondsSinceEpoch(this * 1000)
      .format(pattern: 'yMMMMd');
}
