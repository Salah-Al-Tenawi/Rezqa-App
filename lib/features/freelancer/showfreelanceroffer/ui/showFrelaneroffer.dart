import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freelanc/features/freelancer/showfreelanceroffer/Model/frelancerofferModel.dart';
import 'package:freelanc/features/freelancer/showfreelanceroffer/controller/showfreelancerofferController.dart';
import 'package:freelanc/features/freelancer/showfreelanceroffer/ui/jobditelsforFreelancer.dart';
import 'package:get/get.dart';



class JobFrelancerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FreelancerOfferController offerForFrelancercontroller = Get.put(FreelancerOfferController());
    offerForFrelancercontroller.fetchJobs(null); // استدعاء fetchJobs مع تمرير null للفلتر الافتراضي

    return Obx(() {
      if (offerForFrelancercontroller.isLoading.value) {
        return buildLoadingScreen();
      } else {
        return buildJobListScreen(context, offerForFrelancercontroller);
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

  Scaffold buildJobListScreen(BuildContext context, FreelancerOfferController jobController) {
    String? status = 'pending'; // تعيين القيمة الافتراضية للحالة إلى "pending"
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 20,),
          buildFilterSection(
            status: status,
            onStatusChanged: (value) => status = value,
            onSearchPressed: () {
          String? filters =  status;
             
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
    String? status,
    required ValueChanged<String?> onStatusChanged,
    required VoidCallback onSearchPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: status,
                  onChanged: onStatusChanged,
                  items: [
                    DropdownMenuItem(value: 'pending', child: Text('Pending')),
                    DropdownMenuItem(value: 'active', child: Text('Active')),
                    DropdownMenuItem(value: 'closed', child: Text('Closed')),
                  ],
                  decoration: InputDecoration(labelText: 'حالة العرض'),
                ),
              ),
              SizedBox(width: 8),
            ],
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: onSearchPressed,
            child: Icon(Icons.search, color: Colors.black),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildJobCard(BuildContext context, FreelancerOffer job, FreelancerOfferController jobController) {
    return Card(
      shadowColor: Colors.black,
      color: Colors.white,
      margin: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildJobCardHeader(context, job, jobController),
            SizedBox(height: 8),
            Text(
              job.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 8),
            Text(
              job.description.length > 50
                  ? '${job.description.substring(0, 50)}...'
                  : job.description,
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  "عرض التفاصيل ",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
                onPressed: () {
                  Get.to(() => JobDetails_Frelancer(job: job));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildJobCardHeader(BuildContext context, FreelancerOffer job, FreelancerOfferController jobController) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       
        Text(
          '${job.status ?? 'N/A'}',
          style: TextStyle(color: _getStatusColor(job.status), fontSize: 18),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit, color: Colors.blue),
              onPressed: () => editJob(job),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => deleteJob(job),
            ),
          ],
        ),
      ],
    );
  }

  void editJob(FreelancerOffer job) {
    Get.defaultDialog(
      title: 'تعديل العرض',
      content: Text('هل تريد تعديل العرض؟'),
      onConfirm: () {
        Get.back();
      },
      textConfirm: 'نعم',
    );
  }

  void deleteJob(FreelancerOffer job) {
    Get.defaultDialog(
      title: 'حذف العرض',
      content: Text('هل أنت متأكد أنك تريد حذف هذا العرض؟'),
      onConfirm: () async {
        Dio dio = Dio();
        try {
          var response = await dio.delete(
            'https://freelancer-l1w8.onrender.com/api/freelancer-offer/freelancer/:${job.freelancerId}',
            options: Options(
              headers: {
                "Authorization": "2|QLZPCxBY5GfivPoCf9Eh32nTa6XO2HFtQ3TMp56S5d61b953",
                'Content-Type': 'application/json',
                'Accept': 'application/json',
              },
            ),
          );

          if (response.statusCode == 200) {
            Get.back();
            Get.snackbar('حذف', 'تم حذف العرض بنجاح');
          } else {
            Get.snackbar('خطأ', 'فشل في حذف العرض');
          }
        } catch (e) {
          Get.snackbar('خطأ', 'حدث خطأ أثناء محاولة حذف العرض');
        }
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
        return Color.fromARGB(255, 31, 81, 106);
      default:
        return Colors.grey;
    }
  }
}