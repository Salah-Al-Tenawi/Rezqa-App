import 'package:flutter/material.dart';
import 'package:freelanc/features/client/showClintoffer1/Model/proposalModel.dart';
import 'package:freelanc/features/client/showClintoffer1/controller/showclientofferController.dart';
import 'package:freelanc/features/profiles/controller/any_profile_controlelr.dart';
import 'package:get/get.dart';

class ApplicantsListScreen extends StatelessWidget {
  final ClintOfferController jobController;
  final AnyProfileControllerIm profileController =
      Get.put(AnyProfileControllerIm());
  ApplicantsListScreen({Key? key, required this.jobController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المتقدمين'),
      ),
      body: Obx(() {
        if (jobController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (jobController.proposals.isEmpty) {
          return const Center(child: Text('لا يوجد متقدمين'));
        } else {
          return ListView.builder(
              itemCount: jobController.proposals.length,
              itemBuilder: (context, index) {
                final proposal = jobController.proposals[index];
                return Card(
                  margin: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          proposal.freelancer.username,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                proposal.message,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('السعر: ${proposal.price}'),
                                  Text('الأيام: ${proposal.days}'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                await jobController.acceptProposal(proposal.id);
                              },
                              child: const Text(
                                'قبول',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () async {
                                await jobController
                                    .rejectProposal([proposal.id]);
                              },
                              child: const Text(
                                'رفض',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                profileController
                                    .getfreelancer(proposal.freelancerId);
                                print(proposal.freelancerId);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              child: const Text(
                                'زيارة بروفايل المتقدم',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        }
      }),
    );
  }
}
