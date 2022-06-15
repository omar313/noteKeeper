import 'package:auto_route/annotations.dart';
import 'package:classpay_new/presentation/sign_in/sign_in_page.dart';
import 'package:classpay_new/presentation/splash/splash_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(
    page: SignInPage,
  ),
  AutoRoute(page: SplashPage, initial: true)
])
class $AppRouter {}
