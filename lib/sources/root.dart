import 'package:base/sources/config.dart';
import 'package:base/sources/service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

// Root tree

class IamRoot extends InheritedWidget {
  final bool debugMode;
  final Configuration configuration;
  final Widget app;
  final Map<String, Service> appServices = {};
  final Function()? onInitApplication;

  IamRoot(
      {super.key,
      required this.configuration,
      required List<Service> appServices,
      required this.app,
      this.onInitApplication,
      bool? debugMode})
      : debugMode = debugMode ?? false,
        super(child: app) {
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
    }

    onInitApplication?.call();
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

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static IamRoot? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<IamRoot>();
  }

// static void stopService(BuildContext context, String id) {
//   final root = context.dependOnInheritedWidgetOfExactType<IamRoot>();
//   final service = root?.appServices[id];
//   service?.stop();
//   root?.appServices.remove(id);
// }
}
