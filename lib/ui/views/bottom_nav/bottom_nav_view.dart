import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_values.dart';
import 'package:mills_music_player/ui/_dumb_widgets/nav/top_nav_bar.dart';
import 'package:mills_music_player/ui/views/bottom_nav/bottom_nav_view_model.dart';
import 'package:stacked/stacked.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({Key? key}) : super(key: key);

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  final Map<int, Widget> _viewCache = <int, Widget>{};

  List<BottomNavigationBarItem> _buildNavItems() {
    List<BottomNavigationBarItem> items = [];

    for (var pageInfo in ConstValues.pageInfos) {
      items.add(
        BottomNavigationBarItem(
          label: pageInfo.title,
          icon: pageInfo.icon,
        ),
      );
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavViewModel>.reactive(
      builder: (context, viewModel, child) => Scaffold(
        body: Column(
          children: [
            TopNavBar(
              title: ConstValues.pageInfos[viewModel.currentTabIndex].title,
            ),
            getViewForIndex(viewModel.currentTabIndex),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          currentIndex: viewModel.currentTabIndex,
          onTap: viewModel.setTabIndex,
          type: BottomNavigationBarType.fixed,
          items: _buildNavItems(),
        ),
      ),
      viewModelBuilder: () => BottomNavViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    if (!_viewCache.containsKey(index)) {
      _viewCache[index] = ConstValues.pageInfos[index].view;
    }

    return _viewCache[index]!;
  }
}
