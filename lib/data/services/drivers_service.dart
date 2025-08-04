import 'package:dio/dio.dart';
import 'package:f1_app/constants/strings.dart';
import 'package:flutter/material.dart';

class DriversService {
  late Dio dio;

  DriversService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllDrivers() async {
    try {
      Response response = await dio.get(getDriversUrl);
      await Future.delayed(Duration(seconds: 2));
      debugPrint('Data we got: $response');

      return response.data;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
