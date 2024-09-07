import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMassage;
  bool success;

  ErrorMessageModel(
      {required this.statusCode,
      required this.statusMassage,
      required this.success});
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
        statusCode: json['status_code'],
        statusMassage: json['status_message'],
        success: json['success']);
  }

  @override
  List<Object?> get props => [statusCode, statusMassage, success];
}
