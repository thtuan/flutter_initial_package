import 'package:base/sources/config.dart';
import 'package:rxdart/rxdart.dart';

// Start services

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

  void initial() {
    //Start services
    for (var element in enableServices) {
      element.initial();
    }
  }
}

