import 'package:base/sources/api/client/auth_client.dart';
import 'package:base/sources/api/interceptor/auth_interceptor.dart';
import 'package:base/sources/model/task.dart';
import 'package:dio/dio.dart';

class TaskRepository {
  late final AuthClient authClient;

  TaskRepository() {
    final dio = Dio();
    dio.interceptors.add(AuthInterceptor());
    authClient = AuthClient(dio);
  }

  Future<Task> doSomething() {
    return authClient.login();
  }
}
