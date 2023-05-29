import 'dart:async';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/task.dart';

part 'auth_client.g.dart';

@RestApi(
  baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/",
)
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @GET("/login")
  Future<Task> login();

// Task deserializeTask(Map<String, dynamic> json) => Task.fromJson(json);
//
// List<Task> deserializeTaskList(List<Map<String, dynamic>> json) =>
//     json.map((e) => Task.fromJson(e)).toList();
//
// Map<String, dynamic> serializeTask(Task object) => object.toJson();
//
// List<Map<String, dynamic>> serializeTaskList(List<Task> objects) =>
//     objects.map((e) => e.toJson()).toList();
}
