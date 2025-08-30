import 'package:get/get.dart';

import '../check/binding/check_domain_binding.dart';
import '../check/view/check_domain_view.dart';
import '../check_record/binding/check_record_binding.dart';
import '../check_record/view/check_record_view.dart';
import '../check_result/binding/check_result_binding.dart';
import '../check_result/view/check_result_view.dart';
import '../app/check_list/views/check_list_view.dart';
import '../login_register/views/login_view.dart';


class AppRouter {
  static String loginPage = "/LoginPage";


  static const checkDomain = '/check_domain';
  static const checkRecord = '/check_record';
  static const checkResult = '/check_result';

  static String checkListView = "/me_CheckListView";




}


class GetPages {
  static List<GetPage> getPages = [

    GetPage(name: AppRouter.loginPage, page: () =>  LoginView()),
    GetPage(name: AppRouter.checkListView, page: () =>  CheckListView()),

    GetPage(name: AppRouter.checkDomain, page:() =>CheckDomainView(),binding: CheckDomainBinding()),

    GetPage(name: AppRouter.checkRecord, page:() =>CheckRecordView(),binding: CheckRecordBinding()),

    GetPage(name: AppRouter.checkResult, page:() =>CheckResultView(),binding: CheckResultBinding()),


  ];
}