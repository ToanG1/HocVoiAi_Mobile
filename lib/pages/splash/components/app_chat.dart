import 'package:flutter/material.dart';

class AppLogoChat extends StatelessWidget {
  const AppLogoChat({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Text('Chat', style: textTheme.headlineSmall);
  }
}
