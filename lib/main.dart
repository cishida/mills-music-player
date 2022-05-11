import 'package:flutter/material.dart';
import 'package:mills_music_player/app/app.locator.dart';
import 'package:mills_music_player/app/app.router.dart';
import 'package:mills_music_player/theme.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
