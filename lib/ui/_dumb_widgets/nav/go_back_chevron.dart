import 'package:flutter/material.dart';

class GoBackChevron extends StatelessWidget {
  const GoBackChevron({
    Key? key,
    required this.goBack,
  }) : super(key: key);

  final Function goBack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => goBack(),
      child: Container(
        width: 67,
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: Row(
          children: const [
            Icon(
              Icons.chevron_left,
              size: 30.0,
              color: Colors.blue,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2.0),
              child: Text(
                'Back',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
