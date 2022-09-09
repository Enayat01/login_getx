import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_getx/models/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/request_controller.dart';
import '../services/ApiClient.dart';

class FormController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  SharedPreferences? prefs;
  UserData? userData;
  RxBool isLoading= true.obs;

  @override
  void onInit() {
    nameController;
    emailController;
    passwordController;
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  getToken() async {
    final client = ApiClient(Dio());
    await SharedPreferences.getInstance().then((value) async => {
          print("Data is $value"),
          userData = await client
              .getAllUsersData('Bearer ${value.getString('token')}'),
          print(userData),
      isLoading.value=false
        });
  }

  String? validateUsername(String value) {
    if (!GetUtils.isUsername(value)) {
      return 'Invalid username';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void onSignup() {
    RequestController().signupApi(
      nameController.text.toString(),
      emailController.text.toString(),
      passwordController.text.toString(),
    );
  }

  void onLogin() {
    RequestController().loginApi(
      emailController.text.toString(),
      passwordController.text.toString(),
    );
  }

  checkSubmit() async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return null;
    }
    loginFormKey.currentState!.save();
    getToken();
  }
}
