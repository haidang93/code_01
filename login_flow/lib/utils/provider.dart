import 'package:dio/dio.dart';
import 'package:login_flow/model/user.dart';
import 'package:login_flow/utils/connector.dart';

class UserProvider extends FetchClient {
  Future<bool> login(
      {required String username, required String password}) async {
    final Response response = await super.getData(
        path: 'login', params: {"username": username, "password": password});
    if (response.statusCode == 200) {
      final userData = response.data;
      // User user = User.fromJson(userData);  Might we use this data, save it into storage or set env :v
      return true;
    } else if (response.statusCode == 404) {
      return false;
    } else {
      throw response.data['error'] ?? '';
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
