import 'dart:async';

import 'package:contact_app/page/contact_page/contact_page.dart';
import 'package:contact_app/page/contact_page/contact_provider_page.dart';
import 'package:contact_app/page/contact_page/detail_contact_page.dart';
import 'package:contact_app/page/contact_page/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  bool isShowIcon = false;

  @override
  void initState() {
    super.initState();
    changeIcon();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const ContactProviderPage(),
        ),
        (route) => false,
      );
    });
  }

  void changeIcon() {
    Timer(const Duration(seconds: 2), () {
      isShowIcon = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          isShowIcon == true ? Icons.abc_outlined : Icons.flutter_dash,
          size: 120,
        ),
      ),
    );
  }
}
