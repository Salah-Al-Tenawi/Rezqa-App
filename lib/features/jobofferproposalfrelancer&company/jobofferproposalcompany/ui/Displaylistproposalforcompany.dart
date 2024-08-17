import 'package:flutter/material.dart';
import 'package:freelanc/features/jobofferproposalfrelancer&company/jobofferproposalcompany/controller/JobOfferProposalCompanyController.dart';
import 'package:freelanc/features/profiles/controller/any_profile_controlelr.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class JobOfferProposalCompanyPage extends StatelessWidget {
  final JobOfferProposalCompanyController controller =
      Get.put(JobOfferProposalCompanyController());
  final AnyProfileControllerIm profileController =
      Get.find<AnyProfileControllerIm>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المتقدمين لعروضي'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else if (controller.jobOfferProposals.isEmpty) {
          return const Center(child: Text('لم يتم العثور على متقدمين'));
        } else {
          return ListView.builder(
            itemCount: controller.jobOfferProposals.length,
            itemBuilder: (context, index) {
              final proposal = controller.jobOfferProposals[index];

              return Card(
                margin: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(proposal.message),
                      ),
                      const SizedBox(height: 10),
                      Text('تاريخ التحديث: ${_formatDate(proposal.updatedAt)}'),
                      Text('تاريخ الإنشاء: ${_formatDate(proposal.createdAt)}'),
                      const SizedBox(height: 10),
                      Text(
                        'الحالة: ${proposal.acceptedAt != null ? "تم القبول في ${_formatDate(proposal.acceptedAt!)}" : "لم يقبل"} / ${proposal.rejectedAt != null ? "تم الرفض في ${_formatDate(proposal.rejectedAt!)}" : "لم يرفض"}',
                        style: const TextStyle(color: Colors.redAccent),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: const Text("رفض",
                                style: TextStyle(color: Colors.red)),
                            onPressed: () async {
                              await controller.rejectProposal(proposal.id);
                            },
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            child: const Text("قبول",
                                style: TextStyle(color: Colors.green)),
                            onPressed: () async {
                              await controller.acceptProposal(proposal.id);
                            },
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            child: const Text("زيارة بروفايل المتقدم",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.blue)),
                            onPressed: () async {profileController.getfreelancer(proposal.freelancerId);},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date.toLocal());
  }
}
