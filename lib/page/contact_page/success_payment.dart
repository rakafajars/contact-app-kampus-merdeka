import 'package:contact_app/page/contact_page/contact_page.dart';
import 'package:contact_app/page/contact_page/splash_screen_page.dart';
import 'package:flutter/material.dart';

class SuccessPaymentPage extends StatelessWidget {
  const SuccessPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Halaman LogOut'),
          leading: const SizedBox(),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const SplashScreenPage(),
                ),
                (route) => false,
              );

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (_) => ContacePage(),
              //   ),
              // );
            },
            child: const Text(
              'Log Out',
            ),
          ),
        ),
      ),
    );
  }
}
