import 'package:flutter/material.dart';
import 'package:freelanc/features/company/show_myoffer/ui/jobOfferdetails_mycompany.dart';
import 'package:freelanc/features/jobofferproposalfrelancer&company/jobofferproposalfrelancer/controller/JobOfferProposalController.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';


class JobOfferProposalFrelancerPage extends StatelessWidget {
  final JobOfferProposalFrelancerController controller =
      Get.put(JobOfferProposalFrelancerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('العروض المقدم عليها'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else if (controller.jobOfferProposals.isEmpty) {
          return const Center(child: Text('لم يتم العثور على عروض عمل'));
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () async {
                                  // منطق التعديل
                                  final newMessage = await _showEditDialog(
                                      context, proposal.message);
                                  if (newMessage != null) {
                                    controller.editJobOfferProposal(
                                        proposal.id, newMessage);
                                  }
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () async {
                                  // منطق الحذف
                                  final confirm =
                                      await _showDeleteConfirmDialog(context);
                                  if (confirm == true) {
                                    controller.deleteJobOfferProposal(proposal.id);
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
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
                      // النص المعدل لعرض الحالة
                      Text(
                        'الحالة: ${proposal.acceptedAt != null ? "تم القبول في ${_formatDate(proposal.acceptedAt!)}" : "لم يقبل"} / ${proposal.rejectedAt != null ? "تم الرفض في ${_formatDate(proposal.rejectedAt!)}" : "لم يرفض"}',
                        style: const TextStyle(color: Colors.redAccent),
                      ),

                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: const Text("عرض التفاصيل ",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.blue)),
                            onPressed: () async {
                              final jobDetails =
                                  await controller.fetchJobDetails(proposal.jobOfferId);
                              if (jobDetails != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        JobDetails_MyCompanyonly(
                                      job: jobDetails,
                                    ),
                                  ),
                                );
                              } // انتقل إلى واجهة التفاصيل الجديدة
                            },
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

  Future<String?> _showEditDialog(
      BuildContext context, String currentMessage) async {
    final TextEditingController controller =
        TextEditingController(text: currentMessage);
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('تعديل الرسالة'),
          content: TextField(
            controller: controller,
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('إلغاء'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(controller.text),
              child: const Text('حفظ'),
            ),
          ],
        );
      },
    );
  }

  Future<Object> _showDeleteConfirmDialog(BuildContext context) async {
    return showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('حذف العرض'),
              content: const Text('هل أنت متأكد أنك تريد حذف هذا العرض؟'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('إلغاء'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('حذف'),
                ),
              ],
            );
          },
        );
  }
}
