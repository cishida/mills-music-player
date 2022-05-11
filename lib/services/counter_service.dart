import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class CounterService with ReactiveServiceMixin {
  ReactiveValue<int> _counter = ReactiveValue<int>(0);
  ReactiveValue<int> get counter => _counter;

  CounterService() {
    listenToReactiveValues([_counter]);
  }

  void incrementCounter() {
    _counter.value++;
  }

  void doubleCounter() {
    _counter.value *= 2;
  }
}
