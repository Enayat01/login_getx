import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/ApiClient.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  signupApi(String name, String email, String password) async {
    final client = ApiClient(
      Dio(
        BaseOptions(contentType: "application/json"),
      ),
    );
    client.register(name, email, password).catchError((Object obj) {
      print("error while registering user: $obj");
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          print(res.toString());
          break;
        default:
          print('UnknownError');
      }
    });
  }

  void signup(String name, String email, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse(
            'http://restapi.adequateshop.com/api/authaccount/registration'),
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );
      print(response.body.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('signup successful');
      } else {
        print('sign in failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void login(String email, int password) async {
    try {
      http.Response response = await http.post(
          Uri.parse('http://restapi.adequateshop.com/api/authaccount/login'),
          body: {
            'email': email,
            'password': password,
          });
      print(response.body.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('login successful');
      } else {
        print('login failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  signupApi(
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text('Sign in'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
