import 'package:gamr/handlers/http_error.dart';
import 'package:gamr/handlers/http_response.dart';
import 'package:gamr/interfaces/account_service.interface.dart';
import 'package:gamr/models/data/user_model.dart';
import 'package:gamr/models/requests/requests.dart';
import 'package:gamr/models/responses/login_response.dart';
import 'package:gamr/repositories/user.repository.dart';
import 'package:gamr/services/base_service.dart';
import 'package:get/get.dart';

class AccountService extends BaseApiService implements IAccountService {
  static AccountService? _instance;

  // create just one instance here to avoid creating multiple instances
  static AccountService get getInstance {
    return _instance ??= AccountService();
  }

  @override
  Future<ApiResponse<LoginResponse>> login(LoginRequest request) async {
    super.onInit();
    try {
      Response response = await post(
        '/login',
        request.toJson(),
      );

      if (response.hasError) {
        throw response;
      }

      final jsonRes = LoginResponse.fromJson(response.body);

      return HttpSuccessResponse<LoginResponse>(data: jsonRes);
    } catch (err) {
      return HttpErrorResponse(
        error: HttpErrorUtils.getException(err),
      );
    }
  }

  @override
  Future<ApiResponse<UserData>> fetchUserData() async {
    super.onInit();
    try {
      Response response = await get('/user');

      if (response.hasError) {
        return HttpErrorResponse(
          error: HttpErrorUtils.getException(response),
        );
      }

      final jsonRes = UserData.fromJson(response.body);

      await UserRepo().save(user: jsonRes);

      return HttpSuccessResponse<UserData>(data: jsonRes);
    } catch (err) {
      return HttpErrorResponse(
        error: HttpErrorUtils.getException(err),
      );
    }
  }
}
