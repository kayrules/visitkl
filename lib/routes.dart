import 'package:get/get.dart';
import './screen/home_screen.dart';

List<GetPage> pageRoutes = [
  GetPage(
    name: '/visitkl',
    page: () {
      final ssoToken = Get.parameters['sso_token'];
      print('ssoToken from visitkl: $ssoToken');
      return HomeScreen(ssoToken: ssoToken);
    },
  ),
];
