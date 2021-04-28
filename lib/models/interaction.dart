import 'package:flutter/material.dart';

class Interaction {
  final int calls;
  final int shares;
  final int views;
  final int comments;

  const Interaction({
    @required this.calls,
    @required this.comments,
    @required this.shares,
    @required this.views,
  });
}
