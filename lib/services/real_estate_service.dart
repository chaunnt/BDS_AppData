import 'package:bds_appdata/config/texts.dart';
import 'package:bds_appdata/models/models.dart';
import 'package:dio/dio.dart';

class RealEstateService {
  static final endPointUrl =
      'https://gateway.hodace.network/RealEstate/listFull';

  static Future<List<RealEstate>> fetchRealEstates(
      String category, RealEstateType type) async {
    final Dio dio = new Dio();
    final requestData = {
      'filter': {
        'AreaTypeName': category,
        'SystemPostType':
            type == RealEstateType.FORSALE ? Texts.raoBan : Texts.choThue,
      },
      'skip': 0,
      'limit': 10,
      'order': {}
    };
    if (category == Texts.all) {
      (requestData['filter'] as Map<String, Object>).remove('AreaTypeName');
    }
    try {
      final response = await dio.post(endPointUrl, data: requestData);
      final List<RealEstate> realEstateList = [];
      if (response.data['statusCode'] == 200) {
        final realEstateJson =
            response.data['data']['resultData'] as List<dynamic>;
        for (dynamic realEstate in realEstateJson) {
          realEstateList.add(RealEstate.fromJson(realEstate, type));
        }
        return realEstateList;
      } else {
        return null;
      }
    } catch (error) {
      print('FETCHING REALESTATE FAILED: ' + error);
      return null;
    }
  }
}
