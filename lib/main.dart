import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quick_social/pages/search/body/logosearch.dart';
import 'package:quick_social/pages/search/search_page.dart';
import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/background_decoration.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';
import './pages/login/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(
          showStatusBar: true,
          backgroundImageDecoration: const BackgroundImageDecoration(
            image: AssetImage('assets/images/welcome_images/login.png'),
            fit: BoxFit.cover,
          ),
          logo: const Image(
            image: AssetImage('assets/images/logo.png'),
            height: 200,
            width: 200,
          ),
          loadingIndicator: const CupertinoActivityIndicator(),
          done: Done(
            const MyApp(),
          ),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Journey',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 90, 207, 225)),
        useMaterial3: true,
        textTheme: GoogleFonts.dmSansTextTheme(),
      ),
      //home: const LoginScreen(),
      home: const SearchScreen(),
    );
  }
}
