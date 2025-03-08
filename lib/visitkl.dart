library visitkl;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'component/start_button.dart';
import 'controller/controller_listener.dart';
import 'controller/visitkl_controller.dart';
import 'routes.dart';

class Visitkl {
  Visitkl() {
    initialize();
  }

  static Future<void> initialize() async {
    await GetStorage.init();
    Get.put(VisitklController());
  }

  static Map<String, dynamic> configs() {
    return {
      'headerColor': Colors.white,
    };
  }

  static Widget listener(
      {required Widget Function(Map<String, dynamic>) builder}) {
    return VisitklListener(builder: builder);
  }

  static Widget startButton(BuildContext context) {
    return StartButton(context: context);
  }

  static bool isEnabled() {
    return Get.find<VisitklController>().isEnabled.value;
  }

  static List<GetPage> routes() {
    return pageRoutes;
  }
}
