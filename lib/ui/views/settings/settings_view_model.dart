import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:stacked/stacked.dart';

class SettingsViewModel extends BaseViewModel {
  Future scan() async {
    FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
    // Start scanning
    flutterBlue.startScan(
      timeout: const Duration(seconds: 4),
    );

    // Listen to scan results
    var subscription = flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
      }
    });

    // Stop scanning
    flutterBlue.stopScan();
  }
}
