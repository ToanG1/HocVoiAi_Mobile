import 'package:flutter/material.dart';

import '../login/components/login_footer_widget.dart';
import '../login/components/login_form_widget.dart';
import '../login/components/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginForm());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
          // padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoginHeaderWidget(size: size),
              const LoginForm(),
              const LoginFooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
