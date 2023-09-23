import 'package:contact_app/page/contact_page/success_payment.dart';
import 'package:flutter/material.dart';

class HalamanD extends StatelessWidget {
  const HalamanD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman D'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const SuccessPaymentPage(),
              ),
            );
          },
          child: const Text(
            'Halaman payment',
          ),
        ),
      ),
    );
  }
}
