import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/api/rest_api.dart';
import 'package:healthcare_mobile/models/login/login_request.dart';

import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';
import 'package:dio/dio.dart';

class LoginController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var formKeyDialog = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var emailResetPasswordController = TextEditingController();
  var isError = '';
  var isObscurePassword = true.obs;
  var isButtonLoading = false.obs;
  var isButtonLoadingDialog = false.obs;

  final dio = Dio();

  // var authService = Get.find<AuthService>();

  void login(String phone, String password) async {
    final client = RestClient(dio);
    if (formKey.currentState!.validate()) {
      isButtonLoading.value = true;

      try {
        await client
            .loginUser(LoginRequest(phone: phone, password: password))
            .then((value) {
          Get.offAllNamed(AppRoutes.MAIN_NAVIGATION);
        });
      } on DioError catch (e) {
        EasyLoading.showError(e.response?.data['message']);

      }
    }

     isButtonLoading.value = false;
  }

  void resetPassword(String email) {
    // if (formKeyDialog.currentState!.validate()) {
    //   isButtonLoadingDialog.value = true;

    //   authService.resetPassword(email);

    //   Timer(const Duration(seconds: 2), () {
    //     isButtonLoadingDialog.value = false;
    //   });

    //   emailResetPasswordController.clear();

    //   Get.back();
    // }
  }
}
