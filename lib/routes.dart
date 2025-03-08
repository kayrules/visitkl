import 'package:get/get.dart';
import './screen/home_screen.dart';
import './screen/second_screen.dart';

List<GetPage> pageRoutes = [
  GetPage(
    name: '/visitkl',
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: '/visitkl/second',
    page: () => const SecondScreen(),
  ),
];
