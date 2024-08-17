class ClintOffer {
  final int id;
  final int clientId;
  final Client? client; // تعديل هنا لجعل client nullable
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
  final SubCategory? subCategory; // تعديل هنا لجعل subCategory nullable

  ClintOffer({
    required this.id,
    required this.clientId,
    this.client,
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
    this.subCategory,
  });

  factory ClintOffer.fromJson(Map<String, dynamic> json) {
    return ClintOffer(
      id: json['id'],
      clientId: json['client_id'],
      client: json['client'] != null ? Client.fromJson(json['client']) : null, // التحقق من null
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
      subCategory: json['sub_category'] != null ? SubCategory.fromJson(json['sub_category']) : null, // التحقق من null
    );
  }
}


class Client {
  final int id;
  final String username;
  final String gender;
  final String city;
  final String dateOfBirth;
  final int? profileImageId;
  final int? backgroundImageId;
  final String? profileImageUrl;
  final String? backgroundImageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  Client({
    required this.id,
    required this.username,
    required this.gender,
    required this.city,
    required this.dateOfBirth,
    this.profileImageId,
    this.backgroundImageId,
    this.profileImageUrl,
    this.backgroundImageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      username: json['username'],
      gender: json['gender'],
      city: json['city'],
      dateOfBirth: json['date_of_birth'],
      profileImageId: json['profile_image_id'],
      backgroundImageId: json['background_image_id'],
      profileImageUrl: json['profile_image_url'],
      backgroundImageUrl: json['background_image_url'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final int roleId;
  final String role;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.roleId,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      username: json['username'],
      email: json['email'],
      roleId: json['role_id'],
      role: json['role'],
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
