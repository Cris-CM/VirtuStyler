import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:virtustyler/core/Util/Router/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Stripe.publishableKey =
      "pk_test_51OdiwLBVQCFU1ZTs1OsLhnEHt4NgzfpQ2O65r3vQsA6ZcPhNUIdXChcMYeNHiqE4wAM5lXyRPrhOoKBFB5UTcE9V00ddPMqfGS";

  await dotenv.load(fileName: ".env");
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'VirtuStyler',
          initialRoute: "/login",
          debugShowCheckedModeBanner: false,
          getPages: getRouter,
        );
      },
    );
  }
}
