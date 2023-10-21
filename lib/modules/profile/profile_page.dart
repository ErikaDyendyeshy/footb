import 'package:flutter/material.dart';
import 'package:football/modules/profile/profile_controller.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, title: Text('Profile'),),
    );
  }
}
