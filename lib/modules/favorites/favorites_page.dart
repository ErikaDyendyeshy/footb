import 'package:flutter/material.dart';
import 'package:football/modules/favorites/favorites_controller.dart';
import 'package:football/style/app_colors.dart';
import 'package:get/get.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Favorites'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'txt_the_list_is_empty_add_your_favorite_team_to_the_list'.tr,
            style: Get.theme.textTheme.titleMedium!.copyWith(color: AppColors.gray300),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
