import 'package:bds_appdata/config/texts.dart';
import 'package:bds_appdata/models/real_estate.dart';

class PriceFilter {
  static bool filterPrice(RealEstate realEstate, String priceFilter) {
    var comparedPrice;
    switch (priceFilter) {
      case Texts.priceFilter1st:
        comparedPrice = 500000000;
        break;
      case Texts.priceFilter2nd:
        comparedPrice = 1000000000;
        break;
      case Texts.priceFilter3rd:
        comparedPrice = 10000000000;
        break;
      case Texts.all:
        return true;
    }
    if (realEstate.priceNumber <= comparedPrice) {
      return true;
    } else
      return false;
  }
}
