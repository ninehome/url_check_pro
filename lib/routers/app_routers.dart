import 'package:get/get.dart';

import '../app/check_list/views/check_list_view.dart';
import '../login_register/views/login_view.dart';


class AppRouter {
  static String loginPage = "/LoginPage";



  static String checkListView = "/me_CheckListView";




}


class GetPages {
  static List<GetPage> getPages = [


    GetPage(name: AppRouter.loginPage, page: () =>  LoginView()),
    GetPage(name: AppRouter.checkListView, page: () =>  CheckListView()),





  ];
}