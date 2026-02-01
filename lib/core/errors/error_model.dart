
class ErrorModel {
  final int code;
  final String message;
  ErrorModel({
    required this.code,
    required this.message,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      code: jsonData['code'],
      message: jsonData['message'],
    );
  }
}
