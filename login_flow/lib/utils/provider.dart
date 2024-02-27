import 'package:dio/dio.dart';
import 'package:login_flow/model/user.dart';
import 'package:login_flow/utils/connector.dart';

class Result<T> {
  final T result;
  final int code;
  final String message;
  bool get success => code >= 200 && code < 300;

  Result({
    required this.result,
    required this.code,
    required this.message,
  });
}

class UserProvider extends FetchClient {
  Future<Result<String>> login(
      {required String username, required String password}) async {
    try {
      final Response response = await super.getData(
        path: 'login',
        params: {
          "username": username,
          "password": password,
        },
      );
      return Result(
        result: response.data['token'] ?? '',
        code: response.statusCode ?? 0,
        message: response.data['error'] ?? response.statusMessage,
      );
      // if (response.statusCode == 200) {
      //   final userData = response.data;
      //   // User user = User.fromJson(userData);  Might we use this data, save it into storage or set env :v
      //   return true;
      // } else if (response.statusCode == 404) {
      //   return false;
      // } else {
      //   throw response.data['error'] ?? '';
      // }
    } catch (e) {
      return Result(
        result: '',
        code: 0,
        message: "Something went wrong. Please try again later!",
      );
    }
  }

  Future<bool> signUp({required User data}) async {
    final Response response = await super.postData(path: 'users', params: {
      "username": data.username,
      "password": data.password,
      "fisrtName": data.firstName,
    });
    print(data.toJson());
    if (response.statusCode == 201) {
      return true;
    } else {
      print("reponse  error : $response ");
      return false;
    }
  }
}
