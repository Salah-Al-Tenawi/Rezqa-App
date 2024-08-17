class Proposal {
  final int id;
  final int freelancerId;
  final Freelancer freelancer;
  final int clientId;
  final int clientOfferId;
  final String message;
  final int days;
  final double price;
  final DateTime? acceptedAt;
  final DateTime? rejectedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Proposal({
    required this.id,
    required this.freelancerId,
    required this.freelancer,
    required this.clientId,
    required this.clientOfferId,
    required this.message,
    required this.days,
    required this.price,
    this.acceptedAt,
    this.rejectedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Proposal.fromJson(Map<String, dynamic> json) {
    return Proposal(
      id: json['id'],
      freelancerId: json['freelancer_id'],
      freelancer: Freelancer.fromJson(json['freelancer']),
      clientId: json['client_id'],
      clientOfferId: json['client_offer_id'],
      message: json['message'] ?? '', // قيمة افتراضية في حالة null
      days: json['days'],
      price: (json['price'] as num).toDouble(),
      acceptedAt: json['accepted_at'] != null
          ? DateTime.parse(json['accepted_at'])
          : null,
      rejectedAt: json['rejected_at'] != null
          ? DateTime.parse(json['rejected_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class Freelancer {
  final int id;
  final String? profileImageUrl;
  final String? backgroundImageUrl;
  final String username;
  final String headline;
  final String description;
  final String city;
  final DateTime dateOfBirth;
  final int age;
  final String gender;
  final User user;
  final JobRole jobRole;
  final List<Skill> skills;

  Freelancer({
    required this.id,
    this.profileImageUrl,
    this.backgroundImageUrl,
    required this.username,
    required this.headline,
    required this.description,
    required this.city,
    required this.dateOfBirth,
    required this.age,
    required this.gender,
    required this.user,
    required this.jobRole,
    required this.skills,
  });

  factory Freelancer.fromJson(Map<String, dynamic> json) {
    var skillsFromJson = json['skills'] as List;
    List<Skill> skillsList = skillsFromJson.map((skill) => Skill.fromJson(skill)).toList();

    return Freelancer(
      id: json['id'],
      profileImageUrl: json['profile_image_url'] ?? '', // قيمة افتراضية
      backgroundImageUrl: json['background_image_url'] ?? '', // قيمة افتراضية
      username: json['username'] ?? '', // قيمة افتراضية
      headline: json['headline'] ?? '', // قيمة افتراضية
      description: json['description'] ?? '', // قيمة افتراضية
      city: json['city'] ?? '', // قيمة افتراضية
      dateOfBirth: DateTime.parse(json['date_of_birth']),
      age: json['age'],
      gender: json['gender'] ?? '', // قيمة افتراضية
      user: User.fromJson(json['user']),
      jobRole: JobRole.fromJson(json['job_role']),
      skills: skillsList,
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
  final double money;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.roleId,
    required this.role,
    required this.money,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'] ?? '', // قيمة افتراضية
      lastName: json['last_name'] ?? '', // قيمة افتراضية
      username: json['username'] ?? '', // قيمة افتراضية
      email: json['email'] ?? '', // قيمة افتراضية
      roleId: json['role_id'],
      role: json['role'] ?? '', // قيمة افتراضية
      money: (json['money'] as num).toDouble(),
    );
  }
}

class JobRole {
  final int id;
  final String name;

  JobRole({
    required this.id,
    required this.name,
  });

  factory JobRole.fromJson(Map<String, dynamic> json) {
    return JobRole(
      id: json['id'],
      name: json['name'] ?? '', // قيمة افتراضية
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
      name: json['name'] ?? '', // قيمة افتراضية
      required: json['required'],
    );
  }
}
