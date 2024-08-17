// ignore: file_names, camel_case_types
class JobOffer_ForcompanyOnly {
  final int? id;
  final String? description;
  final String? status;
  final String? locationType;
  final String? attendanceType;
  final int? maxSalary;
  final int? minSalary;
  final bool? transportation;
  final bool? healthInsurance;
  final bool? militaryService;
  final int? maxAge;
  final int? minAge;
  final String? gender;
  final String? industryName;
  final bool? militaryServiceRequired;
  final bool? genderRequired;
  final bool? ageRequired;
  final int? proposalsCount;
  final DateTime? createdAt;
  final Company? company;
  final JobRole? jobRole;
  final List<Skill>? skills;

  JobOffer_ForcompanyOnly({
    this.id,
    this.description,
    this.status,
    this.locationType,
    this.attendanceType,
    this.maxSalary,
    this.minSalary,
    this.transportation,
    this.healthInsurance,
    this.militaryService,
    this.maxAge,
    this.minAge,
    this.gender,
    this.industryName,
    this.militaryServiceRequired,
    this.genderRequired,
    this.ageRequired,
    this.proposalsCount,
    this.createdAt,
    this.company,
    this.jobRole,
    this.skills,
  });

  factory JobOffer_ForcompanyOnly.fromJson(Map<String, dynamic> json) {
    return JobOffer_ForcompanyOnly(
      id: json['id'],
      description: json['description'],
      status: json['status'],
      locationType: json['location_type'],
      attendanceType: json['attendance_type'],
      maxSalary: json['max_salary'] != null ? int.tryParse(json['max_salary'].toString()) : null,
      minSalary: json['min_salary'] != null ? int.tryParse(json['min_salary'].toString()) : null,
      transportation: json['transportation'],
      healthInsurance: json['health_insurance'],
      militaryService: json['military_service'],
      maxAge: json['max_age'],
      minAge: json['min_age'],
      gender: json['gender'],
      industryName: json['industry_name'],
      militaryServiceRequired: json['military_service_required'] ?? false,
      genderRequired: json['gender_required'] ?? false,
      ageRequired: json['age_required'] ?? false,
      proposalsCount: json['proposals_count'] ?? 0,
      createdAt: json['created_at'] != null ? DateTime.tryParse(json['created_at']) : null,
      company: json['company'] != null ? Company.fromJson(json['company']) : null,
      jobRole: json['job_role'] != null ? JobRole.fromJson(json['job_role']) : null,
      skills: json['skills'] != null ? (json['skills'] as List).map((i) => Skill.fromJson(i)).toList() : null,
    );
  }
}

class Company {
  final String? streetAddress;
  final String? city;
  final String? region;
  final int? id;
  final String? profileImageUrl;
  final String? backgroundImageUrl;
  final String? profileImageId;
  final String? backgroundImageId;
  final String? verifiedAt;
  final String? username;
  final String? name;
  final String? description;
  final String? size;
  final String? industryName;

  Company({
    this.streetAddress,
    this.city,
    this.region,
    this.id,
    this.profileImageUrl,
    this.backgroundImageUrl,
    this.profileImageId,
    this.backgroundImageId,
    this.verifiedAt,
    this.username,
    this.name,
    this.description,
    this.size,
    this.industryName,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      streetAddress: json['street_address'],
      city: json['city'],
      region: json['region'],
      id: json['id'],
      profileImageUrl: json['profile_image_url'],
      backgroundImageUrl: json['background_image_url'],
      profileImageId: json['profile_image_id'],
      backgroundImageId: json['background_image_id'],
      verifiedAt: json['verified_at'],
      username: json['username'],
      name: json['name'],
      description: json['description'],
      size: json['size'],
      industryName: json['industry_name'],
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
      name: json['name'],
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
