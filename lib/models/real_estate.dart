import 'package:bds_appdata/config/texts.dart';
import 'package:bds_appdata/models/models.dart';
import 'package:bds_appdata/utils/utils.dart';
import 'package:flutter/material.dart';

class RealEstate {
  final String name;
  final String description;
  final List<String> images;
  final String address;
  final String price;
  final Interaction interaction;
  final RealEstateType type;

  const RealEstate({
    @required this.name,
    @required this.description,
    @required this.price,
    @required this.address,
    @required this.type,
    @required this.interaction,
    this.images,
  });

  factory RealEstate.fromJson(Map<String, dynamic> json, RealEstateType type) {
    final streetAddress = json['LocationFullAddress'].isEmpty
        ? ''
        : '${json['LocationFullAddress'].replaceAll(RegExp('- '), '')}, ';
    final wardAddress =
        json['AreaWardName'].isEmpty ? '' : '${json['AreaWardName']}, ';
    final List<String> images = (json['ImagesHouse'] as List<dynamic>)
        .map((imageUrl) => imageUrl as String)
        .toList();
    final String price = type == RealEstateType.FORSALE
        ? json['ValueSalePrice']
        : json['ValueRentPrice'];
    return RealEstate(
      name:
          '${json['AreaTypeName']}, ${json['HouseFloors']} ${Texts.floor}, ${json['LandFrontSides']} ${Texts.side}',
      description: '$wardAddress${json['AreaProvinceName']}',
      images: images,
      address: '$streetAddress$wardAddress${json['AreaProvinceName']}',
      price: PriceFormatter.formatter(price),
      type: type,
      interaction: Interaction(
        calls: (json['phoneCallCount'] as int) ?? 0,
        shares: (json['ShareCount'] as int) ?? 0,
        comments: (json['messageCallCount'] as int) ?? 0,
        views: (json['ViewCount'] as int) ?? 0,
      ),
    );
  }
}

enum RealEstateType { FORSALE, FORRENT }
