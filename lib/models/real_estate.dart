import 'package:bds_appdata/config/texts.dart';
import 'package:bds_appdata/models/models.dart';
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

  factory RealEstate.fromJson(Map<String, dynamic> json) {
    final streetAddress = json['LocationFullAddress'].isEmpty
        ? ''
        : '${json['LocationFullAddress'].replaceAll(RegExp('- '), '')}, ';
    final List<String> images = (json['ImagesHouse'] as List<dynamic>)
        .map((imageUrl) => imageUrl as String)
        .toList();
    return RealEstate(
      name: '${json['AreaTypeName']}, ${json['HouseFloors']}, ${Texts.floor}',
      description:
          '${json['AreaWardName']}, ${json['AreaTypeName']}, ${json['AreaProvinceName']}',
      images: images,
      address:
          '$streetAddress${json['AreaWardName']}, ${json['AreaProvinceName']}',
      price: 'a',
      type: RealEstateType.FORSALE,
      interaction: Interaction(
        calls: 1,
        shares: 1,
        comments: 2,
        views: 2,
      ),
    );
  }
}

enum RealEstateType { FORSALE, FORRENT }
