import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class VisitklController extends GetxController {
  final GetStorage _storage = GetStorage();

  var isEnabled = false.obs;
  var localVariable = ''.obs;
  var persistentVariable = ''.obs;

  @override
  void onInit() {
    super.onInit();

    String? enabled = _storage.read('Visitkl_Is_Enabled');
    if (enabled != null) {
      isEnabled.value = enabled == 'true';
    }

    String? persistent = _storage.read('Visitkl_Persistent_Variable');
    if (persistent != null) {
      persistentVariable.value = persistent;
    }
  }

  void setLocalVariable(String variable) {
    localVariable.value = variable;
  }

  void setPersistentVariable(String variable) {
    persistentVariable.value = variable;
    _storage.write('Visitkl_Persistent_Variable', variable);
  }
}
