import 'package:freelanc/core/helper/shared_api_functions.dart';
import 'package:freelanc/core/repository/profiles/freelancer/profile_freelancer_repo.dart';
import 'package:freelanc/core/repository/profiles/profile_client_repo.dart';
import 'package:freelanc/core/repository/profiles/profile_company_repo.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/features/client/profile/data/client_modle.dart';
import 'package:freelanc/features/company/profiles/data/company_model.dart';
import 'package:freelanc/features/freelancer/profile/data/freelancer_model.dart';
import 'package:freelanc/features/freelancer/profile/data/portfolio_model.dart';
import 'package:get/get.dart';

abstract class AnyProfileController extends GetxController {
  late CompanyprofileRepoIm companyprofileRepoIm;
  late ProfileClientRepoIm profileClientRepoIm;
  late ProfileFreelancerRepoImp profileFreelancerRepoImp;

  getcompany(int id);
  getfreelancer(int id);
  getClient(int id);
  gotoShowPortfolio(int id);
  getPortfolios(int id);
  int? idFreelancer;
}

class AnyProfileControllerIm extends AnyProfileController {
  @override
  void onInit() {
    companyprofileRepoIm = Get.put(CompanyprofileRepoIm());
    profileClientRepoIm = Get.put(ProfileClientRepoIm());
    profileFreelancerRepoImp = Get.put(ProfileFreelancerRepoImp());
    super.onInit();
  }

  CompanyModel? companyModel;
  FreelancerModel? freelancerModel;
  ClientModel? clientModel;

  @override
  getClient(int id) async {
    final response = await profileClientRepoIm.getClient(id);

    response.fold((error) => Get.snackbar("erorr", error), (client) {
      clientModel = client;
      Get.toNamed(MyRoute.anyProfileClient);
    });
  }

  @override
  getcompany(int id) async {
    final response = await companyprofileRepoIm.showcompany(id);
    response.fold((error) => Get.snackbar("error", error), (company) {
      companyModel = company;
      Get.toNamed(MyRoute.anyProfileCompany);
    });
  }

  @override
  getfreelancer(int id) async {
    final response = await profileFreelancerRepoImp.getFreelancer(id);
    response.fold((error) => Get.snackbar("error", error), (freelancer) {
      freelancerModel = freelancer;
      Get.toNamed(MyRoute.anyProfileFreelancer);
    });
  }

  @override
  gotoShowPortfolio(int id) async {
     await getPortfolios(id);
    Get.toNamed(MyRoute.showAnyportfolio);
  }

  @override
  Future<List<PortfolioModel>> getPortfolios(int id) async {
    List<PortfolioModel> portfolios = [];
    if (idFreelancer != null) {
      final response = await profileFreelancerRepoImp.getFreelancer(id);
      response.fold((error) => Get.snackbar("error", error), (freelancerMoel) {
        portfolios = freelancerMoel.potrfolio;
      });
    }

    return portfolios;
  }
}
