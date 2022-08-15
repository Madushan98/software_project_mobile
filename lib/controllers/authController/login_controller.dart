import 'package:covid_safe_app/models/Auth/LoginModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../routes/appPages.dart';
import '../../service/Authentication/AuthService.dart';

class LoginController extends GetxController {
  var isLogging = false.obs;
  var errorMessage = "".obs;
  var isError = false;

  var nationalId = "".obs;
  var password = "".obs;
  var _authService = Get.find<AuthService>();

  @override
  void onInit() {
    super.onInit();
  }

  Future loginUser(BuildContext context) async {
    if (nationalId.value == "" && password.value == "") {
      return;
    }
    isLogging.value = true;
    try {
      var loginModel = new LoginModel(
          nationalId: nationalId.value, password: password.value);

      var isLogged = await _authService.logIn(loginModel, context);

      if (isLogged) {
        Get.offAndToNamed(Routes.HOME);
      }
    } catch (e) {
      print(e);
    }

    isLogging.value = false;
  }

  Future getUser() async {
    var user = await _authService.getUser();
  }
}