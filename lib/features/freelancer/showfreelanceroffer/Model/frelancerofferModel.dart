class FreelancerOffer {
  final int id;
  final int freelancerId;
  final String title;
  final String description;
  final String? status;
  final int minPrice;
  final int maxPrice;
  final int days;
  final int proposalsCount;
  final DateTime? postedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Skill> skills;
  final SubCategory subCategory;

  FreelancerOffer({
    required this.id,
    required this.freelancerId,
    required this.title,
    required this.description,
    this.status,
    required this.minPrice,
    required this.maxPrice,
    required this.days,
    required this.proposalsCount,
    this.postedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.skills,
    required this.subCategory,
  });

  factory FreelancerOffer.fromJson(Map<String, dynamic> json) {
    return FreelancerOffer(
      id: json['id'],
      freelancerId: json['freelancer_id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      minPrice: json['min_price'],
      maxPrice: json['max_price'],
      days: json['days'],
      proposalsCount: json['proposals_count'],
      postedAt: json['posted_at'] != null ? DateTime.parse(json['posted_at']) : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      skills: (json['skills'] as List).map((skillJson) => Skill.fromJson(skillJson)).toList(),
      subCategory: SubCategory.fromJson(json['sub_category']),
    );
  }
}

class Skill {
  final int id;
  final String name;
  final bool? required;

  Skill({
    required this.id,
    required this.name,
    this.required,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json['id'],
      name: json['name'],
      required: json['required'],
    );
  }
}

class SubCategory {
  final int id;
  final String name;
  final int categoryId;

  SubCategory({
    required this.id,
    required this.name,
    required this.categoryId,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      name: json['name'],
      categoryId: json['category_id'],
    );
  }
}
