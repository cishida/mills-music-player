import 'package:flutter/material.dart';
import 'package:mills_music_player/ui/views/landing/landing_view_model.dart';
import 'package:stacked/stacked.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LandingViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     image: DecorationImage(
              //       fit: BoxFit.cover,
              //       colorFilter: ColorFilter.mode(
              //         Colors.black.withOpacity(0.4),
              //         BlendMode.dstATop,
              //       ),
              //       image: const AssetImage(
              //         'assets/images/landing/mills-closeup-violano.jpeg',
              //       ),
              //     ),
              //   ),
              // ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/images/logo/mills-owl-eyes.gif',
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Image.asset(
                    'assets/images/landing/mills-closeup-violano.jpeg',
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    'Mills Mechanical\nMusic Player',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20.0),
                      primary: Color(0xFFd34049),
                      shape: StadiumBorder(),
                    ),
                    child: Text(
                      "ENTER",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
              // Image.asset(
              //   'assets/images/landing/mills-closeup-violano.jpeg',
              //   // width: size.width,
              //   height: size.height,
              //   fit: BoxFit.fitHeight,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
