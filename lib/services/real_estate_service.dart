import 'package:bds_appdata/config/texts.dart';
import 'package:bds_appdata/models/models.dart';
import 'package:dio/dio.dart';

class RealEstateService {
  static final endPointUrl =
      'https://gateway.hodace.network/RealEstate/listFull';

  static Future<List<RealEstate>> fetchSaleRealEstates(
      String areaTypeName) async {
    final Dio dio = new Dio();
    final requestData = {
      'filter': {
        'AreaTypeName': areaTypeName,
        'SystemPostType': Texts.raoBan,
      },
      'skip': 0,
      'limit': 10,
      'order': {}
    };
    try {
      final response = await dio.post(endPointUrl, data: requestData);
      final List<RealEstate> realEstateList = [];
      if (response.data['statusCode'] == 200) {
        final realEstateJson =
            response.data['data']['resultData'] as List<dynamic>;
        for (dynamic realEstate in realEstateJson) {
          realEstateList.add(RealEstate.fromJson(realEstate));
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
