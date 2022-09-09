import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/ApiClient.dart';

class RequestController extends GetxController {
  // Requesting for new user registration
  signupApi(String name, String email, String password) async {
    final client = ApiClient(
      Dio(
        BaseOptions(contentType: "application/json"),
      ),
    );
    final prefs = await SharedPreferences.getInstance();
    client
        .register(name, email, password)
        .then((value) async => {
              if (value.data?.Token != null)
                {
                  prefs.setString('token', value.data!.Token.toString()),
                }
            })
        .catchError((Object obj) {
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
    print(prefs.getString('token'));
  }

  loginApi(String email, String password) async {
    final client = ApiClient(
      Dio(
        BaseOptions(contentType: "application/json"),
      ),
    );
    final prefs = await SharedPreferences.getInstance();
    client
        .login(email, password)
        .then((value) async => {
              if (value.data?.Token != null)
                {
                  prefs.setString('token', value.data!.Token.toString()),
                  // await prefs.remove('Token'),
                }
            })
        .catchError((Object obj) {
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
    print(prefs.getString('token'));
  }
}
