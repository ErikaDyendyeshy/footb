import 'package:flutter/material.dart';
import 'package:football/modules/search/search_controller.dart';
import 'package:football/style/app_colors.dart';
import 'package:football/widget/f_text_field_widget.dart';

import 'package:get/get.dart';

class SearchPage extends GetView<SearchAppController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
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
      child: Obx(
        () => Column(
          children: [
            FTextFieldWidget(
                focusNode: controller.searchFocusNode,
                controller: controller.searchController,
                hintText: 'txt_search'.tr.capitalizeFirst!,
                trailingIcon: controller.searchTextRx.isEmpty ? 'icon_search' : 'icon_x',
                trailingOnTap: () => controller.clearSearchField(),
                onChanged: (search) {
                  return controller.search(search);
                }),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                  itemCount: controller.leagueList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = controller.leagueList[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                          color: AppColors.darkGray2, borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        onTap: (){},
                        title: Text(
                          item.league.name!,
                        ),
                        leading: Image.network(
                          item.league.logo!,
                          width: 30,
                          height: 30,
                        ),
                        trailing: const  Icon(Icons.arrow_forward_ios_sharp, color: AppColors.gray400,),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
