import 'package:flutter/material.dart';
import 'package:freelanc/features/company/show_myoffer/controller/showoffer_mycompanyController.dart';
import 'package:freelanc/features/company/show_myoffer/model/Model_for_companyofferonly.dart';
import 'package:freelanc/features/company/show_myoffer/ui/jobOfferdetails_mycompany.dart';
import 'package:get/get.dart';

class ShowMyOfferCompany extends StatelessWidget {
  const ShowMyOfferCompany({super.key});

  @override
  Widget build(BuildContext context) {
    final Offer_For_companyOwnerController jobController =
        Get.put(Offer_For_companyOwnerController());

    return Obx(() {
      if (jobController.isLoading.value || jobController.isLoading.value) {
        return buildLoadingScreen();
      } else {
        return buildJobListScreen(context, jobController, jobController);
      }
    });
  }

  Scaffold buildLoadingScreen() {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Scaffold buildJobListScreen(
    BuildContext context,
    Offer_For_companyOwnerController jobController,
    Offer_For_companyOwnerController jobRoleController,
  ) {
    String? locationType;
    String? attendanceType;
    String? status;
    int? jobRoleId;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          buildFilterSection(
            jobRoleController: jobRoleController,
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
                'status': status,
                'job_role_id': jobRoleId,
              };
              jobController.fetchJobs(filters);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: jobController.jobs.length,
              itemBuilder: (context, index) {
                final job = jobController.jobs[index];
                return buildJobCard(context, job, jobController);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilterSection({
    required Offer_For_companyOwnerController jobRoleController,
    required String? locationType,
    required String? attendanceType,
    required String? status,
    required int? jobRoleId,
    required ValueChanged<String?> onLocationTypeChanged,
    required ValueChanged<String?> onAttendanceTypeChanged,
    required ValueChanged<String?> onStatusChanged,
    required ValueChanged<int?> onJobRoleIdChanged,
    required VoidCallback onSearchPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: locationType,
                  onChanged: onLocationTypeChanged,
                  items: [
                    const DropdownMenuItem(value: 'on-site', child: Text('On-site')),
                    const DropdownMenuItem(value: 'remote', child: Text('Remote')),
                  ],
                  decoration: const InputDecoration(labelText: 'الموقع'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: attendanceType,
                  onChanged: onAttendanceTypeChanged,
                  items: [
                    const DropdownMenuItem(
                        value: 'full-time', child: Text('Full-time')),
                    const DropdownMenuItem(
                        value: 'part-time', child: Text('Part-time')),
                    const DropdownMenuItem(value: 'intern', child: Text('Intern')),
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
                  value: status,
                  onChanged: onStatusChanged,
                  items: [
                    const DropdownMenuItem(value: 'pending', child: Text('Pending')),
                    const DropdownMenuItem(value: 'active', child: Text('Active')),
                    const DropdownMenuItem(value: 'closed', child: Text('Closed')),
                  ],
                  decoration: const InputDecoration(labelText: 'حالة العرض'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DropdownButtonFormField<int>(
                  value: jobRoleId,
                  onChanged: (int? value) {
                    onJobRoleIdChanged(value);
                    jobRoleController.selectedJobRoleId.value = value;
                  },
                  items: jobRoleController.jobRoles
                      .map((jobRole) => DropdownMenuItem<int>(
                            value: jobRole['id'],
                            child: Text(jobRole['name']),
                          ))
                      .toList(),
                  decoration: const InputDecoration(labelText: 'دور الوظيفي'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: onSearchPressed,
            child: const Icon(Icons.search, color: Colors.black),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildJobCard(BuildContext context, JobOffer_ForcompanyOnly job,
      Offer_For_companyOwnerController jobController) {
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
            buildJobCardHeader(context, job, jobController),
            const SizedBox(height: 8),
            Text(
              job.jobRole?.name ?? 'industryName',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              job.description != null && job.description!.length > 50
                  ? '${job.description!.substring(0, 50)}...'
                  : job.description ?? 'Description',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text(
                  "عرض التفاصيل ",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
                onPressed: () {
                  Get.to(JobDetails_MyCompanyonly(job: job));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildJobCardHeader(BuildContext context, JobOffer_ForcompanyOnly job,
      Offer_For_companyOwnerController jobController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Chip(
          label: Text(
            job.attendanceType ?? '',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: _getAttendanceColor(job.attendanceType ?? ''),
        ),
        Text(
          '${job.status ?? 'N/A'}',
          style: TextStyle(color: _getStatusColor(job.status), fontSize: 18),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () => editJob(job),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => deleteJob(job),
            ),
          ],
        ),
      ],
    );
  }

  void editJob(JobOffer_ForcompanyOnly job) {
    Get.defaultDialog(
      title: 'تعديل العرض',
      content: const Text('هل تريد تعديل العرض؟'),
      onConfirm: () {
        Get.back();
      },
      textConfirm: 'نعم',
    );
  }

  void deleteJob(JobOffer_ForcompanyOnly job) {
    Get.defaultDialog(
      title: 'حذف العرض',
      content: const Text('هل أنت متأكد أنك تريد حذف هذا العرض؟'),
      onConfirm: () {
        // إضافة منطق الحذف هنا
        Get.back();
        Get.snackbar('حذف', 'تم حذف العرض بنجاح');
      },
      textConfirm: 'نعم',
      textCancel: 'لا',
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

  Color _getAttendanceColor(String attendanceType) {
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
}