import 'package:dio/dio.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/features/company/show_AllOffer/model/Model_forAll_companyoffer.dart';
import 'package:get/get.dart';

class Offer_For_AllcompanyController extends GetxController {
  var jobs = <JobOfferForAllcompany>[].obs;
  var isLoading = true.obs;
  final Dio dio = Dio();
  var jobRoles = [].obs;
  var selectedJobRoleId = RxnInt();
  MyServices myServices = Get.find();

  void fetchJobRoles() async {
    isLoading.value = true;
    try {
      var response = await dio.post(
        "${ApiEndPoint.basrurl}${ApiEndPoint.getjoprloe}",
        data: {"name": null},
      );
      print(response.data); // تحقق من البيانات
      jobRoles.value = (response.data['data'] as List)
          .map((jobRole) => {
                'id': jobRole['id'],
                'name': jobRole['name'],
              })
          .toList();
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed to fetch job roles');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchJobRoles();
    fetchJobsWithFilters();
    super.onInit();
  }

  void fetchJobsWithFilters([Map<String, dynamic>? filters]) async {
    try {
      isLoading(true);

      var response = await dio.post(
        "${ApiEndPoint.basrurl}${ApiEndPoint.fetchonejoboffer}",
        data: filters ?? {},
      );

      print(response.data); // طباعة الاستجابة للتحقق من البيانات

      if (response.statusCode == 200) {
        var data = response.data['data'] as List;
        jobs.value =
            data.map((job) => JobOfferForAllcompany.fromJson(job)).toList();
      } else {
        Get.snackbar('خطأ', 'فشل في جلب العروض');
      }
    } catch (e) {
      print(e); // طباعة الخطأ للتحقق مما يحدث
      Get.snackbar('خطأ', 'فشل في جلب العروض');
    } finally {
      isLoading(false);
    }
  }
}
