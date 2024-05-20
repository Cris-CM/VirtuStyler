import 'package:get/get.dart';
import 'package:virtustyler/Features/Auth/Presentation/sign_In_page.dart';
import 'package:virtustyler/Features/Auth/login_page.dart';
import 'package:virtustyler/Features/Views/home_page.dart';
import 'package:virtustyler/Features/Views/outfits_pages.dart';

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
  GetPage(
    name: "/list_outfits",
    page: () => const OutfitsPage(),
  ),
];
