import 'package:bds_appdata/config/texts.dart';
import 'package:bds_appdata/models/models.dart';
import 'package:bds_appdata/utils/utils.dart';
import 'package:flutter/material.dart';

class RealEstate {
  final String name;
  final String description;
  final List<String> images;
  final String address;
  final num priceNumber;
  final String price;
  final Interaction interaction;
  final RealEstateType type;

  const RealEstate({
    @required this.name,
    @required this.description,
    @required this.priceNumber,
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
    final description =
        '''${Texts.landRealConstructionSquare} ${json['LandRealConstructionSquare']} ${Texts.squareMeter}
        \n${Texts.houseElectricity} ${json['HouseElectricity']}
        \n${Texts.houseFloorsSquare} ${json['HouseFloorsSquare']}${Texts.squareMeter}
        \n${Texts.houseFloorsType} ${json['HouseFloorsType']}
        \n${Texts.houseFurnitureName} ${json['HouseFurnitureName']}
        \n${json['HouseKitchens']} ${Texts.houseKitchens}
        \n${json['HouseLivingRooms']} ${Texts.houseLivingRooms}
        \n${json['HouseToilets']} ${Texts.houseToilets}
        \n${Texts.juridicalContructionLimitation} ${json['JuridicalContructionLimitation']}
        \n${Texts.juridicalStatusName} ${json['JuridicalStatusName']}
        \n${Texts.juridicalUsingStatusName} ${json['JuridicalUsingStatusName']}
        \n${Texts.landFrontSides} ${json['LandFrontSides']} ${Texts.frontSide}
    ''';

    return RealEstate(
      name:
          '${json['AreaTypeName']}, ${json['HouseFloors']} ${Texts.floor}, ${json['LandFrontSides']} ${Texts.side}',
      description: description,
      images: images,
      address: '$streetAddress$wardAddress${json['AreaProvinceName']}',
      priceNumber: price.isEmpty ? 0 : double.parse(price),
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
