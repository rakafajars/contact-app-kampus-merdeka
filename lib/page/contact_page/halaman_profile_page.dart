import 'package:contact_app/page/contact_page/halaman_d_page.dart';
import 'package:flutter/material.dart';

class HalamanProfilePage extends StatelessWidget {
  const HalamanProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Profile'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const HalamanD(),
              ),
            );
          },
          child: const Text(
            'Halaman D',
          ),
        ),
      ),
    );
  }
}
