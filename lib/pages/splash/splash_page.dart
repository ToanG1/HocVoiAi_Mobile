import 'package:flutter/material.dart';
import 'package:ai_journey/common/common.dart';
import 'package:ai_journey/pages/login/components/login_form_widget.dart';
import '../login/login_screen.dart';
import 'package:ai_journey/pages/pages.dart';
import 'package:ai_journey/widgets/widgets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  void splashing(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () async {
        // context.push(route: LoginScreen.route());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    splashing(context);

    return const Scaffold(
      body: Center(
        child: AppLogo(),
      ),
    );
  }
}
