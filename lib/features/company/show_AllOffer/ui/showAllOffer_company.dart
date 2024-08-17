import 'package:flutter/material.dart';
import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/features/company/show_AllOffer/controller/showoffer_AllcompanyController.dart';
import 'package:freelanc/features/company/show_AllOffer/ui/jobOfferdeatails.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// ignore: use_key_in_widget_constructors
class Jobofferallcombany extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Offer_For_AllcompanyController joballController =
        Get.put(Offer_For_AllcompanyController());

    return Obx(() {
      if (joballController.isLoading.value) {
        return  Scaffold(
          backgroundColor: Colors.white,
          body: Lottie.asset(ImagesUrl.loadingLottie2)
        );
      } else {
        return buildJobListScreen(context, joballController);
      }
    });
  }

  Scaffold buildJobListScreen(
      BuildContext context, Offer_For_AllcompanyController jobController) {
    String? locationType;
    String? attendanceType;
    String? status = 'active'; // تعيين القيمة الافتراضية كـ "active"
    int? jobRoleId;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildFilterSection(
              Offer_For_AllcompanyController: jobController,
              locationType: locationType,
              attendanceType: attendanceType,
              status: status,
              jobRoleId: jobRoleId,
              onLocationTypeChanged: (value) => locationType = value,
              onAttendanceTypeChanged: (value) => attendanceType = value,
              onStatusChanged: (value) => status = value,
              onJobRoleIdChanged: (value) => jobRoleId = value,
              onSearchPressed: () {
                Map<String, dynamic> filters = {
                  'location_type': locationType,
                  'attendance_type': attendanceType,
                  'selected_status':
                      status ?? 'active', // تعيين الحالة الافتراضية "active"
                  'job_role_id': jobRoleId,
                };
                jobController.fetchJobsWithFilters(filters);
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // This ensures the ListView doesn't scroll separately
              itemCount: jobController.jobs.length,
              itemBuilder: (context, index) {
                final job = jobController.jobs[index];
                return Card(
                  shadowColor: Colors.black,
                  color: Colors.white,
                  margin: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Chip(
                              label: Text(
                                job.attendanceType ?? 'N/A',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              backgroundColor:
                                  _getAttendanceColor(job.attendanceType),
                            ),
                            Text(
                              job.status ?? 'N/A',
                              style: TextStyle(
                                  color: _getStatusColor(job.status),
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'company : ${job.company?.name ?? 'N/A'}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          margin: const EdgeInsets.only(top: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                job.jobRole?.name ?? 'N/A',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                job.description?.substring(
                                        0,
                                        job.description!.length > 50
                                            ? 50
                                            : job.description!.length) ??
                                    'N/A',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: const Text("عرض التفاصيل ",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.blue)),
                              onPressed: () {
                                Get.to(JobDetails(
                                    job:
                                        job)); // انتقل إلى واجهة التفاصيل الجديدة
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case 'pending':
        return Colors.green;
      case 'active':
        return Colors.orange;
      case 'closed':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  Color _getAttendanceColor(String? attendanceType) {
    switch (attendanceType) {
      case 'full-time':
        return Colors.green;
      case 'part-time':
        return Colors.orange;
      case 'intern':
        return const Color.fromARGB(255, 31, 81, 106);
      default:
        return Colors.grey;
    }
  }

  Widget buildFilterSection({
    required String? locationType,
    required String? attendanceType,
    required String? status,
    required int? jobRoleId,
    required ValueChanged<String?> onLocationTypeChanged,
    required ValueChanged<String?> onAttendanceTypeChanged,
    required ValueChanged<String?> onStatusChanged,
    required ValueChanged<int?> onJobRoleIdChanged,
    required VoidCallback onSearchPressed,
    // ignore: non_constant_identifier_names
    required Offer_For_AllcompanyController Offer_For_AllcompanyController,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: locationType,
                  onChanged: onLocationTypeChanged,
                  items: const [
                    DropdownMenuItem(value: 'on-site', child: Text('On-site')),
                    DropdownMenuItem(value: 'remote', child: Text('Remote')),
                  ],
                  decoration: const InputDecoration(labelText: 'الموقع'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: attendanceType,
                  onChanged: onAttendanceTypeChanged,
                  items: const [
                    DropdownMenuItem(
                        value: 'full-time', child: Text('Full-time')),
                    DropdownMenuItem(
                        value: 'part-time', child: Text('Part-time')),
                    DropdownMenuItem(value: 'intern', child: Text('Intern')),
                  ],
                  decoration: const InputDecoration(labelText: 'نوع الدوام'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: status, // هنا سيتم استخدام القيمة الافتراضية "active"
                  onChanged: onStatusChanged,
                  items: const [
                    DropdownMenuItem(value: 'active', child: Text('Active')),
                    DropdownMenuItem(value: 'closed', child: Text('Closed')),
                  ],
                  decoration: const InputDecoration(labelText: 'الحالة'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DropdownButtonFormField<int>(
                  value:
                      jobRoleId, // تأكد من أن القيمة هنا متوافقة مع القيم في items
                  onChanged: (int? value) {
                    onJobRoleIdChanged(value);
                    Offer_For_AllcompanyController.selectedJobRoleId.value =
                        value;
                  },
                  items: Offer_For_AllcompanyController.jobRoles
                      .map((jobRole) => DropdownMenuItem<int>(
                            value: jobRole['id'],
                            child: Text(jobRole['name']),
                          ))
                      .toList(),
                  decoration:
                      const InputDecoration(labelText: 'المسمى الوظيفي'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: onSearchPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: const Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
