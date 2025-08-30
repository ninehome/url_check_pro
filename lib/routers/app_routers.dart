import 'package:get/get.dart';

import '../login_register/views/login_view.dart';


class AppRouter {
  static String loginPage = "/LoginPage";





}


class GetPages {
  static List<GetPage> getPages = [


    GetPage(name: AppRouter.loginPage, page: () =>  LoginView()),






  ];
}