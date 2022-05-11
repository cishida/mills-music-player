import 'package:mills_music_player/app/app.locator.dart';
import 'package:mills_music_player/services/counter_service.dart';
import 'package:stacked/stacked.dart';

class SingleIncreaseCounterViewModel extends ReactiveViewModel {
  final _counterService = locator<CounterService>();
  int get counter => _counterService.counter.value;

  void updateCounter() {
    _counterService.incrementCounter();
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _counterService,
      ];
}
