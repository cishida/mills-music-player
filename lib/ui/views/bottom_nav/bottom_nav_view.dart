import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_values.dart';
import 'package:mills_music_player/ui/views/bottom_nav/bottom_nav_view_model.dart';
import 'package:mills_music_player/ui/views/home/home_view.dart';
import 'package:mills_music_player/ui/views/landing/landing_view.dart';
import 'package:stacked/stacked.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({Key? key}) : super(key: key);

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  final Map<int, Widget> _viewCache = <int, Widget>{};

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavViewModel>.reactive(
      builder: (context, viewModel, child) => Scaffold(
        body: getViewForIndex(viewModel.currentTabIndex),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          currentIndex: viewModel.currentTabIndex,
          onTap: viewModel.setTabIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              label: ConstValues.appPages[0],
              icon: const Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: ConstValues.appPages[1],
              icon: const Icon(Icons.folder),
            ),
            BottomNavigationBarItem(
              label: ConstValues.appPages[2],
              icon: const Icon(Icons.add_to_photos),
            ),
            BottomNavigationBarItem(
              label: ConstValues.appPages[3],
              icon: const Icon(Icons.settings),
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
        case 3:
          _viewCache[index] = const LandingView();
          break;
      }
    }

    return _viewCache[index]!;
  }
}
