// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/views/albums/album/album_view.dart';
import '../ui/views/albums/albums_view.dart';
import '../ui/views/bottom_nav/bottom_nav_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/landing/landing_view.dart';
import '../ui/views/playlists/playlists_view.dart';
import '../ui/views/settings/settings_view.dart';

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
    RouteDef(
      Routes.bottomNavView,
      page: BottomNavView,
      generator: BottomNavViewRouter(),
    ),
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

class BottomNavViewRoutes {
  static const String homeView = '/';
  static const String albumsView = '/albums-view';
  static const String playlistsView = '/playlists-view';
  static const String settingsView = '/settings-view';
  static const all = <String>{
    homeView,
    albumsView,
    playlistsView,
    settingsView,
  };
}

class BottomNavViewRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(BottomNavViewRoutes.homeView, page: HomeView),
    RouteDef(
      BottomNavViewRoutes.albumsView,
      page: AlbumsView,
      generator: AlbumsViewRouter(),
    ),
    RouteDef(BottomNavViewRoutes.playlistsView, page: PlaylistsView),
    RouteDef(BottomNavViewRoutes.settingsView, page: SettingsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    AlbumsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AlbumsView(),
        settings: data,
      );
    },
    PlaylistsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PlaylistsView(),
        settings: data,
      );
    },
    SettingsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SettingsView(),
        settings: data,
      );
    },
  };
}

class AlbumsViewRoutes {
  static const String albumView = '/album-view';
  static const all = <String>{
    albumView,
  };
}

class AlbumsViewRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(AlbumsViewRoutes.albumView, page: AlbumView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    AlbumView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AlbumView(),
        settings: data,
      );
    },
  };
}
