import 'package:flutter/material.dart';
import 'package:quick_social/common/common.dart';
import 'package:quick_social/pages/login/components/login_form_widget.dart';
import 'package:quick_social/pages/login/login_page.dart';
import 'package:quick_social/pages/pages.dart';
import 'package:quick_social/widgets/widgets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  void splashing(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () async {
        context.push(route: LoginScreen.route());
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
