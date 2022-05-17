// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../models/album/album.dart';
import '../ui/views/albums/album/album_view.dart';
import '../ui/views/albums/albums_container_view.dart';
import '../ui/views/albums/albums_view/albums_view.dart';
import '../ui/views/bottom_nav/bottom_nav_view.dart';
import '../ui/views/landing/landing_view.dart';
import '../ui/views/playlists/playlists_view.dart';
import '../ui/views/settings/settings_view.dart';
import '../ui/views/songs/songs_view.dart';

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
        maintainState: true,
      );
    },
  };
}

class BottomNavViewRoutes {
  static const String songsView = '/';
  static const String albumsContainerView = '/albums-container-view';
  static const String playlistsView = '/playlists-view';
  static const String settingsView = '/settings-view';
  static const all = <String>{
    songsView,
    albumsContainerView,
    playlistsView,
    settingsView,
  };
}

class BottomNavViewRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(BottomNavViewRoutes.songsView, page: SongsView),
    RouteDef(
      BottomNavViewRoutes.albumsContainerView,
      page: AlbumsContainerView,
      generator: AlbumsContainerViewRouter(),
    ),
    RouteDef(BottomNavViewRoutes.playlistsView, page: PlaylistsView),
    RouteDef(BottomNavViewRoutes.settingsView, page: SettingsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SongsView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SongsView(),
        settings: data,
        opaque: true,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 0),
        reverseTransitionDuration: const Duration(milliseconds: 0),
        maintainState: true,
      );
    },
    AlbumsContainerView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const AlbumsContainerView(),
        settings: data,
        opaque: true,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 0),
        reverseTransitionDuration: const Duration(milliseconds: 0),
        maintainState: true,
      );
    },
    PlaylistsView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const PlaylistsView(),
        settings: data,
        opaque: true,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 0),
        reverseTransitionDuration: const Duration(milliseconds: 0),
        maintainState: true,
      );
    },
    SettingsView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SettingsView(),
        settings: data,
        opaque: true,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 0),
        reverseTransitionDuration: const Duration(milliseconds: 0),
        maintainState: true,
      );
    },
  };
}

class AlbumsContainerViewRoutes {
  static const String albumsView = '/';
  static const String albumView = '/album-view';
  static const all = <String>{
    albumsView,
    albumView,
  };
}

class AlbumsContainerViewRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(AlbumsContainerViewRoutes.albumsView, page: AlbumsView),
    RouteDef(AlbumsContainerViewRoutes.albumView, page: AlbumView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    AlbumsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AlbumsView(),
        settings: data,
        maintainState: true,
      );
    },
    AlbumView: (data) {
      var args = data.getArgs<AlbumViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => AlbumView(
          key: args.key,
          album: args.album,
        ),
        settings: data,
        maintainState: true,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AlbumView arguments holder class
class AlbumViewArguments {
  final Key? key;
  final Album album;
  AlbumViewArguments({this.key, required this.album});
}
