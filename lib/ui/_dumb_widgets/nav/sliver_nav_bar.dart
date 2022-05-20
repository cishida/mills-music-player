import 'package:flutter/cupertino.dart';

class SliverNavBar extends StatelessWidget {
  const SliverNavBar({
    Key? key,
    required this.title,
    this.previousPageTitle,
  }) : super(key: key);

  final String title;
  final String? previousPageTitle;

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      largeTitle: Text(title),
      stretch: true,
      // transitionBetweenRoutes: false,
      // automaticallyImplyLeading: true,
      previousPageTitle: previousPageTitle,
    );
  }
}
