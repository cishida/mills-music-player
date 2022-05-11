import 'package:stacked/stacked.dart';

class FutureBuildsViewModel extends FutureViewModel<String> {
  Future<String> getDataFromMockServer() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    return 'Fetched mock data from server';
  }

  @override
  Future<String> futureToRun() =>
      getDataFromMockServer(/* Pass parameters here */);
}
