sealed class ApiResult<T> {}

final class Success<T> extends ApiResult<T> {
  final T data;
  Success({required this.data});
}

final class Failure<T> extends ApiResult<T> {
  final Exception e;
  Failure(this.e);
}

class ApiException implements Exception {
  final int? errorCode;
  final String message;
  ApiException(this.message, {this.errorCode});

  @override
  String toString() {
    final codeString = (errorCode != null) ? ", errorCode: $errorCode" : "";
    return "error: $message$codeString";
  }
}
