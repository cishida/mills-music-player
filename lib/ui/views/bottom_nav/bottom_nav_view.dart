import 'package:flutter/material.dart';
import 'package:mills_music_player/ui/views/bottom_nav/bottom_nav_view_model.dart';
import 'package:mills_music_player/ui/views/home/home_view.dart';
import 'package:mills_music_player/ui/views/landing/landing_view.dart';
import 'package:stacked/stacked.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({Key? key}) : super(key: key);

  @override
  _BottomNavViewState createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  final Map<int, Widget> _viewCache = <int, Widget>{};

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavViewModel>.reactive(
      builder: (context, viewModel, child) => Scaffold(
        body: getViewForIndex(viewModel.currentTabIndex),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 6,
          backgroundColor: Colors.white,
          currentIndex: viewModel.currentTabIndex,
          onTap: viewModel.setTabIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.ac_unit),
            ),
            BottomNavigationBarItem(
              label: 'Albums & Playlists',
              icon: Icon(Icons.access_alarm),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.access_alarms),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => BottomNavViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    if (!_viewCache.containsKey(index)) {
      switch (index) {
        case 0:
          _viewCache[index] = const HomeView();
          break;
        case 1:
          _viewCache[index] = const LandingView();
          break;
        case 2:
          _viewCache[index] = const HomeView();
          break;
      }
    }

    return _viewCache[index]!;
  }
}
