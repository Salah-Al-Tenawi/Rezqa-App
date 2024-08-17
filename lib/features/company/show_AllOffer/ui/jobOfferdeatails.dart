import 'package:flutter/material.dart';
import 'package:freelanc/features/company/show_AllOffer/model/Model_forAll_companyoffer.dart';
import 'package:freelanc/features/company/show_AllOffer/ui/jobofferproposalfrelancer.dart';
import 'package:freelanc/features/profiles/controller/any_profile_controlelr.dart';
import 'package:get/get.dart';

class JobDetails extends StatelessWidget {
  final JobOfferForAllcompany job;

  JobDetails({super.key, required this.job}) {
    Get.lazyPut<AnyProfileControllerIm>(() => AnyProfileControllerIm());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل العرض'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildCompanyNameWithButton(
              'اسم الشركة:',
              job.company?.name ?? 'N/A',
            ),
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
                  _buildDetailRow('الوصف: ', job.description ?? 'N/A',
                      Icons.description, Colors.blue),
                  _buildDetailRow('نوع الدوام: ', job.attendanceType ?? 'N/A',
                      Icons.access_time, Colors.orange),
                  _buildDetailRow('الموقع: ', job.locationType ?? 'N/A',
                      Icons.location_on, Colors.red),
                  _buildDetailRow(
                      'الحد الأقصى للراتب: ',
                      job.maxSalary?.toString() ?? 'N/A',
                      Icons.attach_money,
                      Colors.deepPurple),
                  _buildDetailRow(
                      'الحد الأدنى للراتب: ',
                      job.minSalary?.toString() ?? 'N/A',
                      Icons.attach_money,
                      Colors.deepPurple),
                  _buildDetailRow(
                      'وسائل النقل: ',
                      _getTransportationText(job.transportation),
                      Icons.directions_car,
                      Colors.blue),
                  _buildDetailRow(
                      'التأمين الصحي: ',
                      _getBooleanText(job.healthInsurance),
                      Icons.local_hospital,
                      Colors.green),
                  _buildDetailRow(
                      'الخدمة العسكرية: ',
                      _getBooleanText(job.militaryService),
                      Icons.military_tech,
                      Colors.deepOrange),
                  _buildDetailRow(
                      'الحد الأقصى للعمر: ',
                      job.maxAge?.toString() ?? 'N/A',
                      Icons.calendar_today,
                      Colors.orange),
                  _buildDetailRow(
                      'الحد الأدنى للعمر: ',
                      job.minAge?.toString() ?? 'N/A',
                      Icons.calendar_today,
                      Colors.orange),
                  _buildDetailRow('الجنس: ', job.gender ?? 'لم يحدد',
                      Icons.person, Colors.purple),
                  _buildDetailRow('تصنيف العرض: ', job.industryName ?? 'N/A',
                      Icons.category, Colors.blueGrey),
                  _buildSkillsSection(
                      'المهارات المطلوبة: ', job.skills), // إضافة قسم المهارات
                ],
              ),
            ),
            const SizedBox(height: 20), // إضافة مساحة قبل الزر
            Center(
                child: ElevatedButton(
              onPressed: () async {
                String? message = await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) {
                    final TextEditingController messageController =
                        TextEditingController();
                    return AlertDialog(
                      title: const Text('أدخل رسالتك'),
                      content: TextField(
                        controller: messageController,
                        maxLength: 255,
                        decoration: const InputDecoration(
                          hintText: 'اكتب رسالتك هنا...',
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text('إلغاء'),
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Close the dialog without returning a message
                          },
                        ),
                        TextButton(
                          child: const Text('إرسال'),
                          onPressed: () {
                            Navigator.of(context).pop(messageController
                                .text); // Return the entered message
                          },
                        ),
                      ],
                    );
                  },
                );

                if (message != null && message.isNotEmpty) {
                  try {
                    final jobOfferService = Jobofferproposalfrelancer();
                    await jobOfferService.submitJobOfferProposal(
                        job.id, message);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تم تقديم الطلب بنجاح')),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('فشل في تقديم الطلب: $e')),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('تقديم طلب',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyNameWithButton(String title, String value) {
    final AnyProfileControllerIm profileController =
        Get.find<AnyProfileControllerIm>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: '$title ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      TextSpan(
                        text: '  ${value}   ',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  textDirection:
                      TextDirection.rtl, // تعيين اتجاه النص لليمين إلى اليسار
                ),
              ),
              IconButton(
                icon: const Icon(Icons.account_circle, color: Colors.blue),
                onPressed: () {
                  // وضع الإجراءات التي تريدها عند الضغط على الأيقونة هنا
                },
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                profileController.getcompany(job.company!.id);
              },
              child: const Text('زيارة بروفايل الشركة',
                  style: TextStyle(color: Colors.blue)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
      String title, String value, IconData iconData, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(width: 8.0), // تباعد بين الأيقونة والنص
          Flexible(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
                children: [
                  TextSpan(
                    text: '$title ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: value,
                  ),
                ],
              ),
              textDirection:
                  TextDirection.rtl, // تعيين اتجاه النص لليمين إلى اليسار
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            iconData,
            color: iconColor,
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection(String title, List<dynamic>? skills) {
    // تحويل قائمة المهارات إلى قائمة من كائنات Skill
    List<Skill> skillList = skills?.map((item) {
          // تأكد من أن العنصر هو Map يحتوي على البيانات الصحيحة
          if (item is Map<String, dynamic>) {
            return Skill.fromJson(item);
          } else {
            // إذا كان العنصر ليس Map، عالج الحالة وفقًا لاحتياجاتك
            throw Exception('Invalid skill data');
          }
        }).toList() ??
        [];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: '$title ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            alignment: WrapAlignment.end,
            spacing: 8.0,
            children: skillList.map((skill) {
              return Chip(
                label: Text(skill.name, textDirection: TextDirection.rtl),
                backgroundColor:
                    skill.required == true ? Colors.green : Colors.grey,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  String _getTransportationText(bool? hasTransportation) {
    return hasTransportation != null && hasTransportation ? 'يوجد' : 'لا يوجد';
  }

  String _getBooleanText(bool? value) {
    return value != null && value ? 'يوجد' : 'لا يوجد';
  }
}
