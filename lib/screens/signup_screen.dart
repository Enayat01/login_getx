import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/form_controller.dart';
import '../controllers/request_controller.dart';
import '../screens/dashboard_screen.dart';
import '../screens/login_screen.dart';
import '../widgets/common_widgets.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final FormController controller = Get.find();
  final RequestController requestController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Form(
              key: controller.loginFormKey,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/signup.jpg',
                      fit: BoxFit.contain,
                      height: screenHeight * 0.3,
                    ),
                  ),
                  titleText('Username'),
                  commonTextFormField(
                    'Enter new username',
                    Icons.person_pin_circle_outlined,
                    controller.nameController,
                    (value) => controller.validateUsername(value!),
                  ),
                  const SizedBox(height: 20),
                  titleText('Email Address'),
                  emailTextFormField(),
                  const SizedBox(height: 20),
                  titleText('Password'),
                  commonTextFormField(
                    'Type your password',
                    Icons.password_rounded,
                    controller.passwordController,
                    (value) => controller.validatePassword(value!),
                  ),
                  const SizedBox(height: 20),
                  // titleText('Confirm Password'),
                  // commonTextFormField(
                  //   'Retype your password',
                  //   Icons.confirmation_number_outlined,
                  //   controller.passwordController,
                  //   (value) => controller.validatePassword(value!),
                  // ),
                  const SizedBox(height: 10),
                  Center(
                    child: SizedBox(
                      width: screenWidth * 0.7,
                      child: submitButton(() {
                        controller.checkSubmit();
                        controller.onSignup();
                        Get.off(() => const DashboardScreen());
                      }, 'SIGNUP'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          Get.off(() => LoginScreen());
                        },
                        child: const Text('LOGIN'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
