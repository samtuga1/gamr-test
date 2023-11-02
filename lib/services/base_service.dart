import 'package:gamr/config/global_env.config.dart';
import 'package:gamr/data/data.dart';
import 'package:gamr/services/secure_storage_service.dart';
import 'package:get/get.dart';

class BaseApiService extends GetConnect {
  final globalConfig = Get.find<GlobalConfiguration>();
  final storage = Get.find<SecureStorage>();

  @override
  onInit() {
    httpClient.baseUrl = "${globalConfig.appConfig['base_url']}/api";

    // REQUESTS
    httpClient.addRequestModifier<dynamic>((request) async {
      String url = request.url.path;
      if (url == '$baseUrl/login' || url == '$baseUrl/tournaments') {
        return request;
      } else {
        final token = await storage.read(userToken);

        request.headers['Authorization'] = "Bearer $token";

        return request;
      }
    });

    httpClient.maxAuthRetries = 3;
  }
}
