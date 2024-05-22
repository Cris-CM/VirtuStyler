import 'package:get/get.dart';
import 'package:virtustyler/Features/Auth/perfil_page.dart';
import 'package:virtustyler/Features/Auth/selec_gender.dart';
import 'package:virtustyler/Features/Auth/select_size.dart';
import 'package:virtustyler/Features/Auth/Presentation/sign_page.dart';
import 'package:virtustyler/Features/Auth/Presentation/login_page.dart';
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
    name: "/selecGender",
    page: () => const SelecGender(),
  ),
  GetPage(
    name: "/selecSize",
    page: () => const SelecSize(),
  ),
  GetPage(
    name: "/signIn",
    page: () => const SignInPage(),
  ),
  GetPage(
    name: "/home",
    page: () => const HomePage(),
  ),
  GetPage(
    name: "/perfil",
    page: () => const PerfilPage(),
  ),
];
