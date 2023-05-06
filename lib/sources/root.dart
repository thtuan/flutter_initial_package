import 'package:base/sources/config.dart';
import 'package:rxdart/rxdart.dart';

class IamRoot {
  final Iterable<Service> enableServices;
  final bool debugMode;
  final Configuration configuration;

  const IamRoot(
      {required this.enableServices,
      required this.configuration,
      bool? debugMode})
      : debugMode = debugMode ?? false,
        super();

  void initial() {}
}

abstract class ServiceData {
  String get serviceDataName;
}

abstract class Service<T extends ServiceData> {
  String get serviceName;

  BehaviorSubject<T> get eventEmitter;
}

class AuthService extends Service {
  @override
  BehaviorSubject<Auth> get eventEmitter => BehaviorSubject<Auth>();

  void emit() {
    eventEmitter.add(Auth());
  }

  @override
  String get serviceName => 'Auth Service';
}

class Auth extends ServiceData {
  final bool isAuthenticated = false;

  @override
  String get serviceDataName => 'Auth Data';
}
