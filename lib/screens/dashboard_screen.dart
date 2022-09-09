import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_getx/models/user_data.dart';
import 'package:login_getx/services/ApiClient.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/form_controller.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final FormController controller = Get.find();
  var _isInit = true; // Init State
  var _isLoading = false; // Loading State
  final client = ApiClient(Dio());
  UserData? userData;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        //showing the loading indicator
        _isLoading = true;
      });
      _isLoading = false;
      // turning off the loading indicator
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    // getToken();
  }

  // getToken() {
  //    SharedPreferences.getInstance().then((value) => {
  //     client.getAllUsersData('Bearer ${value.getString('token')}'),
  //       });
  //   // print(token);
  //   // return token;
  //
  // }

  // Widget getUsers() {
  //   return FutureBuilder<UserData>(
  //       // future: FormController().getToken(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.done) {
  //           final UserData? userData = snapshot.data;
  //           if (snapshot.hasData) {
  //             return _buildListView(context, userData!);
  //           }
  //           print('User Data :$userData');
  //           return const Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         } else {
  //           return const Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         }
  //       });
  // }

  Widget _buildListView(BuildContext context, UserData userData) {
    print('UserData is :$userData');
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Image.network(userData.data[index]!.profilepicture,),
            title: Text(userData.data[index]!.name),
            subtitle: Text(userData.data[index]!.email),
            trailing: Text(userData.data[index]!.location),
          ),
        );
      },
      itemCount: userData.data.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Dashboard'),
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(child: _buildListView(context, controller.userData!)),
      ),
    );
  }
}
