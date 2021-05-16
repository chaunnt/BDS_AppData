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
    fetchSaleRealEstates();
  }

  void fetchSaleRealEstates() async {
    isLoading(true);
    final realEstates =
        await RealEstateService.fetchSaleRealEstates(Texts.bietThu);
    if (realEstates != null) {
      saleRealEstateList.value = realEstates;
      isLoading(false);
    } else {
      isLoading(false);
    }
  }

  void fetchRentRealEstates() async {
    final realEstates =
        await RealEstateService.fetchSaleRealEstates(Texts.bietThu);
    if (realEstates != null) {
      rentRealEstateList.value = realEstates;
    }
  }
}
