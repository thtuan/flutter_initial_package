import 'package:dio/dio.dart';

import '../api/client/auth_client.dart';
import '../api/interceptor/auth_interceptor.dart';
import '../model/task.dart';

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
