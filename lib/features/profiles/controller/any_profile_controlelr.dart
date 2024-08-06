import 'package:freelanc/features/client/profile/data/client_modle.dart';
import 'package:freelanc/features/company/profiles/data/company_model.dart';
import 'package:freelanc/features/freelancer/profile/data/freelancer_model.dart';
import 'package:get/get.dart';

abstract class AnyProfileController extends GetxController {
  getcompany();
  getfreelancer();
  getClient();
  
}

class AnyProfileControllerIm extends AnyProfileController {
  CompanyModel? companyModel;
  FreelancerModel ?freelancerModel;
  ClientModel? clientModel;

  @override
  getClient() {
    // TODO: implement getClient
    throw UnimplementedError();
  }

  @override
  getcompany() {
    // TODO: implement getcompany
    throw UnimplementedError();
  }

  @override
  getfreelancer() {
    // TODO: implement getfreelancer
    throw UnimplementedError();
  }
}
