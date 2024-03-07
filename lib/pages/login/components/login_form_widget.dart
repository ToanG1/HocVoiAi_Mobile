import 'dart:convert';

import 'package:ai_journey/config/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:ai_journey/pages/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/forgot_password_model_bottom_sheet.dart';
import 'package:http/http.dart' as http;
import './../../../config/http_client.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isPasswordVisible = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> loginUser() async {
    final AppStorage prefs = await AppStorage();

    var regBody = {
      "email": _emailController.text,
      "password": _passwordController.text,
    };
    try {
      var response = await http.post(
        Uri.parse(login),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );

      if (response.statusCode == 200) {
        // Đăng ký thành công
        print("Đăng nhập thành công");
        Fluttertoast.showToast(
          msg: 'Đăng nhập thành công',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 25.0,
        );
      } else {
        print("Đăng nhập  thành công: ${response.body}");
      }
    } catch (error) {
      print("Đăng nhập  thành công");
    }
  }

  Widget _buildSuffixIcon() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isPasswordVisible = !_isPasswordVisible;
        });
      },
      icon: _isPasswordVisible
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: "E-mail",
                hintText: "E-mail",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint),
                labelText: "Password",
                hintText: "Password",
                border: const OutlineInputBorder(),
                suffixIcon: _buildSuffixIcon(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgotPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: const Text('Forget Password?'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  //await loginUser();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: Text(
                  'Login'.toUpperCase(),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
