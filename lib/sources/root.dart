import 'package:base/sources/service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

// Root tree

class IamRoot {
  final bool debugMode;
  final Widget app;
  final Map<String, Service> appServices = {};

  IamRoot(
      {required List<Service> appServices, required this.app, bool? debugMode})
      : debugMode = debugMode ?? false {
    initial(appServices);
  }

  void initial(List<Service> services) {
    //Start log
    _initLogging(debugMode);

    //Start app services
    for (var service in services) {
      debugPrint('START SERVICE: ${service.serviceName}');
      appServices[service.id] = service;
      service.initial();
      service.run();
    }
  }

  void _initLogging(bool enable) {
    if (!enable) {
      return;
    }
    Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      debugPrint('${record.level.name}: ${record.time}: ${record.message}');
    });
  }
}
