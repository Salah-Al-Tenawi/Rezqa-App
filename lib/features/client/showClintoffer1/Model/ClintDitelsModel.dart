// class ClintDitelsModel {
//   final int id;
//   final int clientId;
//   final Client client;
//   final User user;
//   final SubCategory subCategory;
//   final String title;
//   final String status;
//   final String description;
//   final int minPrice;
//   final int maxPrice;
//   final int days;
//   final int proposalsCount;
//   final List<Skill> skills;
//   final List<File> files;
//   final String? postedAt;
//   final String createdAt;
//   final String updatedAt;

//   ClintDitelsModel({
//     required this.id,
//     required this.clientId,
//     required this.client,
//     required this.user,
//     required this.subCategory,
//     required this.title,
//     required this.status,
//     required this.description,
//     required this.minPrice,
//     required this.maxPrice,
//     required this.days,
//     required this.proposalsCount,
//     required this.skills,
//     required this.files,
//     this.postedAt,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory ClintDitelsModel.fromJson(Map<String, dynamic> json) {
//     return ClintDitelsModel(
//       id: json['id'],
//       clientId: json['client_id'],
//       client: Client.fromJson(json['client']),
//       user: User.fromJson(json['user']),
//       subCategory: SubCategory.fromJson(json['sub_category']),
//       title: json['title'],
//       status: json['status'],
//       description: json['description'],
//       minPrice: json['min_price'],
//       maxPrice: json['max_price'],
//       days: json['days'],
//       proposalsCount: json['proposals_count'],
//       skills: (json['skills'] as List).map((skillJson) => Skill.fromJson(skillJson)).toList(),
//       files: (json['files'] as List).map((fileJson) => File.fromJson(fileJson)).toList(),
//       postedAt: json['posted_at'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }
// }

// class Client {
//   final int id;
//   final String username;
//   final String gender;
//   final String city;
//   final String dateOfBirth;
//   final String? profileImageId;
//   final String? backgroundImageId;
//   final String? profileImageUrl;
//   final String? backgroundImageUrl;
//   final String createdAt;
//   final String updatedAt;

//   Client({
//     required this.id,
//     required this.username,
//     required this.gender,
//     required this.city,
//     required this.dateOfBirth,
//     this.profileImageId,
//     this.backgroundImageId,
//     this.profileImageUrl,
//     this.backgroundImageUrl,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Client.fromJson(Map<String, dynamic> json) {
//     return Client(
//       id: json['id'],
//       username: json['username'],
//       gender: json['gender'],
//       city: json['city'],
//       dateOfBirth: json['date_of_birth'],
//       profileImageId: json['profile_image_id'],
//       backgroundImageId: json['background_image_id'],
//       profileImageUrl: json['profile_image_url'],
//       backgroundImageUrl: json['background_image_url'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'username': username,
//       'gender': gender,
//       'city': city,
//       'date_of_birth': dateOfBirth,
//       'profile_image_id': profileImageId,
//       'background_image_id': backgroundImageId,
//       'profile_image_url': profileImageUrl,
//       'background_image_url': backgroundImageUrl,
//       'created_at': createdAt,
//       'updated_at': updatedAt,
//     };
//   }
// }

// class User {
//   final int id;
//   final String firstName;
//   final String lastName;
//   final String username;
//   final String email;
//   final int roleId;
//   final String role;

//   User({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.username,
//     required this.email,
//     required this.roleId,
//     required this.role,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       firstName: json['first_name'],
//       lastName: json['last_name'],
//       username: json['username'],
//       email: json['email'],
//       roleId: json['role_id'],
//       role: json['role'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'first_name': firstName,
//       'last_name': lastName,
//       'username': username,
//       'email': email,
//       'role_id': roleId,
//       'role': role,
//     };
//   }
// }

// class SubCategory {
//   final int id;
//   final String name;
//   final int categoryId;

//   SubCategory({
//     required this.id,
//     required this.name,
//     required this.categoryId,
//   });

//   factory SubCategory.fromJson(Map<String, dynamic> json) {
//     return SubCategory(
//       id: json['id'],
//       name: json['name'],
//       categoryId: json['category_id'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'category_id': categoryId,
//     };
//   }
// }

// class Skill {
//   final int id;
//   final String name;
//   final bool? required;

//   Skill({
//     required this.id,
//     required this.name,
//     this.required,
//   });

//   factory Skill.fromJson(Map<String, dynamic> json) {
//     return Skill(
//       id: json['id'],
//       name: json['name'],
//       required: json['required'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'required': required,
//     };
//   }
// }

// class File {
//   final int id;
//   final String url;
//   final int size;
//   final String extension;

//   File({
//     required this.id,
//     required this.url,
//     required this.size,
//     required this.extension,
//   });

//   factory File.fromJson(Map<String, dynamic> json) {
//     return File(
//       id: json['id'],
//       url: json['url'],
//       size: json['size'],
//       extension: json['extention'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'url': url,
//       'size': size,
//       'extention': extension,
//     };
//   }
// }
