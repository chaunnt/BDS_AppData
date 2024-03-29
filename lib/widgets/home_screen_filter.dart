import 'package:bds_appdata/config/palette.dart';
import 'package:bds_appdata/config/texts.dart';
import 'package:bds_appdata/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenFilter extends StatelessWidget {
  final String filterName;
  final List<String> filterOptions;

  HomeScreenFilter({
    @required this.filterName,
    @required this.filterOptions,
  });

  final RealEstateController realEstateController = Get.find();

  Future<void> _filterRealEstateWithArea(String areaFilter) async {
    await realEstateController.filterRealEstateWithArea(areaFilter);
  }

  Future<void> _filterRealEstateWithPrice(String priceFilter) async {
    await realEstateController.filterRealEstateWithPrice(priceFilter);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          style: TextStyle(
            fontSize: 12.0,
            color: Palette.grey,
          ),
          hint: Text(filterName),
          value: filterName == Texts.khuVuc
              ? realEstateController.areaProvinceFilter.value
              : realEstateController.priceFilter.value,
          items: filterOptions
              .map(
                (option) => DropdownMenuItem(
                  value: option,
                  child: Text(option),
                ),
              )
              .toList(),
          onChanged: filterName == Texts.khuVuc
              ? _filterRealEstateWithArea
              : _filterRealEstateWithPrice,
        ),
      ),
    );
  }
}
