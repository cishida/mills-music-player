import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_values.dart';
import 'package:mills_music_player/app/app.router.dart';
import 'package:mills_music_player/ui/views/bottom_nav/bottom_nav_view_model.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({Key? key}) : super(key: key);

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  // final Map<int, Widget> _viewCache = <int, Widget>{};

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
      viewModelBuilder: () => BottomNavViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  bottom: ConstValues.miniplayerHeight,
                ),
                child: ExtendedNavigator(
                  router: BottomNavViewRouter(),
                  navigatorKey: StackedService.nestedNavigationKey(
                    ConstValues.bottomNavRouterId,
                  ),
                ),
              ),
              Miniplayer(
                minHeight: ConstValues.miniplayerHeight,
                maxHeight: ConstValues.miniplayerHeight,
                builder: (height, percentage) => Container(
                  color: Colors.white,
                  child: Center(
                    child: Text('$height, $percentage'),
                  ),
                ),
              ),
            ],
          ),
          // body: ExtendedNavigator(
          //   router: BottomNavViewRouter(),
          //   navigatorKey: StackedService.nestedNavigationKey(
          //     ConstValues.bottomNavRouterId,
          //   ),
          // ),
          // body: Column(
          //   children: [
          //     TopNavBar(
          //       title: ConstValues.pageInfos[viewModel.currentTabIndex].title,
          //     ),
          //     Expanded(
          //       child: Container(
          //         color: ConstColors.offWhite,
          //         child: getViewForIndex(viewModel.currentTabIndex),
          //       ),
          //     ),
          //   ],
          // ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 2,
            backgroundColor: Colors.white,
            currentIndex: viewModel.currentTabIndex,
            onTap: viewModel.setTabIndex,
            type: BottomNavigationBarType.fixed,
            items: _buildNavItems(),
          ),
        );
      },
    );
  }

  // Widget getViewForIndex(int index) {
  //   if (!_viewCache.containsKey(index)) {
  //     _viewCache[index] = ConstValues.pageInfos[index].view;
  //   }

  //   return _viewCache[index]!;
  // }
}
