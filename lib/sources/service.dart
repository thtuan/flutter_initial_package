import 'package:rxdart/rxdart.dart';

/*
  Service is a component run under app life circle. We can get Service via AppService
 */

abstract class ServiceState {
  String get serviceDataName;
}

abstract class Service<T extends ServiceState> {
  String get serviceName;

  String get id;

  BehaviorSubject<T> get _eventEmitter => BehaviorSubject<T>();

  T get state;

  void initial() {}

  void emit(T state) {
    _eventEmitter.add(state);
  }

  void stop() {}
}


// Example
class AuthService extends Service<AuthState> {

  @override
  String get serviceName => 'Auth Service';

  @override
  AuthState get state => AuthState();

  @override
  String get id => 'auth';

}

class AuthState extends ServiceState {
  final bool isAuthenticated = false;

  @override
  String get serviceDataName => 'Auth Data';
}
