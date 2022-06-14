import 'package:auto_route/annotations.dart';
import 'package:classpay_new/presentation/sign_in/sign_in_page.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: [
  AutoRoute(page: SignInPage, initial: true)
])
class $AppRouter {}