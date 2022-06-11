import 'package:classpay_new/presentation/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes Keeper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ThemeData.light().colorScheme.copyWith(
              secondary: Colors.blueAccent, primary: Colors.green[800]),
          inputDecorationTheme: InputDecorationTheme(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)))),
      home: const SignInPage(),
    );
  }
}
