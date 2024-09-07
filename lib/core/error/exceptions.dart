import 'package:tadmon/core/network/error_massage_model.dart';

class ServerException implements Exception{

  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}