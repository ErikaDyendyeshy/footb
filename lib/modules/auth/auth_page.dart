import 'package:flutter/material.dart';
import 'package:football/modules/auth/auth_controller.dart';
import 'package:football/style/app_colors.dart';
import 'package:football/widget/f_button_widget.dart';
import 'package:football/widget/f_divider_widget.dart';
import 'package:football/widget/f_svg_icon_widget.dart';
import 'package:football/widget/f_text_field_widget.dart';
import 'package:get/get.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Obx(
          () => Text(
            controller.isLogin.value
                ? 'txt_login'.tr.capitalizeFirst!
                : 'txt_sign_up'.tr.capitalizeFirst!,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller.isLogin.value = !controller.isLogin.value;
            },
            child: Obx(
              () => Text(
                controller.isLogin.value
                    ? 'txt_sign_up'.tr.capitalizeFirst!
                    : 'txt_login'.tr.capitalizeFirst!,
                style: Get.theme.textTheme.labelLarge!.copyWith(
                  color: AppColors.gray200,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 64),
            FTextFieldWidget(
              hintText: 'txt_write_your_email'.tr.capitalizeFirst!,
              controller: controller.emailController,
              labelText: 'txt_email'.tr.capitalizeFirst!,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            Obx(
              () => FTextFieldWidget(
                hintText: controller.isLogin.value
                    ? 'txt_write_your_password'.tr.capitalizeFirst!
                    : 'txt_create_a_password'.tr.capitalizeFirst!,
                controller: controller.passwordController,
                labelText: 'txt_password'.tr.capitalizeFirst!,
                obscureText: controller.passwordObscured.value,
                trailingIcon:
                    controller.passwordObscured.value ? 'icon_eye_closed' : 'icon_eye_opened',
                trailingOnTap: () {
                  controller.passwordObscured.toggle();
                },
                textInputAction: TextInputAction.go,
              ),
            ),
            const SizedBox(height: 64),
            Obx(
              () => FButtonWidget(
                loading: controller.isLoading.value,
                text: controller.isLogin.value
                    ? 'txt_login'.tr.capitalizeFirst!
                    : 'txt_register'.tr.capitalizeFirst!,
                onPressed: () => controller.signUp(),
              ),
            ),
            const SizedBox(height: 32),
            FDividerWidget(
              type: DividerType.withText,
              text: 'txt_or'.tr,
            ),
            const SizedBox(height: 32),
            Obx(
              () => FButtonWidget(
                leading: const FSVGIconWidget(icon: 'google'),
                loading: controller.isLoading.value,
                text: controller.isLogin.value
                    ? 'txt_sign_in_with_google'.tr
                    : 'txt_sign_up_with_google'.tr,
                onPressed: () => controller.signUpWithGoogle(),
                color: Get.theme.colorScheme.onPrimary,
                textStyle: Get.theme.textTheme.labelLarge!.copyWith(
                  color: Get.theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
