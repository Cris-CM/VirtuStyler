import 'package:get/get.dart';
import 'package:virtustyler/Features/Auth/Controllers/auth_binding.dart';
import 'package:virtustyler/Features/Auth/Views/factura_view.dart';
import 'package:virtustyler/Features/Auth/Views/payment_view.dart';
import 'package:virtustyler/Features/Home/Controllers/home_binding.dart';
import 'package:virtustyler/Features/Home/Views/home_view.dart';
import 'package:virtustyler/Features/Auth/Views/Register/selec_gender.dart';
import 'package:virtustyler/Features/Auth/Views/Register/select_size.dart';
import 'package:virtustyler/Features/Auth/Views/login_view.dart';
import 'package:virtustyler/Features/Auth/Views/Register/register_view.dart';

final getRouter = <GetPage>[
  GetPage(
    name: "/login",
    page: () => const LoginView(),
    binding: AuthBinding(),
  ),
  GetPage(
      name: "/register",
      page: () => const RegisterView(),
      binding: AuthBinding(),
      children: [
        GetPage(
          name: "/selecGender",
          page: () => const SelectGender(),
        ),
        GetPage(
          name: "/selecSize",
          page: () => const SelectSize(),
        ),
      ]),
  GetPage(
    name: "/home",
    page: () => const HomeView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: "/pagos",
    page: () => const PaymentView(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: "/factura",
    page: () => const PagosView(),
    binding: AuthBinding(),
  ),
];
