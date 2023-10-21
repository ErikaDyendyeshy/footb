import 'package:flutter/material.dart';
import 'package:football/modules/main/main_controller.dart';
import 'package:football/style/app_colors.dart';
import 'package:football/widget/f_svg_icon_widget.dart';
import 'package:get/get.dart';

class AppBottomBar extends GetView<MainController> {
  const AppBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      height: 64,
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.darkGray,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _item(
              icon: 'icon_home',
              title: 'txt_home'.tr.capitalizeFirst!,
              select: controller.selectedPageIndex.value == 0 ? true : false,
              onTap: () {
                controller.selectedPageIndex.value = 0;
              },
            ),
            _item(
              icon: 'icon_favorite',
              title: 'txt_favorites'.tr.capitalizeFirst!,
              select: controller.selectedPageIndex.value == 1 ? true : false,
              onTap: () {
                controller.selectedPageIndex.value = 1;
              },
            ),
            _item(
              icon: 'icon_user',
              title: 'txt_profile'.tr.capitalizeFirst!,
              select: controller.selectedPageIndex.value == 2 ? true : false,
              onTap: () {
                controller.selectedPageIndex.value = 2;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _item({
    required String icon,
    required String title,
    required bool select,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FSVGIconWidget(
            icon: icon,
            color: select ? AppColors.primary : AppColors.gray300,
          ),
          Text(title,
              style: Get.theme.textTheme.labelMedium!
                  .copyWith(color: select ? AppColors.primary : AppColors.gray300)),
        ],
      ),
    );
  }
}
