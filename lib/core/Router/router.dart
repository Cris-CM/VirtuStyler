import 'package:get/get.dart';
import 'package:virtustyler/Features/Auth/Presentation/welcome_page.dart';
import 'package:virtustyler/Features/Auth/Views/login_page.dart';
import 'package:virtustyler/Features/Home/Views/scan_page.dart';

final getRouter = <GetPage>[
  GetPage(
    name: "/login",
    page: () => LoginPage(),
  ),
  GetPage(
    name: "/home",
    page: () => HomePage(),
  ),
  GetPage(
    name: "/welcome",
    page: () => WelcomePage(),
  ),
];
