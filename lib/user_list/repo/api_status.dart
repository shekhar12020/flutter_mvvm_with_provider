class Success {
  int? code;
  Object? response;

  Success({this.code, this.response});
}

class Failure {
  int? code;
  Object? errorResponse;

  Failure({required this.code, required this.errorResponse});
}
