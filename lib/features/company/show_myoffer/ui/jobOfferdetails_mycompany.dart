import 'package:flutter/material.dart';
import 'package:freelanc/features/company/show_myoffer/model/Model_for_companyofferonly.dart'as offer;


// ignore: camel_case_types
class JobDetails_MyCompanyonly extends StatelessWidget {
  final offer.JobOffer_ForcompanyOnly job;

  const JobDetails_MyCompanyonly({super.key, required this.job});

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
                'اسم الشركة:', job.company?.name ?? 'N/A'),
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
                  _buildDetailRow('الوصف: ', job.description ?? '',
                      Icons.description, Colors.blue),
                  _buildDetailRow('نوع الدوام: ', job.attendanceType ?? '',
                      Icons.access_time, Colors.orange),
                  _buildDetailRow('الموقع: ', job.locationType ?? '',
                      Icons.location_on, Colors.red),
                  _buildDetailRow(
                      'الحد الأقصى للراتب: ',
                      job.maxSalary.toString(),
                      Icons.attach_money,
                      Colors.deepPurple),
                  _buildDetailRow(
                      'الحد الأدنى للراتب: ',
                      job.minSalary.toString(),
                      Icons.attach_money,
                      Colors.deepPurple),
                  _buildDetailRow(
                      'وسائل النقل: ',
                      _getTransportationText(job.transportation as bool?),
                      Icons.directions_car,
                      Colors.blue),
                  _buildDetailRow(
                      'التأمين الصحي: ',
                      _getBooleanText(job.healthInsurance as bool?),
                      Icons.local_hospital,
                      Colors.green),
                  _buildDetailRow(
                      'الخدمة العسكرية: ',
                      _getBooleanText(job.militaryService as bool?),
                      Icons.military_tech,
                      Colors.deepOrange),
                  _buildDetailRow('الحد الأقصى للعمر: ', job.maxAge.toString(),
                      Icons.calendar_today, Colors.orange),
                  _buildDetailRow('الحد الأدنى للعمر: ', job.minAge.toString(),
                      Icons.calendar_today, Colors.orange),
                  _buildDetailRow('الجنس: ', job.gender ?? 'لم يحدد',
                      Icons.person, Colors.purple),
                  _buildDetailRow('تصنيف العرض: ', job.industryName ?? '',
                      Icons.category, Colors.blueGrey),
                  if (job.skills != null && job.skills!.isNotEmpty)
                    _buildSkillsSection('المهارات المطلوبة: ', job.skills!)
                  else
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Text('لا توجد مهارات محددة'),
                    ), // إضافة قسم المهارات
                ],
              ),
            ),
            const SizedBox(height: 20), // إضافة مساحة قبل الزر
          ],
        ),
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
  Widget _buildCompanyNameWithButton(String title, String value) {
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
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: TextButton(
          //     onPressed: () {
          //       // وضع الإجراءات التي تريدها عند الضغط على زر زيارة بروفايل الشركة هنا
          //     },
          //     child: Text('زيارة بروفايل الشركة',
          //         style: TextStyle(color: Colors.blue)),
          //   ),
          // ),
        ],
      ),
    );
  }
  Widget _buildSkillsSection(
    String title,
    List<offer.Skill> skills,
  ) {
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
                  textDirection:
                      TextDirection.rtl, // Right to left text direction
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            alignment: WrapAlignment.end, // Right to left wrap alignment
            spacing: 8.0,
            children: skills.map((skill) {
              return Chip(
                label: Text(
                  skill.name, // Displaying skill name instead of id
                  textDirection: TextDirection.rtl,
                ),
                backgroundColor:
                    skill.name.isNotEmpty ? Colors.green : Colors.grey,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

String _getTransportationText(bool? hasTransportation) {
  return hasTransportation != null && hasTransportation ? 'يوجد' : 'لا يوجد';
}

String _getBooleanText(bool? value) {
  return value != null && value ? 'يوجد' : 'لا يوجد';
}
