import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/features/jobofferproposalfrelancer&company/jobofferproposalfrelancer/Model/JobOfferProposalfrelancerModel.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class JobOfferProposalCompanyController extends GetxController {
  var jobOfferProposals = <JobOfferProposal>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  final dio = Dio();
    MyServices myServices = Get.find();

  @override
  void onInit() {
    super.onInit();
    fetchJobOfferProposals();
  }

  Future<void> fetchJobOfferProposals() async {
    try {
      final response = await dio.get(
        "${ApiEndPoint.basrurl}${ApiEndPoint.fetchJobOfferProposalsforcompany}",
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${myServices.sharedpref.getString(KeyShardpref.token)}",
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = JobOfferProposalResponse.fromJson(response.data);
        jobOfferProposals.assignAll(data.data);
      } else {
        errorMessage.value = 'فشل في تحميل طلبات التقدم للعرض';
      }
    } catch (e) {
      errorMessage.value = 'خطأ: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> acceptProposal(int jobOfferProposalId) async {
    final String url =
        '${ApiEndPoint.basrurl}${ApiEndPoint.companyacceptProposal}/:$jobOfferProposalId';
    try {
      final response = await dio.post(url,
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${myServices.sharedpref.getString(KeyShardpref.token)}",
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),);
      if (response.statusCode == 201) {
        Get.snackbar('نجاح', 'تم قبول العرض بنجاح');
        fetchJobOfferProposals(); // لتحديث القائمة بعد القبول
      } else {
        Get.snackbar('خطأ', 'فشل في قبول العرض');
      }
    } catch (e) {
      Get.snackbar('خطأ', 'حدث خطأ أثناء قبول العرض');
    }
  }

  Future<void> rejectProposal(int jobOfferProposalId) async {
    try {
      final response = await dio.post(
       "${ApiEndPoint.basrurl}${ApiEndPoint.companyrejectProposal}",
        data: {
          "job_offer_proposal_ids": [jobOfferProposalId.toString()],
        },
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${myServices.sharedpref.getString(KeyShardpref.token)}",
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        Get.snackbar('نجاح', 'تم رفض العرض بنجاح');
        fetchJobOfferProposals(); // لتحديث القائمة بعد الرفض
      } else {
        Get.snackbar('خطأ', 'فشل في رفض العرض');
      }
    } catch (e) {
      Get.snackbar('خطأ', 'حدث خطأ أثناء رفض العرض');
    }
  }
}