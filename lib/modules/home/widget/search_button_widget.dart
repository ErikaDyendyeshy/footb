import 'package:flutter/material.dart';
import 'package:football/modules/home/home_controller.dart';
import 'package:football/style/app_colors.dart';
import 'package:football/widget/f_svg_icon_widget.dart';
import 'package:get/get.dart';

class SearchButtonWidget extends GetView<HomeController> {
  const SearchButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.openSearchPage(),
      child: Container(
        height: 50,
        width: Get.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 7,
        ),
        decoration: BoxDecoration(
          color: AppColors.darkGray,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'txt_search'.tr.capitalizeFirst!,
              style: Get.theme.inputDecorationTheme.hintStyle,
            ),
            const FSVGIconWidget(
              icon: 'icon_search',
            ),
          ],
        ),
      ),
    );
  }
}
