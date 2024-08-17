import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/features/freelancer/showfreelanceroffer/Model/frelancerditelsModel.dart' as details ;
import 'package:freelanc/features/freelancer/showfreelanceroffer/Model/frelancerditelsModel.dart';
import 'package:freelanc/features/freelancer/showfreelanceroffer/Model/frelancerofferModel.dart' as offer;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';




class JobDetails_Frelancer extends StatelessWidget {
  final offer.FreelancerOffer job;

  JobDetails_Frelancer({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل العرض'),
      ),
      body: FutureBuilder<details.FreelancerDetails>(
        future: fetchFreelancerDetails(job.freelancerId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data found'));
          } else {
            final freelancer = snapshot.data!;
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.only(top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          freelancer.username,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(freelancer.city),
                        SizedBox(height: 10.0),
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
                  SizedBox(height: 20), // Adding space before the button
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildDetailRow(
    String title,
    String value,
    IconData iconData,
    Color iconColor,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 8.0), // Space between the icon and the text
          Flexible(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
                children: [
                  TextSpan(
                    text: '$title ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: value,
                  ),
                ],
              ),
              textDirection: TextDirection.rtl, // Right to left text direction
            ),
          ),
          const SizedBox(width: 10),
          Icon(iconData, color: iconColor),
        ],
      ),
    );
  }

  Widget _buildSkillsSection(String title, List<offer.Skill> skills) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: '$title ',
                        style: TextStyle(
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

  Future<FreelancerDetails> fetchFreelancerDetails(int freelancerId) async {
    Dio dio = Dio();
      MyServices myServices = Get.find();

    try {
      final response = await dio.get(
        '${ApiEndPoint.basrurl}${ApiEndPoint.freelnacer}/$freelancerId',
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${myServices.sharedpref.getString(KeyShardpref.token)}",
          },
        ),
      );

      if (response.statusCode == 200) {
        return FreelancerDetails.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to load freelancer details');
      }
    } catch (e) {
      throw Exception('Failed to load freelancer details: $e');
    }
  }
}
