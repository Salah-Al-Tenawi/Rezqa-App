import 'package:dio/dio.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:file_selector/file_selector.dart';

class AddClintOfferController extends GetxController {
  var title = ''.obs;
  var description = ''.obs;
  var minPrice = ''.obs;
  var maxPrice = ''.obs;
  var days = ''.obs;

  var selectedFiles = <Map<String, dynamic>>[].obs;

  var isLoading = false.obs;
  var categories = <Map<String, dynamic>>[].obs;
  var selectedSubCategoryId = Rx<int?>(null);
  var skills = <Map<String, dynamic>>[].obs;
  var selectedSkills = <Map<String, dynamic>>[].obs;
    MyServices myServices = Get.find();

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      Dio dio = Dio();
      var response = await dio.get(
        '${ApiEndPoint.basrurl}${ApiEndPoint.fetchCategoriescategory}',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.data != null && response.data['data'] != null) {
        categories.value =
            List<Map<String, dynamic>>.from(response.data['data'])
                .where((category) =>
                    category['id'] != null && category['name'] != null)
                .toList();
      }
    } catch (e) {
      print('Error fetching categories: $e');
      categories.value = [
        {
          'id': 1,
          'name': 'تصنيف 1',
          'sub_categories': [
            {'id': 1, 'name': 'فرع 1'}
          ]
        },
        {
          'id': 2,
          'name': 'تصنيف 2',
          'sub_categories': [
            {'id': 2, 'name': 'فرع 2'}
          ]
        },
      ];
    }
  }

  Future<void> fetchSkills(String? name) async {
    try {
      var dioClient = Dio();
      var response = await dioClient.post(
        "${ApiEndPoint.basrurl}${ApiEndPoint.getskilles}",
        data: {'name': name},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      if (response.data != null && response.data['data'] != null) {
        skills.value = List<Map<String, dynamic>>.from(response.data['data']
            .map((item) => {'id': item['id'], 'name': item['name']}));
        if (skills.isEmpty) {
          Get.snackbar(
            'بحث خاطئ',
            'عذراً، لم يتم العثور على مهارات بهذا الاسم.',
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            'نجاح البحث',
            'الآن قم باختيار المهارات.',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } else {
        skills.value = [];
        Get.snackbar(
          'بحث خاطئ',
          'عذراً، لم يتم العثور على مهارات بهذا الاسم.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('Error fetching skills: $e');
      skills.value = [];
      Get.snackbar(
        'خطأ في البحث',
        'حدث خطأ أثناء البحث عن المهارات.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  List<int> getSelectedSkillIds() {
    return selectedSkills.map((skill) => skill['id'] as int).toList();
  }

  Future<int?> uploadFile(String filePath) async {
    try {
      var dioClient = dio.Dio();

      var formData = dio.FormData.fromMap({
        'title': 'pibgvibmjbaix', // تأكد من تضمين جميع البيانات المطلوبة
        'file': await dio.MultipartFile.fromFile(filePath),
      });

      var response = await dioClient.post(
        "${ApiEndPoint.basrurl}${ApiEndPoint.uploadFile}",
        data: formData,
        options: dio.Options(
          headers: {
            "Authorization":
                "Bearer ${myServices.sharedpref.getString(KeyShardpref.token)}",
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 201 && response.data != null) {
        print('Upload successful: ${response.data}');
        return response.data['data']['id'];
      } else {
        print('Failed to upload file: ${response.data}');
      }
    } catch (e) {
      print('Error uploading file: $e');
    }
    return null;
  }

  Future<void> pickFiles() async {
    try {
      final typeGroup =
          XTypeGroup(label: 'documents', extensions: ['pdf', 'doc', 'docx']);
      final files = await openFiles(acceptedTypeGroups: [typeGroup]);

      for (final file in files) {
        final filePath = file.path;
        final fileId = await uploadFile(filePath);
        if (fileId != null) {
          selectedFiles.add({
            'id': fileId,
            'name': file.name
          }); // تعديل هنا لإضافة معرف واسم الملف
        } else {
          Get.snackbar(
            'خطأ في رفع الملفات',
            'حدث خطأ أثناء رفع الملف: ${file.name}',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    } catch (e) {
      print('Error picking files: $e');
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء اختيار الملفات. يرجى المحاولة مرة أخرى.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> submitOffer() async {
    var skillIds = getSelectedSkillIds();
    var subCategoryId = selectedSubCategoryId.value;
    if (selectedSkills.length < 5) {
      Get.snackbar(
        'خطأ في الإدخال',
        'يجب اختيار 5 مهارات على الأقل.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      isLoading.value = true;

      // إعداد Dio مع BaseOptions
      BaseOptions options = BaseOptions(
        followRedirects: true,
        maxRedirects: 5,
        validateStatus: (status) {
          return status != null && status < 500;
        },
      );

      Dio dioClient = Dio(options);

      // تجهيز بيانات الطلب
      var data = {
        'sub_category_id': subCategoryId, // تأكد من استخدام المفتاح الصحيح هنا
        'title': title.value,
        'description': description.value,
        'min_price': int.tryParse(minPrice.value),
        'max_price': int.tryParse(maxPrice.value),
        'days': int.tryParse(days.value),
        'skill_ids': skillIds,
        'file_ids': selectedFiles.map((file) => file['id']).toList(),
      };

      // طباعة البيانات للتأكد منها
      print('Sending data: $data');

      var response = await dioClient.post(
        "${ApiEndPoint.basrurl}${ApiEndPoint.submitOfferclient}",
        data: data,
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${myServices.sharedpref.getString(KeyShardpref.token)}",
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      // طباعة الرد للتأكد منه
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 201) {
        Get.snackbar(
          'تم إرسال العرض',
          'تم إرسال العرض بنجاح',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (response.statusCode == 307) {
        // التعامل مع إعادة التوجيه
        String? redirectUrl = response.headers.value('location');
        if (redirectUrl != null) {
          var redirectResponse = await dioClient.post(
            redirectUrl,
            data: data,
            options: Options(
              headers: {
                "Authorization":
                    "Bearer ${myServices.sharedpref.getString(KeyShardpref.token)}",
                'Content-Type': 'application/json',
                'Accept': 'application/json',
              },
            ),
          );

          // طباعة الرد للتأكد منه
          print('Redirect response status: ${redirectResponse.statusCode}');
          print('Redirect response data: ${redirectResponse.data}');

          if (redirectResponse.statusCode == 201) {
            Get.snackbar(
              'تم إرسال العرض',
              'تم إرسال العرض بنجاح!',
              snackPosition: SnackPosition.BOTTOM,
            );
          } else {
            Get.snackbar(
              'خطأ في الإرسال',
              'حدث خطأ أثناء إرسال العرض. يرجى المحاولة مرة أخرى.',
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        }
      } else {
        Get.snackbar(
          'خطأ في الإرسال',
          'حدث خطأ أثناء إرسال العرض. يرجى المحاولة مرة أخرى.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('Error submitting offer: $e');
      Get.snackbar(
        'خطأ في الإرسال',
        'حدث خطأ أثناء إرسال العرض. يرجى المحاولة مرة أخرى.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
