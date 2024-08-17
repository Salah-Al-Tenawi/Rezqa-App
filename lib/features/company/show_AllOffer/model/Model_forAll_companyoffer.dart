class JobOfferForAllcompany {
  final int id;
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
  final Company? company;
  final JobRole? jobRole;
  final List<dynamic>? skills;
  final bool? militaryServiceRequired;
  final bool? genderRequired;
  final bool? ageRequired;
  final int? proposalsCount;
  final DateTime? createdAt;

  JobOfferForAllcompany({
    required this.id,
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
    this.company,
    this.jobRole,
    this.skills,
    this.militaryServiceRequired,
    this.genderRequired,
    this.ageRequired,
    this.proposalsCount,
    this.createdAt,
  });

  factory JobOfferForAllcompany.fromJson(Map<String, dynamic> json) {
  return JobOfferForAllcompany(
    id: json['id'],
    description: json['description'],
    status: json['status'],
    locationType: json['location_type'],
    attendanceType: json['attendance_type'],
    maxSalary: json['max_salary'] is String ? int.tryParse(json['max_salary']) : json['max_salary'] as int?,
    minSalary: json['min_salary'] is String ? int.tryParse(json['min_salary']) : json['min_salary'] as int?,
    transportation: json['transportation'],
    healthInsurance: json['health_insurance'],
    militaryService: json['military_service'],
    maxAge: json['max_age'] is String ? int.tryParse(json['max_age']) : json['max_age'] as int?,
    minAge: json['min_age'] is String ? int.tryParse(json['min_age']) : json['min_age'] as int?,
    gender: json['gender'],
    industryName: json['industry_name'],
    company: json['company'] != null ? Company.fromJson(json['company']) : null,
    jobRole: json['job_role'] != null ? JobRole.fromJson(json['job_role']) : null,
    skills: json['skills'],
    militaryServiceRequired: json['military_service_required'],
    genderRequired: json['gender_required'],
    ageRequired: json['age_required'],
    proposalsCount: json['proposals_count'],
    createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
  );
}

}

class Company {
  final String? streetAddress;
  final String? city;
  final String? region;
  final int id;
  final String? profileImageUrl;
  final String? backgroundImageUrl;
  final String? profileImageId;
  final String? backgroundImageId;
  final String? verifiedAt;
  final String? username;
  final String? name;
  final String? description;
  final int? size;
  final String? industryName;

  Company({
    this.streetAddress,
    this.city,
    this.region,
    required this.id,
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
    id: json['id'] as int,
    profileImageUrl: json['profile_image_url'],
    backgroundImageUrl: json['background_image_url'],
    profileImageId: json['profile_image_id'],
    backgroundImageId: json['background_image_id'],
    verifiedAt: json['verified_at'],
    username: json['username'],
    name: json['name'],
    description: json['description'],
    size: json['size'] is String ? int.tryParse(json['size']) : json['size'] as int?,
    industryName: json['industry_name'],
  );
}

}

class JobRole {
  final int id;
  final String? name;

  JobRole({
    required this.id,
    this.name,
  });

  factory JobRole.fromJson(Map<String, dynamic> json) {
  return JobRole(
    id: json['id'] as int,
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
  }}