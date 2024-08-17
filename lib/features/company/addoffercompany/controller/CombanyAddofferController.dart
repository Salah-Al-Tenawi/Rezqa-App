import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:get/get.dart';

class Skill {
  String id;
  String name;
  bool required;

  Skill({required this.id, required this.name, this.required = false});

  Map<String, dynamic> toJson() {
    return {'id': id, 'required': required};
  }
}

class JobRole {
  final int id;
  final String name;

  JobRole({required this.id, required this.name});
}

class CompanyOfferController extends GetxController {
  late TextEditingController offerDesController;
  MyServices myServices = Get.find();
  late int jobrole = 0.obs as int;
  RxString _attendencetype = ''.obs;
  RxString _locationtype = ''.obs;
  var minsalary = 500000.obs;
  var maxsalary = 500000.obs;
  RxBool _transport = false.obs;
  RxBool _health = false.obs;
  var minage = 30.obs;
  var maxage = 30.obs;
  RxBool _militaryserver = true.obs;
  RxString _gender = ''.obs;
  RxString _offerdes = ''.obs;
  RxList<String> _skills = <String>[].obs;
  RxList<Skill> selectedSkills = <Skill>[].obs;
  RxList<Skill> essentialSkills = <Skill>[].obs;
  var jobRoles = <JobRole>[].obs;
  var selectedJobRole = Rxn<JobRole>();
  var categories = <String>[].obs;
  var selectedCategory = ''.obs;
  RxString _selectedCategory = ''.obs;
  var isLoading = false.obs; // متغير للتحكم في حالة التحميل
  RxBool _GenderRequired = false.obs; // متغير جديد لإلزام الجنس
  RxBool _militaryserverRequired = false.obs;
  RxBool _agerequired = false.obs;

  RxMap<String, bool> _essentialSkillStatus = <String, bool>{}.obs;

  String get attendencetype => _attendencetype.value;
  String get locationtype => _locationtype.value;
  bool get transport => _transport.value;
  bool get health => _health.value;
  bool get militaryserver => _militaryserver.value;
  String get gender => _gender.value;
  List<String> get skills => _skills;

  // ignore: non_constant_identifier_names
  bool get GenderRequired => _GenderRequired.value;
  // ignore: non_constant_identifier_names
  bool get MilitaryserverRequired => _militaryserverRequired.value;
  bool get AgeRequired => _agerequired.value;

  @override
  void onInit() {
    offerDesController = TextEditingController();

    fetchCategories;
    onSkillsSelected;

    onOfferDesChanged;
    onAgeRequiredChanged;
    onMilitaryRequiredChanged;
    onGenderRequiredChanged;
    onCategorySelected;
    onMilitarySelected;
    onHealthSelected;
    onTransportSelected;
    onattendencetypeSelected;
    onlocationtypeSelected;
    onGenderSelected;
    fetchSkills(null);
    super.onInit();
    fetchCategories();
  }

  @override
  void onClose() {
    offerDesController.dispose();
    super.onClose();
  }

  void onSkillsSelected(List<String> skills) {
    selectedSkills.value = skills.map((skill) {
      var parts = skill.split(':');
      return Skill(id: parts[0], name: parts[1]);
    }).toList();
    print(selectedSkills.map((skill) => skill.toJson()).toList());
  }

  void onEssentialSkillsSelected(List<String> essentialIds) {
    for (var skill in selectedSkills) {
      skill.required = essentialIds.contains(skill.id);
    }
    print("1${selectedSkills.map((skill) => skill.toJson()).toList()}");
  }

  bool isEssential(String skill) {
    return essentialSkills
        .any((element) => element.id == skill && element.required);
  }

  void setEssential(String skill, bool value) {
    var skillItem = selectedSkills.firstWhere((element) => element.id == skill);
    skillItem.required = value;
    if (value) {
      essentialSkills.add(skillItem);
    } else {
      essentialSkills.remove(skillItem);
    }
    print('2${essentialSkills.map((skill) => skill.toJson()).toList()}');
  }

  void onOfferDesChanged(String offerdes) {
    _offerdes.value = offerdes;
    print(_offerdes.value);
  }

  void onGenderSelected(String gendertype) {
    _gender.value = gendertype;
    print(_gender.value);
  }

  void onattendencetypeSelected(String workplace) {
    _attendencetype.value = workplace;
    print(_attendencetype.value);
  }

  void onlocationtypeSelected(String jobType) {
    _locationtype.value = jobType;
    print(_locationtype.value);
  }

  void onTransportSelected(bool transport) {
    _transport.value = transport;
    print(_transport.value);
  }

  void onHealthSelected(bool health) {
    _health.value = health;
    print(_health.value);
  }

  void onMilitarySelected(bool military) {
    _militaryserver.value = military;
    print(_militaryserver.value);
  }

  void onCategorySelected(String newCategory) {
    selectedCategory.value = newCategory;
  }

  void onGenderRequiredChanged(bool value) {
    _GenderRequired.value = value;
    print(_GenderRequired.value);
  }

  void onMilitaryRequiredChanged(bool value) {
    _militaryserverRequired.value = value;
    print(_militaryserverRequired.value);
  }

  void onAgeRequiredChanged(bool value) {
    _agerequired.value = value;
    print(_agerequired.value);
  }

  Future<void> fetchCategories() async {
    try {
      var dio = Dio();
      var response = await dio.post(
        ApiEndPoint.getallinustry,
        data: {'name': null},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      if (response.data != null && response.data['data'] != null) {
        categories.value = List<String>.from(
            response.data['data'].map((item) => item['name'].toString()));
        print('Fetched categories: ${categories.value}');
      }
    } catch (e) {
      print('Error fetching categories: $e');
      // إضافة تصنيفات وهمية في حال فشل الاتصال بالسيرفر
      categories.value = ['تصنيف 1', 'تصنيف 2', 'تصنيف 3'];
      print('Using default categories: ${categories.value}');
    }
  }

  Future<void> fetchJobRoles(String? name) async {
    try {
      var dio = Dio();
      var response = await dio.post(
        "${ApiEndPoint.basrurl}${ApiEndPoint.getjoprloe}",
        data: {'name': name},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      if (response.data != null && response.data['data'] != null) {
        jobRoles.value = List<JobRole>.from(
          response.data['data']
              .map((item) => JobRole(id: item['id'], name: item['name'])),
        );
        if (!jobRoles.contains(selectedJobRole.value)) {
          selectedJobRole.value = null;
        }
      } else {
        jobRoles.value = [];
        selectedJobRole.value = null;
      }
    } catch (e) {
      print('Error fetching job roles: $e');
      jobRoles.value = [];
      selectedJobRole.value = null;
    }
  }

  void selectJobRole(JobRole? role) {
    selectedJobRole.value = role;
    if (role != null) {
      jobrole = role.id;
    }
  }

  Future<void> fetchSkills(String? name) async {
    try {
      var dio = Dio();
      var response = await dio.post(
        ApiEndPoint.getskilles,
        data: {'name': name},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      if (response.data != null && response.data['data'] != null) {
        _skills.value = List<String>.from(response.data['data']
            .map((item) => '${item['id']}:${item['name']}'));
        if (_skills.value.isEmpty) {
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
        _skills.value = [];
        Get.snackbar(
          'بحث خاطئ',
          'عذراً، لم يتم العثور على مهارات بهذا الاسم.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('Error fetching skills: $e');
      _skills.value = [];
      Get.snackbar(
        'خطأ في البحث',
        'حدث خطأ أثناء البحث عن المهارات.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> sendData() async {
    isLoading.value = true;
    try {
      var dio = Dio();
      var response = await dio.post(
        "${ApiEndPoint.basrurl}${ApiEndPoint.sendjoboffer}",
        data: {
          'industry_name': selectedCategory.value,
          'job_role_id': jobrole,
          'location_type': locationtype,
          'attendence_type': attendencetype,
          'max_salary': maxsalary.value,
          'min_salary': minsalary.value,
          'max_age': maxage.value,
          'min_age': minage.value,
          'description': _offerdes.value,
          'transportation': transport,
          'health_insurance': health,
          'military_service': militaryserver,
          'gender': gender,
          'skills': selectedSkills.map((skill) => skill.toJson()).toList(),
          'gender_required': GenderRequired,
          'military_service_required': MilitaryserverRequired,
          'age_required': AgeRequired
        },
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${myServices.sharedpref.getString(KeyShardpref.token)}',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      print('Response: ${response.data}');
      if (response.data['data'] != null) {
        //JobOffer job = JobOffer.fromJson(response.data['data']);
        // يمكنك استخدام الـ job كما تحتاج
      }
    } catch (e) {
      if (e is DioException) {
        print('Error: ${e.response?.statusCode}');
        print('Error details: ${e.response?.data}');
      } else {
        print('Error: $e');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
