// ignore: file_names

import 'package:flutter/material.dart';
import 'package:freelanc/features/client/showAllClintoffer/controller/showallclientofferController.dart';
import 'package:freelanc/features/client/showAllClintoffer/ui/JobDetails_AllClintoffer.dart';
import 'package:freelanc/features/client/showClintoffer1/Model/ClintOfferModel.dart';
import 'package:get/get.dart';


// ignore: use_key_in_widget_constructors
class JobAllofferClintCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AllClintOfferController offerForClintcontroller = Get.put(AllClintOfferController());
    offerForClintcontroller.fetchJobs(null); // استدعاء fetchJobs مع تمرير null للفلتر الافتراضي

    return Obx(() {
      if (offerForClintcontroller.isLoading.value) {
        return buildLoadingScreen();
      } else {
        return buildJobListScreen(context, offerForClintcontroller);
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

  Scaffold buildJobListScreen(BuildContext context, AllClintOfferController jobController) {
    String? status = 'pending'; // تعيين القيمة الافتراضية للحالة إلى "pending"
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 20,),
          buildFilterSection(
            status: status,
            onStatusChanged: (value) => status = value,
            onSearchPressed: () {
              String? filters = status ;
              
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
         // const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: status,
                  onChanged: onStatusChanged,
                  items: const [
                    DropdownMenuItem(value: 'pending', child: Text('Pending')),
                    DropdownMenuItem(value: 'active', child: Text('Active')),
                    DropdownMenuItem(value: 'closed', child: Text('Closed')),
                  ],
                  decoration: const InputDecoration(labelText: 'حالة العرض'),
                ),
              ),
              const SizedBox(width: 8),
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

  Widget buildJobCard(BuildContext context, ClintOffer job, AllClintOfferController jobController) {
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
              job.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              job.description.length > 50
                  ? '${job.description.substring(0, 50)}...'
                  : job.description,
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
                  Get.to(() => JobDetails_AllClintoffer(job: job));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildJobCardHeader(BuildContext context, ClintOffer job, AllClintOfferController jobController) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       
        Text(
          job.status ?? 'N/A',
          style: TextStyle(color: _getStatusColor(job.status), fontSize: 18),
        ),
        Row(
          children: [
            // IconButton(
            //   icon: const Icon(Icons.edit, color: Colors.blue),
            //   onPressed: () => editJob(job),
            // ),
            // IconButton(
            //   icon: const Icon(Icons.delete, color: Colors.red),
            //   onPressed: () => deleteJob(job),
            // ),
          ],
        ),
      ],
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

}