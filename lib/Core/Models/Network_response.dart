part of '.../Services/Netwoark_Caller.dart';

class NetworkResponse {
  final bool isSuccess;
  final int? statusCode;
  final dynamic body;
  final String? errorMessage;

  NetworkResponse({
    required this.isSuccess,
    this.statusCode,
    this.body,
    this.errorMessage,
  });
}
