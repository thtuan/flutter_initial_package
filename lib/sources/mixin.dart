import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


mixin DioErrorHandler {
  final navigatorKey = GlobalKey<NavigatorState>();

  void handleError(DioError error) {
    final context = navigatorKey.currentContext;
    // Change state of app cubit
    // final appCubit =
    final response = error.response;
    switch (response?.statusCode ?? 404) {
      case 404:
        _notFound();
        break;
      case 401:
        _unAuth();
        break;
      case 402:
        _notFound();
        break;
      case 500:
        _internalServer();
        break;
      default:
        _unknown(response?.statusMessage);
        break;
    }
  }

  void _notFound() {

  }

  void _unAuth() {

  }

  void _badRequest() {

  }

  void _internalServer() {

  }

  void _unknown(String? message) {

  }
}


class OOK extends StatelessWidget with DioErrorHandler {
  OOK({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}
