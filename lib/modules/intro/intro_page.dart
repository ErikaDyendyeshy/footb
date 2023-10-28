import 'package:flutter/material.dart';
import 'package:football/modules/intro/intro_controller.dart';
import 'package:football/style/app_colors.dart';
import 'package:football/widget/f_button_widget.dart';
import 'package:football/widget/f_svg_icon_widget.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends GetView<IntroController> {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          if (controller.isShowButtons.value) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _logo(),
                  _buttons(),
                ],
              ),
            );
          } else {
            return Lottie.asset('assets/lottie/animation_lnupk0i3.json');
          }
        }),
      ),
    );
  }

  Widget _logo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const FSVGIconWidget(
          icon: 'logo',
          height: 130,
          color: AppColors.gray200,
        ),
        Flexible(
          child: Text(
            'MATCHVIEW',
            style: Get.theme.textTheme.headlineLarge!.copyWith(
              fontSize: 55,
            ),
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buttons() {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        FButtonWidget(
          text: 'txt_sign_up'.tr.capitalizeFirst!,
          onPressed: controller.openSignUpPage,
        ),
        const SizedBox(height: 20),
        FButtonWidget(
          color: Get.theme.colorScheme.onPrimary,
          textStyle: Get.theme.textTheme.labelLarge!.copyWith(
            color: Get.theme.colorScheme.primary,
          ),
          text: 'txt_login'.tr.capitalizeFirst!,
          onPressed: controller.openLoginPage,
        )
      ],
    );
  }
}
