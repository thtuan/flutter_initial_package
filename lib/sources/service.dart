import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';


/*
  Service is a component run under app life circle. We can get Service via AppService
 */
abstract class ServiceState {
  String get serviceDataName;
}

abstract class Service<T extends ServiceState> {
  String get serviceName;
  BehaviorSubject<T> get eventEmitter;
  T get state;
  void initial(){}
  void command();
  void stop() {}

}

abstract class AppService<T extends Service> {
  static final List<Service> _runningServices = [];
  static void configuration(List<Service> appServices) {
    _runningServices.clear();
    _runningServices.addAll(appServices);
    for (var element in _runningServices) {
      debugPrint('START SERVICE: ${element.serviceName}');
      element.initial();
    }
  }

}
// Example
class AuthService extends Service<AuthState> {
  @override
  BehaviorSubject<AuthState> get eventEmitter => BehaviorSubject<AuthState>();

  void emit() {
    eventEmitter.add(AuthState());
  }

  @override
  String get serviceName => 'Auth Service';

  @override
  void command() {
  }

  @override
  AuthState get state => throw UnimplementedError();

}

class AuthState extends ServiceState {
  final bool isAuthenticated = false;

  @override
  String get serviceDataName => 'Auth Data';
}
