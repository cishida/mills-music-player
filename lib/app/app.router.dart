// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/views/bottom_nav/bottom_nav_view.dart';
import '../ui/views/landing/landing_view.dart';

class Routes {
  static const String landingView = '/';
  static const String bottomNavView = '/bottom-nav-view';
  static const all = <String>{
    landingView,
    bottomNavView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.landingView, page: LandingView),
    RouteDef(Routes.bottomNavView, page: BottomNavView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    LandingView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LandingView(),
        settings: data,
      );
    },
    BottomNavView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const BottomNavView(),
        settings: data,
      );
    },
  };
}
