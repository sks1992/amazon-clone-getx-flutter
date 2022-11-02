import 'package:amazon_clone_getx/ui/view/auth_view.dart';
import 'package:get/get.dart';

class NameRoutes {
  static String auth = "/auth";
}

class AppRoutes {
  static final route = [
    GetPage(
      name: NameRoutes.auth,
      page: () => AuthView(),
    ),
  ];
}
