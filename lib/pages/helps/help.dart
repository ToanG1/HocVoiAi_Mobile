import 'package:ai_journey/pages/helps/body/body.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      fallbackHeight: double.infinity,
      fallbackWidth: double.infinity,
      color: Colors.transparent,
      strokeWidth: 0.0,
      child: Body(),
    );
  }
}
