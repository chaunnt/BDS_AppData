import 'package:bds_appdata/config/texts.dart';
import 'package:bds_appdata/data/data.dart';
import 'package:bds_appdata/models/models.dart';
import 'package:bds_appdata/services/real_estate_service.dart';
import 'package:bds_appdata/utils/utils.dart';
import 'package:get/get.dart';

class RealEstateController extends GetxController {
  var saleRealEstateList = <RealEstate>[].obs;
  var rentRealEstateList = <RealEstate>[].obs;
  var isLoading = false.obs;
  var _currentRealEstateCategory;
  var areaProvinceFilter = dummyKhuVucFilterOptions[0].obs;
  var priceFilter = dummyMucGiaFilterOptions[0].obs;

  @override
  void onInit() {
    super.onInit();
    _fetchRealEstates(Texts.all);
  }

  Future<void> _fetchRealEstates(String category) async {
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
      saleRealEstateList.value = _filterPrice(response[0]);
    } else {
      saleRealEstateList.value = [];
    }
    if (response[1] != null) {
      rentRealEstateList.value = _filterPrice(response[1]);
    } else {
      rentRealEstateList.value = [];
    }
    isLoading(false);
  }

  List<RealEstate> _filterPrice(List<RealEstate> realEstateList) {
    return realEstateList
        .where((realEstate) =>
            PriceFilter.filterPrice(realEstate, priceFilter.value))
        .toList();
  }

  void updateRealEstateCategory(String category) {
    _fetchRealEstates(category);
  }

  Future<void> filterRealEstateWithArea(String areaProvinceName) async {
    areaProvinceFilter.value = areaProvinceName;
    await _fetchRealEstates(_currentRealEstateCategory);
  }

  Future<void> filterRealEstateWithPrice(String filter) async {
    priceFilter.value = filter;
    await _fetchRealEstates(_currentRealEstateCategory);
  }
}
