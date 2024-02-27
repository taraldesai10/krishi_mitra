import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:krishi_mitra/utils/language_widget.dart';

import '../controllers/language_controller.dart';

class ForgetPasswordBottomSheet {
  static Future<dynamic> buildBottomSheet(BuildContext context) {
    return Get.bottomSheet(
      isDismissible: true,
      backgroundColor: Colors.green.shade100,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<LocalizationController>(
            builder: (localizationController) {
              return Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('select'.tr,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 15,
                  ),
                  ListView.builder(
                    itemCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => LanguageWidget(
                      languageModel: localizationController.languages[index],
                      localizationController: localizationController,
                      index: index,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
