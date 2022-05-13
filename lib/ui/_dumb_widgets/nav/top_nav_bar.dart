import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';
import 'package:mills_music_player/ui/_dumb_widgets/nav/go_back_chevron.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    Key? key,
    this.title = '',
    this.subtitle = '',
    this.canGoBack = false,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final bool canGoBack;

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
          const Spacer(),
          Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: ConstColors.offBlack,
                ),
              ),
              if (subtitle != '')
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: ConstColors.navGray,
                  ),
                ),
            ],
          ),
          const Spacer(),
          if (canGoBack)
            SizedBox(
              width: 67,
              child: Container(),
            ),
        ],
      ),
    );
  }
}
