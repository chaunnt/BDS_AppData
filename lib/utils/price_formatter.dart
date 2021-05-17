import 'package:bds_appdata/config/texts.dart';

class PriceFormatter {
  static String formatter(String price) {
    final num oneThousand = 100000;
    final num oneMillion = 1000000;
    final num oneBillion = 1000000000;
    try {
      double value = double.parse(price);
      if (value >= oneThousand && value < oneMillion) {
        // less than a million
        return '${(value / 1000).toStringAsFixed(0)} ${Texts.thousand}';
      } else if (value >= oneMillion && value < oneBillion) {
        // less than 1 billion
        return '${(value / oneMillion).toStringAsFixed(0)} ${Texts.million}';
      } else if (value >= oneBillion) {
        // more than or equal 1 billion
        final billion = value / oneBillion;
        final million = ((value - billion * oneBillion) / oneMillion);
        final millionText = million == 0
            ? ''
            : '${million.toStringAsFixed(0)} ${Texts.million}';
        return '${billion.toStringAsFixed(0)} ${Texts.billion} $millionText';
      } else {
        //handle other case of price here
        return '0';
      }
    } catch (e) {
      return '0';
    }
  }
}
