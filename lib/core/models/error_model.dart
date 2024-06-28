import 'dart:convert';

class ErrorModel {
  final String message;
  final String? code;
  final Map<String, dynamic>? details;

  ErrorModel({
    required this.message,
    this.code,
    this.details,
  });

  /// Factory method to create an instance from a JSON map
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      message: json['message'] ?? 'An unknown error occurred.',
      code: json['code'],
      details: json['details'] != null
          ? Map<String, dynamic>.from(json['details'])
          : null,
    );
  }

  /// Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'code': code,
      'details': details,
    };
  }

  @override
  String toString() {
    return 'GeneralError(message: $message, code: $code, details: $details)';
  }
}
