import 'package:flutter/material.dart';

class AppLogoSearch extends StatelessWidget {
  const AppLogoSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Text('Search', style: textTheme.headlineSmall);
  }
}
