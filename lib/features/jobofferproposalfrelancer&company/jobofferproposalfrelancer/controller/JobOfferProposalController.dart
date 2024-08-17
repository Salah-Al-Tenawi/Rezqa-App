import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/features/company/show_myoffer/model/Model_for_companyofferonly.dart'as offer;
import 'package:freelanc/features/jobofferproposalfrelancer&company/jobofferproposalfrelancer/Model/JobOfferProposalfrelancerModel.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';



class JobOfferProposalFrelancerController extends GetxController {
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
      final dio = Dio();
      final response = await dio.get(
        "${ApiEndPoint.basrurl}${ApiEndPoint.fetchJobOfferProposalsforfrelancer}",
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
        errorMessage.value = 'فشل في تحميل طلبات العرض الوظيفي';
      }
    } catch (e) {
      errorMessage.value = 'خطأ: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteJobOfferProposal(int proposalId) async {
    try {
      final response = await dio.delete(
        '${ApiEndPoint.basrurl}${ApiEndPoint.deleteJobOfferProposalfrelancer}/:${proposalId}',
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
        print('delet${response}');
        jobOfferProposals.removeWhere((proposal) => proposal.id == proposalId);
        update(); // إشعار واجهة المستخدم بالتغييرات
      }
    } catch (e) {
      print('خطأ في حذف العرض: $e');
    }
  }

  Future<void> editJobOfferProposal(int proposalId, String newMessage) async {
    try {
      final response = await dio.put(
        "${ApiEndPoint.basrurl}${ApiEndPoint.editJobOfferProposalfrelancer}",
        data: {
          'job_offer_proposal_id': proposalId,
          'message': newMessage,
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
        final index = jobOfferProposals
            .indexWhere((proposal) => proposal.id == proposalId);
        if (index != -1) {
          jobOfferProposals[index].message = newMessage;
          update(); // إشعار واجهة المستخدم بالتغييرات
        }
      }
    } catch (e) {
      print('خطأ في تعديل العرض: $e');
    }
  }

  Future<offer.JobOffer_ForcompanyOnly?> fetchJobDetails(int jobId) async {
    try {
      // قم بتنفيذ الطلب إلى الـ API هنا باستخدام jobId
      // وحلل الاستجابة لتحويلها إلى كائن من نوع JobOffer_ForcompanyOnly
      final response = await dio.get('${ApiEndPoint.basrurl}${ApiEndPoint.fetchonejoboffer}/:$jobId');

      if (response.statusCode == 200) {
        final data = response.data['data'];
        return offer.JobOffer_ForcompanyOnly.fromJson(data);
      } else {
        // إذا كانت الحالة ليست 200، اعرض رسالة خطأ
        print('Error: ${response.statusMessage}');
        return null;
      }
    } catch (e) {
      // في حالة حدوث أي استثناء، اعرض رسالة خطأ
      print('Error: $e');
      return null;
    }
  }
}
