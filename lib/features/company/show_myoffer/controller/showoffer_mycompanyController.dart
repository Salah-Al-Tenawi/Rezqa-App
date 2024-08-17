import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/features/company/show_myoffer/model/Model_for_companyofferonly.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

// ignore: camel_case_types
class Offer_For_companyOwnerController extends GetxController {
  var jobs = <JobOffer_ForcompanyOnly>[].obs;
  var isLoading = true.obs;
  final Dio dio = Dio();
  var jobRoles = [].obs;
  var selectedJobRoleId = RxnInt();
  MyServices myServices = Get.find();
  

  void fetchJobRoles() async {
    isLoading.value = true;
    try {
      var response = await Dio().post(
        "${ApiEndPoint.basrurl}${ApiEndPoint.getjoprloe}",
        data: {"name": null},
      );
      jobRoles.value = response.data['data'];
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch job roles');
    } finally {
      isLoading.value = false;
    }
  }
  @override
  void onInit() {
     fetchJobRoles();
    fetchJobs(); 
    super.onInit();
  }

  void fetchJobs([Map<String, dynamic>? filters]) async {
    try {
      isLoading(true);

      // إضافة الهيدرز
      var response = await dio.post(
       "${ApiEndPoint.basrurl}${ApiEndPoint.fetchJobsmyoffer}",
        data: filters ?? {},
        options: Options(
          headers: {
            'Authorization': 'Bearer ${myServices.sharedpref.getString(KeyShardpref.token)}', // استبدل YOUR_AUTH_KEY بالمفتاح الفعلي
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = response.data['data'] as List;
        jobs.value = data.map((job) => JobOffer_ForcompanyOnly.fromJson(job)).toList();
      } else {
        Get.snackbar('خطأ', 'فشل في جلب العروض');
      }
    } catch (e) {
      Get.snackbar('خطأ', 'فشل في جلب العروض');
    } finally {
      isLoading(false);
    }
  }
}