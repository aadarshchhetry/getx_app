import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/Controller/home_controller.dart';
import 'package:getx_app/Controller/login_controller.dart';

class HomeView extends StatelessWidget {
  final LoginController _loginController = Get.find();
  final HomeController _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    print(_loginController.emailTextController.text);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Dashboard',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text(
              'Welcome ${_loginController.emailTextController.text}',
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: _homeController.userListData.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      _homeController.userListData[index].firstName,
                    ),
                    subtitle: Text(
                      _homeController.userListData[index].email,
                    ),
                    trailing: Image.network(
                      _homeController.userListData[index].avatar,
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                    leading: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          _homeController.deleteItem(index);
                        }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
