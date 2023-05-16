import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

extension Dimension on num {
  EdgeInsets get top => EdgeInsets.only(top: toDouble());

  EdgeInsets get left => EdgeInsets.only(left: toDouble());

  EdgeInsets get right => EdgeInsets.only(right: toDouble());

  EdgeInsets get bottom => EdgeInsets.only(bottom: toDouble());

  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: toDouble());

  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: toDouble());

  EdgeInsets get all => EdgeInsets.all(toDouble());

  SizedBox get width => SizedBox(width: toDouble());

  SizedBox get height => SizedBox(height: toDouble());
}

extension ColorParserString on String {
  Color get color {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension ColorParserInt on int {
  Color get color {
    return Color(this);
  }
}

extension TimeParser on Duration {
  String get display {
    final hour = (inSeconds / 3600).floor();
    final min = ((inSeconds / 60) % 60).floor();
    final sec = inSeconds % 60;
    final formatter = NumberFormat('00');
    return '${formatter.format(hour)}:${formatter.format(min)}:${formatter.format(sec)}';
  }
}
