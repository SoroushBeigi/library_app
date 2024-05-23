import 'package:go_router/go_router.dart';
import 'package:library_app/pages/home_page.dart';
import 'package:library_app/pages/login_page.dart';
import 'package:library_app/pages/splash_page.dart';

class Routes {
  final routes = GoRouter(
    routes: [
       GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
