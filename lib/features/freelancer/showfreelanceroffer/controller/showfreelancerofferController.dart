import 'package:dio/dio.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/features/freelancer/showfreelanceroffer/Model/frelancerofferModel.dart';
import 'package:get/get.dart';

class FreelancerOfferController extends GetxController {
  var jobs = <FreelancerOffer>[].obs;
  var isLoading = true.obs;
  final Dio dio = Dio();
    MyServices myServices = Get.find();

  @override
  void onInit() {
    fetchJobs(null); // استدعاء fetchJobs عند تهيئة الـ controller
    super.onInit();
  }

  void fetchJobs(String? filters) async {
    try {
      isLoading(true);

      final response = await dio.post(
        "${ApiEndPoint.basrurl}${ApiEndPoint.fetchJobsfrelancer}",
        data: {"status": filters},
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
          jobs.value =
              data.map((job) => FreelancerOffer.fromJson(job)).toList();
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
  }
}
