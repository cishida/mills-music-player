import 'package:flutter/material.dart';

class LandingLogo extends StatelessWidget {
  const LandingLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/logo/mills-owl-eyes.gif',
        height: 150,
        width: 150,
      ),
    );
  }
}
