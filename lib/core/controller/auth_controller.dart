import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum Auth {
  signin,
  signup,
}

class AuthController extends GetxController {
  Rx<Auth> auth = Auth.signup.obs;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.onClose();
  }
}
