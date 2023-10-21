import 'package:flutter/material.dart';
import 'package:football/modules/search/search_controller.dart';
import 'package:football/widget/f_svg_icon_widget.dart';
import 'package:football/widget/f_text_field_widget.dart';

import 'package:get/get.dart';

class SearchPage extends GetView<SearchAppController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'txt_search'.tr.capitalizeFirst!,
        ),
        elevation: 0,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Obx(() =>
        FTextFieldWidget(
          focusNode: controller.searchFocusNode,
          hintText: 'txt_search'.tr.capitalizeFirst!,
          trailingIcon: controller.searchTextRx.isEmpty ? 'icon_search' : 'icon_x',
          trailingOnTap: () => controller.clearSearchField(),
          onChanged: (search) => controller.search(search),
        ),
      ),
    );
  }
}
