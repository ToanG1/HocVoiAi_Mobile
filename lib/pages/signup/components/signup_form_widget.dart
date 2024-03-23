// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:ai_journey/pages/login/login_screen.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import './../../../config/http_client.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _reenterPasswordController =
      TextEditingController();

  Future<void> registerUser() async {
    var regBody = {
      "name": _fullNameController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
    };
    try {
      var response = await http.post(
        Uri.parse(registration),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );

      if (response.statusCode == 201) {
        // Đăng ký thành công
        print("Đăng ký thành công");
        // SnackBar(
        //   content: Text('Đăng ký thành công!'),
        // );
        // Thực hiện các hành động tiếp theo sau khi đăng ký thành công
      } else {
        // Đăng ký không thành công
        print(response.statusCode);
        print("Đăng ký không thành công: ${response.body}");

        // Xử lý các trường hợp không thành công khác tùy thuộc vào phản hồi từ backend
      }
    } catch (error) {
      // Xử lý lỗi nếu có
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: _fullNameController,
              decoration: const InputDecoration(
                label: Text("Full Name"),
                hintText: "Your Full Name",
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                label: Text("E-mail"),
                hintText: "E-mail",
                prefixIcon: Icon(Icons.email_outlined),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                label: Text("Password"),
                hintText: "Password",
                prefixIcon: Icon(Icons.fingerprint),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Pasword';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _reenterPasswordController,
              decoration: const InputDecoration(
                label: Text("Re-enter Password"),
                hintText: "Re-enter Password",
                prefixIcon: Icon(Icons.fingerprint),
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value != _passwordController) {
                  return 'Please enter Re-pasword and same as password';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await registerUser();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: Text(
                  "Signup".toUpperCase(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
