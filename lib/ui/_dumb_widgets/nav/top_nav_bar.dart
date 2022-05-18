import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';
import 'package:mills_music_player/ui/_dumb_widgets/nav/go_back_chevron.dart';
import 'package:mills_music_player/ui/_dumb_widgets/text/custom_text_scroll.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    Key? key,
    this.title = '',
    this.subtitle = '',
    this.goBack,
    this.trailing,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Function? goBack;
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
          if (goBack != null)
            GoBackChevron(
              goBack: () => goBack!(),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  CustomTextScroll(text: title),
                  if (subtitle != '')
                    CustomTextScroll(
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
          if (goBack != null)
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
