import 'dart:io';

import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class FetchClient {
  String get domain {
    return "https://parseapi.back4app.com/";
  }

  Dio dio = Dio();

  Options options() {
    var option = Options(
        headers: {
          'X-Parse-Application-Id': 'BCrUQVkk80pCdeImSXoKXL5ZCtyyEZwbN7mAb11f',
          'X-Parse-REST-API-Key': 'swrFFIXJlFudtF3HkZPtfybDFRTmS7sPwvGUzQ9w',
          'X-Parse-Revocable-Session': 1,
          "Content-Type": 'application/json'
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        });
    return option;
  }

  Future<bool> _checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  Future<bool> hasInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<Response> getData(
      {String? domainApp,
      required String path,
      Map<String, dynamic>? params}) async {
    if (await hasInternet()) {
      try {
        Response<dynamic> result = await dio.get((domainApp ?? domain) + path,
            queryParameters: params, options: options());
        return result;
      } on DioException catch (e) {
        return e.response ??
            Response(statusCode: -1, requestOptions: RequestOptions());
      }
    } else {
      return Response(
          data: {},
          statusCode: -1,
          statusMessage: "Connection error",
          requestOptions: RequestOptions());
    }
  }

  Future<Response> postData(
      {String? domainApp, required String path, dynamic params}) async {
    if (await hasInternet()) {
      try {
        Response<dynamic> result = await dio.post((domainApp ?? domain) + path,
            data: params, options: options());
        return result;
      } on DioException catch (e) {
        return e.response ??
            Response(statusCode: -1, requestOptions: RequestOptions());
      }
    } else {
      return Response(
          statusCode: -1,
          statusMessage: "Plus check your connect",
          requestOptions: RequestOptions());
    }
  }
}
