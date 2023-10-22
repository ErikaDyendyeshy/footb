import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football/modules/profile/profile_controller.dart';
import 'package:football/style/app_colors.dart';
import 'package:football/widget/f_avatar_widget.dart';
import 'package:football/widget/f_svg_icon_widget.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Profile'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Obx(
      () => controller.userData.value == null
          ? Column(
              children: [
                GestureDetector(
                  onTap: () => controller.signOut(),
                  child: const ListTile(
                      title: Text('Log out'),
                      trailing: FSVGIconWidget(
                        icon: 'icon_log_out',
                        color: AppColors.red,
                      )),
                ),
                Center(
                  child: Lottie.asset('assets/lottie/animation_lnupk0i3.json'),
                ),
              ],
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _avatar(),
                  const SizedBox(height: 30),
                  _infoUser(),
                  _setting(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
    );
  }

  Widget _avatar() {
    return Center(
      child: GestureDetector(
        onTap: () => controller.uploadPhoto(),
        child: Obx(
          () => controller.avatarRx.value != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.file(
                      controller.avatarRx.value!,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : FAvatarWidget(
                  height: 100,
                  width: 100,
                  avatarUrl: controller.userData.value?['avatar'],
                ),
        ),
      ),
    );
  }

  Widget _infoUser() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.darkGray2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: Get.theme.textTheme.labelLarge!.copyWith(
              color: Get.theme.colorScheme.secondary,
            ),
          ),
          Text(
            controller.userData.value?['email'] ?? 'No email',
            style: Get.theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 5),
          const Divider(),
          const SizedBox(height: 5),
          Text(
            'Name',
            style: Get.theme.textTheme.labelLarge!.copyWith(
              color: Get.theme.colorScheme.secondary,
            ),
          ),
          Text(
            controller.userData.value?['name'] ?? 'No name',
            style: Get.theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget _setting() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.darkGray2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Notification'),
            trailing: Obx(
              () => CupertinoSwitch(
                activeColor: Get.theme.colorScheme.primary,
                value: controller.isNotification.value,
                onChanged: (bool value) {
                  controller.isNotification.value = !controller.isNotification.value;
                },
              ),
            ),
          ),
          const Divider(),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Theme'),
            trailing: Obx(
              () => CupertinoSwitch(
                activeColor: Get.theme.colorScheme.primary,
                value: controller.isDarkTheme.value,
                onChanged: (bool value) {
                  controller.isDarkTheme.value = !controller.isDarkTheme.value;
                },
              ),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () => controller.signOut(),
            child: const ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Log out'),
                trailing: FSVGIconWidget(
                  icon: 'icon_log_out',
                  color: AppColors.red,
                )),
          ),
        ],
      ),
    );
  }
}
