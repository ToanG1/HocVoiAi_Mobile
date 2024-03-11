import 'package:flutter/material.dart';
import '../login/components/forget_password/forget_password_mail/form_header_widget.dart';
import '../constants/text_strings.dart';
import '../login/login_screen.dart';
import '../signup/components/signup_form_widget.dart';

class Signup extends StatefulWidget {
  static String routeName = "/signup";

  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 249, 249),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const FormHeaderWidget(
                  image: "assets/images/logo/logosocailAI.png",
                  subtitle: signupSubtitle,
                  imageHeight: 0.3,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const SignUpForm(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("OR"),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Image(
                            image: AssetImage('assets/images/logo/google.png'),
                            width: 20.0,
                          ),
                          label: const Text('Sign-Up with Google'),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Text.rich(
                          TextSpan(
                            text: 'Already have an Account?',
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: const [
                              TextSpan(
                                text: 'Login',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
