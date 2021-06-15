import 'package:bds_appdata/config/texts.dart';
import 'package:bds_appdata/models/models.dart';
import 'package:bds_appdata/services/real_estate_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RealEstateController extends GetxController {
  var saleRealEstateList = <RealEstate>[].obs;
  var rentRealEstateList = <RealEstate>[].obs;
  var isLoading = false.obs;
  var _currentRealEstateCategory;
  var areaProvinceFilter = Texts.all.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRealEstates(category: Texts.all);
  }

  void fetchRealEstates({
    @required String category,
    String areaProvinceName,
    String price,
  }) async {
    _currentRealEstateCategory = category;
    isLoading(true);
    List<List<RealEstate>> response = await Future.wait<List<RealEstate>>([
      RealEstateService.fetchRealEstates(
        category: category,
        type: RealEstateType.FORSALE,
        areaProvinceName: areaProvinceFilter.value,
      ),
      RealEstateService.fetchRealEstates(
        category: category,
        type: RealEstateType.FORRENT,
        areaProvinceName: areaProvinceFilter.value,
      ),
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
    fetchRealEstates(category: category);
  }

  void filterRealEstateWithArea(String areaProvinceName) {
    areaProvinceFilter.value = areaProvinceName;
    fetchRealEstates(
      category: _currentRealEstateCategory,
      areaProvinceName: areaProvinceName,
    );
  }
}
