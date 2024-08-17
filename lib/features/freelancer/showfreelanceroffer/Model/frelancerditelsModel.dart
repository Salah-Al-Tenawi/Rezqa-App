class FreelancerDetails {
  final int id;
  final String? profileImageUrl;
  final String? backgroundImageUrl;
  final String username;
  final String headline;
  final String description;
  final String city;
  final String dateOfBirth;
  final int age;
  final String gender;
  final JobRole jobRole;
  final List<Skill> skills;
  final List<Portfolio> portfolios;

  FreelancerDetails({
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
    required this.jobRole,
    required this.skills,
    required this.portfolios,
  });

  factory FreelancerDetails.fromJson(Map<String, dynamic> json) {
    return FreelancerDetails(
      id: json['id'],
      profileImageUrl: json['profile_image_url'],
      backgroundImageUrl: json['background_image_url'],
      username: json['username'],
      headline: json['headline'],
      description: json['description'],
      city: json['city'],
      dateOfBirth: json['date_of_birth'],
      age: json['age'],
      gender: json['gender'],
      jobRole: JobRole.fromJson(json['job_role']),
      skills: (json['skills'] as List).map((skillJson) => Skill.fromJson(skillJson)).toList(),
      portfolios: (json['portfolios'] as List).map((portfolioJson) => Portfolio.fromJson(portfolioJson)).toList(),
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

class Portfolio {
  // Add fields for Portfolio if any
  Portfolio();

  factory Portfolio.fromJson(Map<String, dynamic> json) {
    return Portfolio();
  }
}
