import 'package:get/get.dart';
import '../app/check_photo/binding/check_photo_binding.dart';
import '../app/check_photo/view/check_photo_view.dart';

import '../app/login_register/views/login_view.dart';
import '../app/today_task/view/today_task_view.dart';
import '../app/check/binding/check_domain_binding.dart';
import '../app/check/view/check_domain_view.dart';
import '../app/check_record/binding/check_record_binding.dart';
import '../app/check_record/view/check_record_view.dart';
import '../app/check_result/binding/check_result_binding.dart';
import '../app/check_result/view/check_result_view.dart';
import '../app/check_list/views/check_list_view.dart';



class AppRouter {
  static String loginPage = "/LoginPage";


  static const checkDomain = '/check_domain';
  static const checkRecord = '/check_record';
  static const checkResult = '/check_result';
  static const checkPhotoView = '/check_photo_result';

  static String checkListView = "/me_CheckListView";


}


class GetPages {
  static List<GetPage> getPages = [

    GetPage(name: AppRouter.loginPage, page: () =>  LoginView()),
    GetPage(name: AppRouter.checkListView, page: () =>  CheckListView()),

    GetPage(name: AppRouter.checkDomain, page:() =>CheckDomainView(),binding: CheckDomainBinding()),

    GetPage(name: AppRouter.checkRecord, page:() =>CheckRecordView(),binding: CheckRecordBinding()),

    GetPage(name: AppRouter.checkResult, page:() =>CheckResultView(),binding: CheckResultBinding()),

    GetPage(name: AppRouter.checkResult, page:() =>TodayTaskView(),binding: CheckResultBinding()),

    GetPage(name: AppRouter.checkPhotoView, page:() =>CheckPhotoView(),binding: CheckPhotoBinding()),


  ];
}