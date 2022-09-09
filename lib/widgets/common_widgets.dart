import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/form_controller.dart';


final screenHeight = Get.mediaQuery.size.height;
final screenWidth = Get.mediaQuery.size.width;
Widget titleText(String text) {
  return Text(
    text,
    style: Get.textTheme.titleMedium,
  );
}

Widget emailTextFormField() {
  return GetBuilder<FormController>(builder: (formKey) {
    return TextFormField(
      decoration: const InputDecoration(
        label: Text(
          'Enter your email address',
        ),
        prefixIcon: Icon(Icons.alternate_email_rounded),
      ),
      keyboardType: TextInputType.emailAddress,
      controller: formKey.emailController,
      validator: (value) => formKey.validateEmail(value!),
    );
  });
}

Widget commonTextFormField(
  String label,
  IconData icon,
  TextEditingController controller,
  String? Function(String?) validate,
) {
  return GetBuilder<FormController>(builder: (loginFormKey) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(label),
        prefixIcon: Icon(icon),
      ),
      controller: controller,
      validator: validate,
    );
  });
}

Widget submitButton(VoidCallback onPressed, String text) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
        foregroundColor: Get.theme.colorScheme.onPrimary,
        backgroundColor: Get.theme.colorScheme.primary),
    child: Text(text),
  );
}
