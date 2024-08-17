class JobOfferProposal {
  final int id;
  final int freelancerId;
  final int jobOfferId;
  final DateTime? rejectedAt;
  final DateTime? acceptedAt;
  late final String message;
  final DateTime updatedAt;
  final DateTime createdAt;

  JobOfferProposal({
    required this.id,
    required this.freelancerId,
    required this.jobOfferId,
    required this.rejectedAt,
    required this.acceptedAt,
    required this.message,
    required this.updatedAt,
    required this.createdAt,
  });

  factory JobOfferProposal.fromJson(Map<String, dynamic> json) {
    return JobOfferProposal(
      id: json['id'],
      freelancerId: json['freelancer_id'],
      jobOfferId: json['job_offer_id'],
      rejectedAt: json['rejected_at'] != null ? DateTime.parse(json['rejected_at']) : null,
      acceptedAt: json['accepted_at'] != null ? DateTime.parse(json['accepted_at']) : null,
      message: json['message'] ?? 'No message provided', // هنا نتأكد من أن `message` ليست null
      updatedAt: DateTime.parse(json['updated_at']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}


class JobOfferProposalResponse {
  final List<JobOfferProposal> data;
  
  JobOfferProposalResponse({
    required this.data,
   
  });

  factory JobOfferProposalResponse.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<JobOfferProposal> jobOffers = dataList.map((i) => JobOfferProposal.fromJson(i)).toList();

    return JobOfferProposalResponse(
      data: jobOffers,
      
    );
  }
}
