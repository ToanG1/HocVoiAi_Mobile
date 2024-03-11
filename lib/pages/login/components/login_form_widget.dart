import 'dart:convert';

import 'package:ai_journey/config/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:ai_journey/pages/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/forgot_password_model_bottom_sheet.dart';
import 'package:http/http.dart' as http;
import './../../../config/http_client.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ai_journey/models/connectapi/post.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isPasswordVisible = false;
  final httpService = HttpService(url);
  String a = '';

  // Future<void> saveAcessToken() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // Tiếp tục sử dụng prefs ở đây
  //   await prefs.setString('accessToken', '$accessToken');
  // }

  // late String accessToken;
  // Future<String> validateAccessToken(String accessToken) async {
  //   // Thực hiện kiểm tra đối với accessToken
  //   // Ví dụ: Kiểm tra xem accessToken có giá trị hay không
  //   if (accessToken.isNotEmpty) {
  //     // Trả về thông báo khi accessToken hợp lệ
  //     return "Access token is valid";
  //   } else {
  //     // Trả về thông báo khi accessToken không hợp lệ
  //     return "Access token is invalid";
  //   }
  // }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Future<void> loginUser() async {
  //   //final AppStorage prefs = await AppStorage();
  //   WidgetsFlutterBinding.ensureInitialized();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   //null check
  //   //runApp(MyApp(token: data)); //pass it through construtor
  //   var regBody = {
  //     "email": _emailController.text,
  //     "password": _passwordController.text,
  //   };
  //   try {
  //     var response = await http.post(
  //       Uri.parse(login),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode(regBody),
  //     );

  //     if (response.statusCode == 201) {
  //       // Đăng ký thành công
  //       print("Đăng nhập thành công: ${response.body}");
  //       final Map<String, dynamic> jsonData = jsonDecode(response.body);
  //       accessToken = jsonData['data']['access_token'];
  //       // Validate accessToken
  //       String validationMessage = await validateAccessToken(accessToken);
  //       print(validationMessage);
  //       // Fluttertoast.showToast(
  //       //   msg: 'Đăng nhập thành công',
  //       //   toastLength: Toast.LENGTH_SHORT,
  //       //   gravity: ToastGravity.BOTTOM,
  //       //   timeInSecForIosWeb: 1,
  //       //   backgroundColor: Colors.red,
  //       //   textColor: const Color.fromARGB(255, 254, 223, 223),
  //       //   fontSize: 25.0,
  //       // );
  //       //Posts.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  //     } else {
  //       print("Đăng nhập không thành công: ${response.body}");
  //       var data = prefs.getString('access_token') ?? '';
  //     }
  //   } catch (error) {
  //     print("Đăng nhập  thành công");
  //   }
  // }

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
                  await httpService.loginUser(
                      _emailController.text, _passwordController.text);

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
