import 'dart:async';
import 'package:study_app_flutter/ui/counter/CounterEvent.dart';

class CounterBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();

  StreamSink<int> get _inCounterState => _counterStateController.sink;

  Stream<int> get outCounterState => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();

  StreamSink<CounterEvent> get inCounterEvent => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen((event) {
      _mapEventToState(event);
    });
  }

  _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }
    _inCounterState.add(_counter);
  }

  dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
