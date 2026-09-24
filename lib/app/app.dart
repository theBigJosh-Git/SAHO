import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import 'customer_shell.dart';

class SahoApp extends StatelessWidget {
  const SahoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAHO',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const CustomerShell(),
    );
  }
}

class SahoFoundationScreen extends StatelessWidget {
  const SahoFoundationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'SAHO\nServices At Home',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}