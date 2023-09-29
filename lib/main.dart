import 'package:contact_app/page/contact_page/contact_provider_page.dart';
import 'package:contact_app/page/contact_page/detail_contact_page.dart';
import 'package:contact_app/page/contact_page/splash_screen_page.dart';
import 'package:contact_app/provider/button_submit_change_notifier.dart';
import 'package:contact_app/provider/form_phone_change_notifier.dart';
import 'package:contact_app/provider/form_username_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoutedNamed {
  static const splashScreen = '/';
  static const contact = '/contact';
  static const contactDetail = '/contact-detail';
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FormUsernameChangeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => FormPhoneChangeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => ButtonSubmitChangeNotifier(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const SplashScreenPage(),
      initialRoute: RoutedNamed.splashScreen,
      routes: {
        RoutedNamed.splashScreen: (_) => const SplashScreenPage(),
        RoutedNamed.contact: (_) => const ContactProviderPage(),
        RoutedNamed.contactDetail: (_) => DetailContactPage()
      },
    );
  }
}
