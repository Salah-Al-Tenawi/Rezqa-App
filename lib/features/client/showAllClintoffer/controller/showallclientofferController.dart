import 'package:dio/dio.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/features/client/showClintoffer1/Model/ClintOfferModel.dart';
import 'package:get/get.dart';

class AllClintOfferController extends GetxController {
  var jobs = <ClintOffer>[].obs;
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
       "${ApiEndPoint.basrurl}${ApiEndPoint.fetchJobsclintofferforall}",
        data: {
          // "status": filters
          },
        options: Options(
          headers: {
            "Authorization": "Bearer ${myServices.sharedpref.getString(KeyShardpref.token)}", 
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
        } else if( response.data['message'] == "Unauthenticated")  {
        Get.snackbar('خطأ'," لا يمكنك الوصول للعرض" );
      }
       else  {
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
  Future<void> submitJobOfferProposal({
    required int clientOfferId,
    required String message,
    required int days,
    required int price,
  }) async {

    try {
      final response = await dio.post("${ApiEndPoint.basrurl}${ApiEndPoint.submitJobOfferProposaltoclient}",
          data: {
            "client_offer_id": clientOfferId,
            "message": message,
            "days": days,
            "price": price,
          },
          options: Options(
            headers: {
              "Authorization":
                  "Bearer ${myServices.sharedpref.getString(KeyShardpref.token)}",
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));

      if (response.statusCode == 201) {
        Get.snackbar('نجحت العملية', 'تم إرسال الطلب بنجاح');
      } else {
        Get.snackbar('فشلت العملية', 'فشل في إرسال الطلب');
      }
    } catch (e) {
      Get.snackbar('فشل', 'حدث خطأ: $e');
    }
  }
}
