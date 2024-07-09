import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/Util/util.dart';
import 'package:virtustyler/core/models/product_model.dart';
import 'package:virtustyler/core/widgets/custom_button.dart';
import 'package:virtustyler/core/widgets/custom_input.dart';
import '../../../core/colors/palette.dart';
import '../../../core/widgets/texts.dart';

class PagosView extends StatefulWidget {
  const PagosView({super.key});

  @override
  State<PagosView> createState() => _PagosViewState();
}

class _PagosViewState extends State<PagosView> {
  late ProductModel productModel;

  @override
  void initState() {
    productModel = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/logo.png').marginOnly(
                    right: 5.w,
                  ),
                  const Texts.regular(
                    'Reporte de Facturacion',
                    fontSize: 18,
                  ),
                ],
              ).marginOnly(bottom: 5.h),
              Row(
                children: [
                  Icon(
                    Icons.check,
                    color: Palette.blue,
                    size: 7.w,
                  ).marginOnly(right: 6.w),
                  Texts.regular(
                    productModel.name,
                    fontSize: 12,
                  ),
                ],
              ).marginOnly(bottom: 10.h),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: Palette.green,
                    size: 7.w,
                  ).marginOnly(right: 6.w),
                  const Texts.regular(
                    'Total producto',
                    fontSize: 12,
                  ),
                  const Spacer(),
                  Texts.regular(
                    '\$${productModel.price}',
                    fontSize: 12,
                  ),
                ],
              ).marginOnly(bottom: 9.h),
              Column(
                children: [
                  Row(
                    children: [
                      const Texts.regular(
                        'Total producto',
                        fontSize: 8,
                      ),
                      const Spacer(),
                      Texts.regular(
                        '\$${productModel.price}',
                        fontSize: 8,
                      ),
                    ],
                  ).marginOnly(bottom: 2.h),
                  const Row(
                    children: [
                      Texts.regular(
                        'Envio',
                        fontSize: 8,
                      ),
                      Spacer(),
                      Texts.regular(
                        '\$0.00',
                        fontSize: 8,
                      ),
                    ],
                  ).marginOnly(bottom: 2.h),
                ],
              ).paddingOnly(left: 5.w).marginOnly(bottom: 7.h),
              Row(
                children: [
                  Icon(
                    Icons.attach_money,
                    color: Palette.green,
                    size: 7.w,
                  ),
                  const Texts.bold(
                    'Total cobrado',
                    fontSize: 18,
                  ),
                  const Spacer(),
                  Texts.bold(
                    '\$${productModel.price}',
                    fontSize: 15,
                  ),
                ],
              ).marginOnly(bottom: 7.h),
              CustomButton(
                buttonText: 'Coordinar envio',
                onPressed: () {
                  final numberController = TextEditingController();
                  Get.defaultDialog(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 2.h,
                        horizontal: 4.w,
                      ),
                      title: "Coordinacion de envio",
                      content: Column(
                        children: [
                          const Texts.bold(
                            "Ingrese su WhatsApp para coordinacion",
                          ).marginOnly(bottom: 2.h),
                          CustomInput(
                            controller: numberController,
                            hinttext: "900890000",
                            keyboardType: TextInputType.number,
                          ).marginOnly(bottom: 2.h),
                          CustomButton(
                            buttonText: "Enviar",
                            onPressed: () {
                              if (numberController.text.isEmpty) {
                                Util.errorSnackBar("Rellene el numero");
                                return;
                              }
                              Get.closeAllSnackbars();
                              Get.back();

                              Get.back();
                              Util.successSnackBar("Mensaje enviado");
                            },
                          ),
                        ],
                      ));
                },
              ).marginOnly(bottom: 1.h),
              CustomButton(
                buttonText: 'regresar',
                onPressed: () {
                  Get.back();
                },
              )
            ],
          ).paddingOnly(top: 2.h, left: 5.w, right: 5.w),
        ),
      ),
    );
  }
}
