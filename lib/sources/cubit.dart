import 'package:base/base.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseCubit<T extends BaseState> {
  T get state => stream.value;
  final BehaviorSubject<T> stream;

  BaseCubit(T initialData)
      : stream = BehaviorSubject.seeded(initialData, sync: true);

  void emit(T state) {
    stream.add(state);
  }
}
