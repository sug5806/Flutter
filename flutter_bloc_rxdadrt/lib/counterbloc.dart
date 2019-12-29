import 'package:rxdart/rxdart.dart';

class CounterBloc {
	int initialCount = 0;
	BehaviorSubject<int> _subjectCounter;
//	PublishSubject _subjectCounter;

	CounterBloc({this.initialCount}){
		_subjectCounter = new BehaviorSubject<int>.seeded(this.initialCount);
//		_subjectCounter = new PublishSubject<int>.seeded(this.initialCount);
	}

	Observable<int> get counterObservable => _subjectCounter.stream;

	void increment() {
		initialCount++;
		_subjectCounter.sink.add(initialCount);
	}

	void decrement() {
		initialCount--;
		_subjectCounter.sink.add(initialCount);
	}

	void dispose() {
		_subjectCounter.close();
	}
}