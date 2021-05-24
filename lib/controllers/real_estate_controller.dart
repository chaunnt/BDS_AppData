import 'package:bds_appdata/config/texts.dart';
import 'package:bds_appdata/models/models.dart';
import 'package:bds_appdata/services/real_estate_service.dart';
import 'package:get/get.dart';

class RealEstateController extends GetxController {
  var saleRealEstateList = <RealEstate>[].obs;
  var rentRealEstateList = <RealEstate>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRealEstates(Texts.all);
  }

  void fetchRealEstates(String category) async {
    isLoading(true);
    List<List<RealEstate>> response = await Future.wait<List<RealEstate>>([
      RealEstateService.fetchRealEstates(category, RealEstateType.FORSALE),
      RealEstateService.fetchRealEstates(category, RealEstateType.FORRENT),
    ]);
    if (response[0] != null) {
      saleRealEstateList.value = response[0];
    }
    if (response[1] != null) {
      rentRealEstateList.value = response[1];
    }
    isLoading(false);
  }

  void updateRealEstateCategory(String category) {
    fetchRealEstates(category);
  }
}
