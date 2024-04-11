import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:job_studio/util/prefrences_const.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/controllers/exports.dart';
import 'package:job_studio/pages/auth/login-page.dart';
import 'package:job_studio/pages/auth/signup-page.dart';
import 'package:job_studio/pages/auth/company_register_pages/signup_first_page.dart';
import 'package:job_studio/pages/chat/chat_detail_page.dart';
import 'package:job_studio/pages/home/widget/recently_post_view_page.dart';
import 'package:job_studio/pages/home/widget/user_interested_job.dart';
import 'package:job_studio/pages/main_screen.dart';
import 'package:job_studio/pages/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget defaultHomeScreen = const OnboardingScreen();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final entryPoint = prefs.getBool(PreferencesConstants.ENTRYPOINT) ?? false;
  final loggedIn = prefs.getBool(PreferencesConstants.LOGGEDIN) ?? false;

  if (entryPoint & !loggedIn) {
    defaultHomeScreen = const LoginPage();
  } else if (entryPoint && loggedIn) {
    defaultHomeScreen = const MainScreen();
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnBoardingNotifer()),
        ChangeNotifierProvider(create: (context) => BookMarkProvider()),
        ChangeNotifierProvider(create: (context) => ImageUpdateProvider()),
        ChangeNotifierProvider(create: (context) => JobProviderNotifer()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => RegisterNotifer()),
        ChangeNotifierProvider(create: (context) => ZoomProvider()),
        ChangeNotifierProvider(create: (context) => CustomStepperProvider()),
        ChangeNotifierProvider(create: (context) => CompanyRegisterNotifer()),
        ChangeNotifierProvider(create: (context) => OtpProviderNotifer()),
        ChangeNotifierProvider(create: (context) => ForgotPasswordProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Job Studio",
          theme: ThemeData(
            scaffoldBackgroundColor: Color(kLight.value),
            iconTheme: IconThemeData(color: Color(kDark.value)),
            primarySwatch: Colors.grey,
          ),
          initialRoute: '/',
          getPages: [
            GetPage(
                name: '/', page: () => defaultHomeScreen),
            GetPage(name: LoginPage.routeName, page: () => const LoginPage()),
            GetPage(
                name: RegisterPage.routeName, page: () => const RegisterPage()),
            GetPage(
                name: SignUpByCompanyFirstPage.routeName,
                page: () => const SignUpByCompanyFirstPage()),
            GetPage(
                name: ChatDetailPage.routeName,
                page: () => const ChatDetailPage()),
            GetPage(
                name: RecentlyPostViewPage.routeName,
                page: () => const RecentlyPostViewPage()),
            GetPage(
                name: UserInterestedJobList.routeName,
                page: () => const UserInterestedJobList()),
          ],
        );
      },
    );
  }
}
