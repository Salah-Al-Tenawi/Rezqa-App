import 'package:dio/dio.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/features/client/showClintoffer1/Model/proposalModel.dart';

import 'package:get/get.dart';

import '../Model/ClintOfferModel.dart';

class ClintOfferController extends GetxController {
  var jobs = <ClintOffer>[].obs;
  var proposals = <Proposal>[].obs;
  var isLoading = true.obs;
  final Dio dio = Dio();
  MyServices myServices = Get.find();

  @override
  void onInit() {
    fetchJobs(null); // استدعاء fetchJobs عند تهيئة الـ controller
    super.onInit();
  }

  Future<ClintOffer?> fetchJobs(String? filters) async {
    try {
      isLoading(true);

      final response = await dio.post(
        "${ApiEndPoint.basrurl}${ApiEndPoint.fetchJobsmyclintoffer}",
        data: {
          // "status": filters
        },
        options: Options(
          headers: {
            ApiKey.authorization:
                "Bearer ${myServices.sharedpref.getString(KeyShardpref.token)}",
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = response.data['data'] as List?;
        if (data != null) {
          jobs.value = data.map((job) => ClintOffer.fromJson(job)).toList();
        }
      } else if (response.data['message'] == "Unauthenticated") {
        Get.snackbar('خطأ', " لا يمكنك الوصول للعرض");
      } else {
        Get.snackbar('خطأ', 'فشل في جلب العروض');
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('خطأ', 'فشل في جلب العروض');
    } finally {
      isLoading(false);
    }
    return null;
  }

  Future<void> fetchProposals(int clientOfferId,
      {int orderByPrice = 1, int orderByDays = 0}) async {
    try {
      isLoading(true);
      final response = await dio.post(
        "${ApiEndPoint.basrurl}${ApiEndPoint.fetchProposalsforclient}",
        data: {
          "client_offer_id": clientOfferId,
          "orderByPrice": orderByPrice,
          "orderByDays": orderByDays,
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
        var data = response.data['data'] as List?;
        if (data != null) {
          proposals.value = data
              .map((proposalJson) => Proposal.fromJson(proposalJson))
              .toList();
        }
      } else {
        Get.snackbar('خطأ', 'فشل في جلب المتقدمين');
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('خطأ', 'فشل في جلب المتقدمين');
    } finally {
      isLoading(false);
    }
  }

  Future<void> acceptProposal(int proposalId) async {
    try {
      final response = await dio.post(
        "${ApiEndPoint.basrurl}${ApiEndPoint.clientacceptProposal}",
        data: {"proposal_id": proposalId},
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
        Get.snackbar('نجاح', 'تم قبول العرض بنجاح');
      } else {
        Get.snackbar('خطأ', 'فشل في قبول العرض');
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('خطأ', 'حدث خطأ أثناء قبول العرض');
    }
  }

  // تابع رفض العرض
  Future<void> rejectProposal(List<int> proposalIds) async {
    try {
      final response = await dio.post(
        "${ApiEndPoint.basrurl}${ApiEndPoint.clientrejectProposal}",
        data: {"proposal_ids": proposalIds},
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
      } else {
        Get.snackbar('خطأ', 'فشل في رفض العرض');
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('خطأ', 'حدث خطأ أثناء رفض العرض');
    }
  }
}
