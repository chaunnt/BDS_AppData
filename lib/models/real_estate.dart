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
}

enum RealEstateType {
  FORSALE,
  FORRENT
}
