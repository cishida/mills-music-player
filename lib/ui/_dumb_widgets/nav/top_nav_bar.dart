import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';
import 'package:mills_music_player/ui/_dumb_widgets/nav/go_back_chevron.dart';
import 'package:mills_music_player/ui/_dumb_widgets/nav/top_nav_text_scroll.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    Key? key,
    this.title = '',
    this.subtitle = '',
    this.canGoBack = false,
    this.trailing,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final bool canGoBack;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: ConstColors.lightDivider,
          ),
        ),
      ),
      child: Row(
        children: [
          if (canGoBack) const GoBackChevron(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  TopNavTextScroll(text: title),
                  if (subtitle != '')
                    TopNavTextScroll(
                      text: subtitle,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: ConstColors.navGray,
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (canGoBack)
            Container(
              width: 67,
              padding: const EdgeInsets.only(
                right: 10.0,
              ),
              child: trailing ?? Container(),
            ),
        ],
      ),
    );
  }
}
