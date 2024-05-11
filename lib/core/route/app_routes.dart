import 'package:freelanc/core/binding/forgetpass_binding.dart';
import 'package:freelanc/core/binding/info_profile_company.dart';
import 'package:freelanc/core/binding/singin_binding.dart';
import 'package:freelanc/core/middlware/mymiddlware.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/features/auth/forget_passwoed/ui/forget_password.dart';
import 'package:freelanc/features/auth/forget_passwoed/ui/forgetpass_verfiy_email.dart';
import 'package:freelanc/features/auth/forget_passwoed/ui/re_password.dart';
import 'package:freelanc/features/auth/login/ui/login.dart';
import 'package:freelanc/features/auth/sing_in_user/ui/chose_type_user.dart';
import 'package:freelanc/features/auth/sing_in_user/ui/singin.dart';
import 'package:freelanc/features/auth/sing_in_user/ui/sucsses_verfiy_email.dart';
import 'package:freelanc/features/auth/sing_in_user/ui/verfiy_email_sing.dart';
import 'package:freelanc/features/company/dashboard/ui/dashborad.dart';
import 'package:freelanc/features/onboarding/ui/onboarding.dart';
import 'package:freelanc/features/company/profiles/ui/verfiy_myprofile.dart';
import 'package:freelanc/features/company/profiles/ui/info_profile_compant_one.dart';
import 'package:freelanc/features/company/profiles/ui/info_profile_company_tow.dart';
import 'package:freelanc/testwidgets.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppRoute {
  List<GetPage<dynamic>> list = [
    //onboarding
    GetPage(
        name: MyRoute.onboarding,
        page: () => const OnBoarding(),
        middlewares: [Mymiddlware()]),

    //auth
    GetPage(
      name: MyRoute.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
        name: MyRoute.forgetpassword,
        page: () => const Forgetpassword(),
        binding: ForgetpasswordBinding()),
    GetPage(
        name: MyRoute.forgetverfiyemail,
        page: () => const ForgetVerfiyEmail(),
        binding: ForgetpasswordBinding()),
    GetPage(name: MyRoute.rePassword, page: () => const RePassword()),
    GetPage(
        name: MyRoute.singin,
        page: () => const SinginScreen(),
        binding: SinginBinding()),
    GetPage(name: MyRoute.chosetypeuser, page: () => const choseTypeUser()),
    GetPage(
      name: MyRoute.verfiyemilsing,
      page: () => const VerfiyEmailSingin(),
    ),
    // pages company enter info profile
    GetPage(
        name: MyRoute.infoprofilecompanyone,
        page: () => const InfoProfileCompanyOne(),
        binding: InfopProfilecompanyBinding()),
    GetPage(
        name: MyRoute.infoprofilecompanytow,
        page: () => const InfoProfileComapnyTow(),
        binding: InfopProfilecompanyBinding()),
    GetPage(
        name: MyRoute.verfiymyprofilecompany,
        page: () => const VerfiyMyPfofileCompany(),
        binding: InfopProfilecompanyBinding()),

    GetPage(
      name: MyRoute.sucsses,
      page: () => const SucssesVerfiyEmail(),
    ),
    GetPage(name: MyRoute.test, page: () => const TestWidgets()),

    GetPage(name: MyRoute.dashbordcompany, page: () => const DashBoardCompany())
  ];
}
