import 'package:flutter/material.dart';
import 'package:football/modules/intro/intro_controller.dart';
import 'package:football/widget/f_button_widget.dart';
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
              child: Obx(
                () => AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  height: controller.currentUser.value ? 300 : 200,
                  onEnd: () {
                    if (controller.currentUser.value) {
                      Future.delayed(const Duration(milliseconds: 10), () {
                        controller.isShowButtons.value = true;
                      });
                    } else {
                      controller.isShowButtons.value = false;
                    }
                  },
                  child: AnimatedOpacity(
                    opacity: controller.isShowButtons.value ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'SPORT',
                          style: Get.theme.textTheme.headlineLarge!.copyWith(
                            fontSize: 60,
                          ),
                        ),
                        const SizedBox(height: 100),
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
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Lottie.asset('assets/lottie/animation_lnupk0i3.json');
          }
        }),
      ),
    );
  }
}
