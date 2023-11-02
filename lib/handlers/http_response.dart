import 'package:gamr/handlers/http_error.dart';

sealed class ApiResponse<T> {}

class HttpSuccessResponse<T> extends ApiResponse<T> {
  T? data;
  HttpSuccessResponse({this.data});
}

class HttpErrorResponse<T> extends ApiResponse<T> {
  HttpError error;
  HttpErrorResponse({required this.error});
}
