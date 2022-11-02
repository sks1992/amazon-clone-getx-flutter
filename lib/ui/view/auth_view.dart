import 'package:amazon_clone_getx/core/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controller/auth_controller.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_list_tile.dart';
import '../widgets/custom_text_form_field.dart';

class AuthView extends StatelessWidget {
  AuthView({Key? key}) : super(key: key);

  final AuthController authController = Get.put(AuthController());
  //A FormState object can be used to save, reset, and validate
  // every FormField that is a descendant of the associated Form.
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => Column(
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 24,
                  ),
                ),
                CustomListTile(
                  title: "Create Account",
                  color: authController.auth.value == Auth.signup
                      ? GlobalVariables.backgroundColor
                      : GlobalVariables.greyBackgroundCOlor,
                  leading: Radio(
                    value: Auth.signup,
                    groupValue: authController.auth.value,
                    onChanged: (Auth? value) {
                      authController.auth.value = value!;
                    },
                    activeColor: GlobalVariables.secondaryColor,
                  ),
                ),
                if (authController.auth.value == Auth.signup)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            title: "User Name",
                            hint: "Enter User Name",
                            requiredFieldSymbol: true,
                            controller: authController.nameController,
                          ),
                          CustomTextFormField(
                            title: "Email",
                            hint: "Enter Email",
                            requiredFieldSymbol: true,
                            controller: authController.emailController,
                          ),
                          CustomTextFormField(
                            title: "Password",
                            hint: "Enter Password",
                            requiredFieldSymbol: true,
                            obscureText: true,
                            controller: authController.passwordController,
                          ),
                          CustomElevatedButton(
                            onTap: () {},
                            text: "Sign Up",
                          ),
                        ],
                      ),
                    ),
                  ),
                CustomListTile(
                  title: "Sign-In",
                  color: authController.auth.value == Auth.signin
                      ? GlobalVariables.backgroundColor
                      : GlobalVariables.greyBackgroundCOlor,
                  leading: Radio(
                    value: Auth.signin,
                    groupValue: authController.auth.value,
                    onChanged: (Auth? value) {
                      authController.auth.value = value!;
                    },
                    activeColor: GlobalVariables.secondaryColor,
                  ),
                ),
                if (authController.auth.value == Auth.signin)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                      key: _signInFormKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            title: "Email",
                            hint: "Enter Email",
                            requiredFieldSymbol: true,
                            controller: authController.emailController,
                          ),
                          CustomTextFormField(
                            title: "Password",
                            hint: "Enter Password",
                            requiredFieldSymbol: true,
                            obscureText: true,
                            controller: authController.passwordController,
                          ),
                          CustomElevatedButton(
                            onTap: () {},
                            text: "Sign In",
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
