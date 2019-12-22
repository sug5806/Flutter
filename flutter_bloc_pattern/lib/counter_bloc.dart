import 'dart:async';

import 'package:flutter_bloc_pattern/counter_event.dart';


class CounterBloc {
	CounterBloc() {
		_counterEventController.stream.listen(_mapEventToState);
	}

	int _counter = 0;

	// 컨트롤러를 하나 만듬
	final _counterStateController = StreamController<int>();

	// 입력용
	StreamSink<int> get _inCounter => _counterStateController.sink;
	// 출력용
	Stream<int> get counter => _counterStateController.stream;

	final _counterEventController = StreamController<CounterEvent>();
	Sink<CounterEvent> get counterEventSink => _counterEventController.sink;


	void _mapEventToState(CounterEvent event){
		if (event is IncrementEvent)
			_counter++;
		else
			_counter--;

		_inCounter.add(_counter);
	}

	void dispose() {
		_counterStateController.close();
		_counterEventController.close();
	}
}