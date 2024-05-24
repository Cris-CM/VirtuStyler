import 'package:get/get.dart';
import 'package:virtustyler/Features/Auth/Controllers/auth_binding.dart';
import 'package:virtustyler/Features/Auth/perfil_page.dart';
import 'package:virtustyler/Features/Auth/selec_gender.dart';
import 'package:virtustyler/Features/Auth/select_size.dart';
import 'package:virtustyler/Features/Auth/Views/login_view.dart';
import 'package:virtustyler/Features/Auth/Views/register_view.dart';
import 'package:virtustyler/Features/Home/Views/home_page.dart';

final getRouter = <GetPage>[
  // GetPage(
  //   name: "/welcome",
  //   page: () => const WelcomePage(),
  // ),
  GetPage(
    name: "/login",
    page: () => const LoginView(),
    binding: AuthBinding(),
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
    page: () => const RegisterView(),
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
