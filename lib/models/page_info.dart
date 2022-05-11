import 'package:flutter/material.dart';

class PageInfo {
  PageInfo({
    required this.title,
    required this.icon,
    required this.view,
  });

  String title;
  Icon icon;
  Widget view;
}
