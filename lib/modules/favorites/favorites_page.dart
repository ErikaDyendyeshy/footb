import 'package:flutter/material.dart';
import 'package:football/modules/favorites/favorites_controller.dart';
import 'package:get/get.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const  Text('Favorites'),
      ),
    );
  }
}
