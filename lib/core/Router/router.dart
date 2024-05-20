import 'package:get/get.dart';
import 'package:virtustyler/Features/Auth/Presentation/sign_page.dart';
import 'package:virtustyler/Features/Auth/login_page.dart';
import 'package:virtustyler/Features/Views/home_page.dart';

final getRouter = <GetPage>[
  // GetPage(
  //   name: "/welcome",
  //   page: () => const WelcomePage(),
  // ),
  GetPage(
    name: "/login",
    page: () => const LoginPage(),
  ),
  GetPage(
    name: "/signPage",
    page: () => const SignInPage(),
  ),
  GetPage(
    name: "/home",
    page: () => const HomePage(),
  ),
];
