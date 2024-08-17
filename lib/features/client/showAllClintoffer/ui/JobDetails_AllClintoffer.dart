import 'package:flutter/material.dart';
import 'package:freelanc/features/client/showAllClintoffer/controller/showallclientofferController.dart';
import 'package:freelanc/features/client/showClintoffer1/Model/ClintOfferModel.dart';
import 'package:get/get.dart';


// ignore: camel_case_types
class JobDetails_AllClintoffer extends StatelessWidget {
  final ClintOffer job;
  final AllClintOfferController offerForClintcontroller =
      Get.put(AllClintOfferController());

  // ignore: use_key_in_widget_constructors
  JobDetails_AllClintoffer({required this.job});

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          job.client!.username,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.chat, color: Colors.green),
                        onPressed: () {
                          // اضف هنا منطق فتح شاشة الدردشة
                          print("Chat icon clicked");
                        },
                      ),
                    ],
                  ),
                  Text(job.client!.city),
                  const SizedBox(height: 10.0),
                  _buildDetailRow(
                    'الوصف: ',
                    job.description,
                    Icons.description,
                    Colors.blue,
                  ),
                  _buildDetailRow(
                    'الحد الأقصى للسعر: ',
                    job.maxPrice.toString(),
                    Icons.attach_money,
                    Colors.deepPurple,
                  ),
                  _buildDetailRow(
                    'الحد الأدنى للسعر: ',
                    job.minPrice.toString(),
                    Icons.attach_money,
                    Colors.deepPurple,
                  ),
                  _buildDetailRow(
                    '  الأيام: ',
                    job.days.toString(),
                    Icons.today,
                    Colors.deepPurple,
                  ),
                  _buildSkillsSection('المهارات: ', job.skills),
                ],
              ),
            ),
            const SizedBox(height: 20), // إضافة مساحة قبل الزر
            Center(
              child: ElevatedButton(
              onPressed: () async {
                

                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    final TextEditingController messageController =
                        TextEditingController();
                    final TextEditingController daysController =
                        TextEditingController();
                    final TextEditingController priceController =
                        TextEditingController();

                    return AlertDialog(
                      title: Text('أدخل تفاصيل الطلب'),
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextField(
                              controller: messageController,
                              maxLength: 255,
                              decoration: InputDecoration(
                                hintText: 'اكتب رسالتك هنا...',
                              ),
                            ),
                            TextField(
                              controller: daysController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'أدخل عدد الأيام...',
                              ),
                            ),
                            TextField(
                              controller: priceController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'أدخل السعر...',
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: Text('إلغاء'),
                          onPressed: () {
                            Navigator.of(context).pop(); // إغلاق الحوار
                          },
                        ),
                        TextButton(
                          child: Text('إرسال'),
                          onPressed: () async {
                            final message = messageController.text;
                            final days = int.tryParse(daysController.text) ?? 0;
                            final price =
                                int.tryParse(priceController.text) ?? 0;

                            if (message.isNotEmpty && days > 0 && price > 0) {
                              await offerForClintcontroller.submitJobOfferProposal(
                                clientOfferId: job.id,
                                message: message,
                                days: days,
                                price: price,
                              );
                              Navigator.of(context).pop();
                            } else {
                              Get.snackbar(
                                  'Error', 'يرجى ملء جميع الحقول بشكل صحيح');
                            }
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('تقديم طلب',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDetailRow(
  String title,
  String? value, // Allow nullable value
  IconData iconData,
  Color iconColor,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(width: 8.0),
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
                  text: value ?? 'N/A', // Display 'N/A' if value is null
                ),
              ],
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
        const SizedBox(width: 10),
        Icon(iconData, color: iconColor),
      ],
    ),
  );
}

Widget _buildSkillsSection(String title, List<Skill> skills) {
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

String _getTransportationText(bool? hasTransportation) {
  return hasTransportation != null && hasTransportation ? 'يوجد' : 'لا يوجد';
}

String _getBooleanText(bool? value) {
  return value != null && value ? 'يوجد' : 'لا يوجد';
}
