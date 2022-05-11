import 'package:flutter/material.dart';
import 'package:mills_music_player/ui/_dumb_widgets/buttons/full_width_pill_button.dart';
import 'package:mills_music_player/ui/views/landing/components/landing_logo.dart';
import 'package:mills_music_player/ui/views/landing/components/landing_subheader.dart';
import 'package:mills_music_player/ui/views/landing/components/landing_title.dart';
import 'package:mills_music_player/ui/views/landing/landing_view_model.dart';
import 'package:stacked/stacked.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ViewModelBuilder<LandingViewModel>.reactive(
      viewModelBuilder: () => LandingViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.dstATop,
                    ),
                    image: const AssetImage(
                      'assets/images/landing/mills-closeup-violano.jpeg',
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * .2,
                      bottom: 15.0,
                    ),
                    child: const LandingLogo(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
                    child: LandingTitle(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 30.0,
                    ),
                    child: LandingSubheader(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: FullWidthPillButton(
                      text: 'ENTER',
                      onPressed: model.goHome,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
