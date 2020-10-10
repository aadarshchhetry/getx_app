import 'package:get/route_manager.dart';
import 'package:getx_app/View/home_view.dart';
import 'package:getx_app/View/login_view.dart';

class Router {
  static final route = [
    GetPage(
      name: '/loginView',
      page: () => LoginView(),
    ),
    GetPage(
      name: '/homeView',
      page: () => HomeView(),
    )
  ];
}
