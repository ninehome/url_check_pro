
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:untitled2/routers/app_routers.dart';
import 'package:untitled2/routers/sr_router_observers.dart';
import 'package:untitled2/utils/sr_theme.dart';
import 'app_init_binding.dart';
import 'common_widgets/toast_utils.dart';


Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // /// 安卓的工具栏背景色透明
  // if (Platform.isAndroid) {
  //   SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
  //       systemNavigationBarIconBrightness: Brightness.dark,
  //       //使用的时候发现，在虚拟按键的手机上，如果是采用全透明颜色，虚拟按键上将会有个半透明的白色覆盖，达不到全屏沉浸效果，所以需要使用非0透明值的颜色。
  //       systemNavigationBarColor: Colors.black,
  //       systemNavigationBarContrastEnforced: true,
  //       statusBarColor: Colors.transparent);
  //   // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  //
  // } else if (Platform.isIOS) {
  //   /// iOS状态栏使用白色字体
  //   // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);  //隐藏状态栏 上方黑边
  //
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]); //隐藏导航栏
  //
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);  // 隐藏状态栏和导航栏  上方黑板
  //   // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle( //设置状态栏透明
  //   //   statusBarColor: Colors.transparent,
  //   // ));
  // }





  runApp(const MyApp());
}

GlobalKey<NavigatorState> navContextKey = GlobalKey();


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // 监听应用生命周期
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // 取消监听
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:// 从后台切换前台，界面可见


        break;
      case AppLifecycleState.inactive:

        break;
      case AppLifecycleState.paused: // 界面不可见，后台


        break;
      case AppLifecycleState.detached:

        break;
      case AppLifecycleState.hidden:

        break;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(750,1336),
      builder: (context,child){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navContextKey,
          theme: SrTheme().getTheme(),
          defaultTransition: Transition.cupertino,
          navigatorObservers: [srRouterObserver],
          initialRoute: AppRouter.checkDomain,
          initialBinding: AppInitBinding(context),
          getPages: GetPages.getPages,
          color: Colors.white,
          title: "域名检测",
          fallbackLocale: const Locale('zh', 'CN'),
          locale: const Locale('zh', "CN"),
          supportedLocales: const [
            Locale('zh', 'CN'),
          ],
          localizationsDelegates: const [
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],

          builder: DialogUtils.initLoading(builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              //控制不跟随系统
              child: GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: child!,
              ),
            );
          }),
        );
      },
    );
  }
}
