import 'package:freelanc/core/binding/forgetpass_binding.dart';
import 'package:freelanc/core/binding/info_profile_client_binding.dart';
import 'package:freelanc/core/binding/info_profile_company_binding.dart';
import 'package:freelanc/core/binding/info_profile_freelancer.dart';
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
import 'package:freelanc/features/chat/ui/all_chat.dart';
import 'package:freelanc/features/chat/ui/chat.dart';
import 'package:freelanc/features/client/dashboard/ui/dash_board_client.dart';
import 'package:freelanc/features/client/profile/ui/info_profile_client.dart';
import 'package:freelanc/features/client/profile/ui/my_profile_client.dart';
import 'package:freelanc/features/dashboard/ui/dashborad.dart';
import 'package:freelanc/features/freelancer/profile/ui/add_portfolio.dart';
import 'package:freelanc/features/freelancer/profile/ui/info_profile_freelancer.dart';
import 'package:freelanc/features/freelancer/profile/ui/show_my_portfolio.dart';
import 'package:freelanc/features/freelancer/profile/ui/verfiy_profile_freelancer.dart';
import 'package:freelanc/features/onboarding/ui/onboarding.dart';
import 'package:freelanc/features/company/profiles/ui/verfiy_profile_company.dart';
import 'package:freelanc/features/company/profiles/ui/info_profile_company.dart';
import 'package:freelanc/features/profiles/ui/any_profile_client.dart';
import 'package:freelanc/features/profiles/ui/any_profile_company.dart';
import 'package:freelanc/features/profiles/ui/any_profile_freelancer.dart';
import 'package:freelanc/features/profiles/ui/show_any_portfolio.dart';
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
    GetPage(
      name: MyRoute.sucsses,
      page: () => const SucssesVerfiyEmail(),
    ),
    // profiles company
    GetPage(
        name: MyRoute.infoprofilecompany,
        page: () => const InfoProfileCompany(),
        binding: InfopProfilecompanyBinding()),
    GetPage(
        name: MyRoute.verfiymyprofilecompany,
        page: () => const VerfiyMyPfofileCompany(),
        binding: InfopProfilecompanyBinding()),

    GetPage(name: MyRoute.dashbord, page: () => DashBoard()),

    // client profile
    GetPage(
      name: MyRoute.infoprofileclient,
      page: () => InfoProfileClient(),
      binding: InfopProfileclientBinding(),
    ),
    GetPage(
        name: MyRoute.myprofileclient,
        page: () => const MyPfofileClient(),
        binding: InfopProfileclientBinding()),

    GetPage(name: MyRoute.dashBoardClint, page: () => const DashBoardClint()),

    // freelnacer profile
    GetPage(
        name: MyRoute.infoprofileFreelancer,
        page: () => const InfoPfofileFreelancer(),
        binding: InfopProfileFreelancerBinding()),
    GetPage(
        name: MyRoute.verfiymyprofileFreelancer,
        page: () => const VerfiyprofileFreelancer(),
        binding: InfopProfileFreelancerBinding()),


    GetPage(
      name: MyRoute.addportfolio,
      page: () => AddPortfolio(),
    ),
    GetPage(
      name: MyRoute.showMyportfolio,
      page: () => ShowMYPortfolio(),
    ), 
    // any profile 
    GetPage(name: MyRoute.anyProfileClient, page: ()=>  AnyProfileClient()),
    GetPage(name: MyRoute.anyProfileCompany, page: ()=>AnyProfileCompany()),
    GetPage(name: MyRoute.anyProfileFreelancer, page: ()=> AnyProfileFreelnacer()),
    GetPage(name: MyRoute.showAnyportfolio, page: ()=> ShowAnyPortfolio()),

    //chat
    GetPage(name: MyRoute.chat, page: () => const Chat()),

    // test page
    GetPage(name: MyRoute.test, page: () => const TestWidgets()),
    GetPage(name: MyRoute.allCaht, page: () => const AllCaht())
  ];
}
