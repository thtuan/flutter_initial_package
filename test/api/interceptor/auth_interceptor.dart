import 'package:base/sources/converter.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Step 1: Check old accessToken
    final oldAccessToken = '';
    final tokenIsValid = _checkAccessTokenValid(oldAccessToken);
    if (tokenIsValid) {
      handler.next(options);
      return;
    }
    // Fetch new access token
    final newAccessToken = await _loadNewAccessToken();
    if (newAccessToken != null && newAccessToken.isNotEmpty) {
      handler.next(options);
      return;
    }

    handler.reject(DioError(
        requestOptions: options,
        response: Response(requestOptions: options, statusCode: 401)));
  }

  bool _checkAccessTokenValid(String? accessToken) {
    if (accessToken == null || accessToken.isEmpty) {
      return false;
    } else {
      final expTimeSinceEpoch = parseJwt(accessToken)['exp'] as int;
      if (DateTime.fromMillisecondsSinceEpoch(expTimeSinceEpoch * 1000)
              .add(const Duration(seconds: -5))
              .compareTo(DateTime.now()) <
          0) {
        return false;
      }
      return true;
    }
  }

  Future<String?> _loadNewAccessToken() async {
    return '';
  }
}
