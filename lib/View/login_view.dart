import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/Controller/login_controller.dart';

class LoginView extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'GetX Login',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _loginController.emailTextController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                ),
                validator: (value) =>
                    value.trim().isEmpty ? 'Email required' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _loginController.passwordTextController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                ),
                validator: (value) =>
                    value.trim().isEmpty ? 'Password required' : null,
              ),
              SizedBox(height: 16),
              MaterialButton(
                  color: Colors.deepOrangeAccent,
                  splashColor: Colors.white,
                  height: 45,
                  minWidth: Get.width / 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'LOGIN',
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _loginController.apiLogin();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
