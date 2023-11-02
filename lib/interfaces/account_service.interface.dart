import 'package:gamr/handlers/http_response.dart';
import 'package:gamr/models/data/data.dart';
import 'package:gamr/models/requests/requests.dart';
import 'package:gamr/models/responses/responses.dart';

abstract class IAccountService {
  Future<ApiResponse<LoginResponse>> login(LoginRequest request);

  Future<ApiResponse<UserData>> fetchUserData();
}
