import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter_bloc_simple_boilerplate/localization/keys.dart';

typedef ProcessCallback<T> = T Function(Map<String, dynamic> responseData);

class DataResponse<T> {
  Status status;
  T data;
  String message;

  DataResponse.success(this.data) : status = Status.Success;

  DataResponse.error({this.message = Keys.default_error_message})
      : status = Status.Error;

  DataResponse.connectivityError({
    this.message = Keys.default_network_error_message,
  }) : status = Status.ConnectivityError;

  @override
  String toString() {
    return 'Status : $status \n Message : $message \n Data : $data';
  }
}

Future<DataResponse<T>> makeRequest<T>(
  Future<dio.Response> request, {
  ProcessCallback<T> processCallback,
}) async {
  try {
    final response = await request;
    print(response.data);
    if (response.statusCode != 200 /* || response.data['success'] != true */) {
      return DataResponse.error(message: Keys.default_error_message);
    } else {
      return DataResponse.success(
        processCallback?.call(response.data) ?? response.data,
      );
    }
  } catch (e) {
    print(e);
    if (e is dio.DioError) {
      if (e.error is SocketException) {
        return DataResponse.connectivityError(
          message: Keys.default_network_error_message,
        );
      }
    }
    return DataResponse.error(message: Keys.default_error_message);
  }
}

enum Status { Success, Error, ConnectivityError }
