import 'package:go_router/go_router.dart';
import 'package:virtustyler/Features/Auth/Presentation/login_page.dart';
import 'package:virtustyler/Features/Auth/Presentation/welcome_page.dart';
import 'package:virtustyler/Features/Home/home_page.dart';

final goRouter = GoRouter(
  initialLocation: "/welcome",
  routes: [
    GoRoute(
      path: "/welcome",
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: "/login",
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => const HomePage(),
    )
  ],
);
