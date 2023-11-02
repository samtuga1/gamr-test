import 'dart:convert';

import 'package:gamr/data/data.dart';
import 'package:gamr/models/data/user_model.dart';
import 'package:gamr/services/storage_service.dart';
import 'package:get/get.dart';

class UserRepo {
  AppStorage prefs = Get.find();

  Future<UserData?> getUser() async {
    final user = await prefs.getString(userKey);
    if (user == '') return null;
    final decodedUser = await jsonDecode(user);
    return UserData.fromJson(decodedUser);
  }

  Future<void> save({required UserData user}) async {
    final encodedUserData = jsonEncode(user);
    await prefs.setString(userKey, encodedUserData);
  }
}
