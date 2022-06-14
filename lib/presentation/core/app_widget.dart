import 'package:classpay_new/application/auth/auth_bloc.dart';
import 'package:classpay_new/injection.dart';
import 'package:classpay_new/presentation/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes/router.gr.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _route = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Notes Keeper',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ThemeData.light().colorScheme.copyWith(
                secondary: Colors.blueAccent, primary: Colors.green[800]),
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)))),
          routeInformationParser: _route.defaultRouteParser(),
          routerDelegate: _route.delegate()
      ),
    );
  }
}
