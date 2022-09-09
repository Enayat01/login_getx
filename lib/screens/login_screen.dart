import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_getx/controllers/request_controller.dart';
import '../controllers/form_controller.dart';

import '../screens/dashboard_screen.dart';
import '../screens/signup_screen.dart';
import '../widgets/common_widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final FormController controller = Get.put(FormController());
  final RequestController requestController= Get.put((RequestController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
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
                      'assets/images/login.jpg',
                      fit: BoxFit.contain,
                      height: screenHeight * 0.3,
                    ),
                  ),
                  titleText('Email Address'),
                  emailTextFormField(),
                  SizedBox(height: screenHeight * 0.02),
                  titleText('Password'),
                  commonTextFormField(
                    'Enter your password',
                    Icons.password_rounded,
                    controller.passwordController,
                    (value) => controller.validatePassword(value!),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: SizedBox(
                      width: screenWidth * 0.7,
                      child: submitButton(() {
                        controller.checkSubmit();
                        controller.onLogin();
                         Get.off(() => const DashboardScreen());
                      }, 'LOGIN'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          Get.to(() => SignupScreen());
                        },
                        child: const Text('SIGNUP'),
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
//  {
//     "code": 0,
//     "message": "success",
//     "data": {
//         "Id": 148546,
//         "Name": "ena123",
//         "Email": "ena@123.com",
//         "password":123456
//         "Token": "bcfdd939-4560-4d40-adc3-f12751489cd1"
//     }
// }
}
