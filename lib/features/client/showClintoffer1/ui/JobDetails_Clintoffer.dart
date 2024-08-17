import 'package:flutter/material.dart';
import 'package:freelanc/features/client/showClintoffer1/Model/ClintOfferModel.dart';
import 'package:freelanc/features/client/showClintoffer1/controller/showclientofferController.dart';

import 'package:get/get.dart';


class JobDetails_Clint extends StatelessWidget {
  final ClintOffer job;
   final ClintOfferController offerForClintcontroller = Get.put(ClintOfferController());
  JobDetails_Clint({required this.job});

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
                        Text(
                          job.client!.username,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
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
                        _buildSkillsSection('المهارات: ', job.skills),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20), // Adding space before the button
                ],
              )));
            
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

  