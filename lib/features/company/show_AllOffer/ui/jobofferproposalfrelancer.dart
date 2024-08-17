import 'package:dio/dio.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:get/get.dart';

class Jobofferproposalfrelancer {
  final Dio _dio = Dio();
  MyServices myServices = Get.find();
  Future<void> submitJobOfferProposal(int jobOfferId, String message) async {
    
    // Validate message length
    if (message.length > 255) {
      throw Exception('The message must not be greater than 255 characters.');
    }

    final Map<String, dynamic> data = {
      'job_offer_id': jobOfferId,
      'message': message,
    };

    try {
      final response = await _dio.post("${ApiEndPoint.basrurl}${ApiEndPoint.submitJobOfferProposaltocompany}", data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer ${myServices.sharedpref.getString(KeyShardpref.token)}", 
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),);
      print('Response: ${response.data}');
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
