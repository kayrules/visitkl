import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'visitkl_controller.dart';

class VisitklListener extends StatelessWidget {
  final Widget Function(Map<String, dynamic>) builder;

  const VisitklListener({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final VisitklController ssoController = Get.find<VisitklController>();

    return Obx(() {
      return builder({'isEnabled': ssoController.isEnabled.value});
    });
  }
}
