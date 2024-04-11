import 'dart:convert';

LoginResponceModel loginResponceModelFromJson(String str) =>
    LoginResponceModel.fromJson(json.decode(str));

String loginResponceModelToJson(LoginResponceModel data) =>
    json.encode(data.toJson());

class LoginResponceModel {
  bool status;
  dynamic result;
  dynamic error;

  LoginResponceModel({
    required this.status,
    required this.result,
    required this.error,
  });

  factory LoginResponceModel.fromJson(Map<String, dynamic> json) =>
      LoginResponceModel(
        status: json["status"],
        result: json["result"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result,
        "error": error,
      };
}

// class Result {
//   String id;
//   String username;
//   String email;
//   bool isAdmin;
//   bool isAgent;
//   List<dynamic> skills;
//   String profile;
//   DateTime updatedAt;

//   Result({
//     required this.id,
//     required this.username,
//     required this.email,
//     required this.isAdmin,
//     required this.isAgent,
//     required this.skills,
//     required this.profile,
//     required this.updatedAt,
//   });

//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//         id: json["_id"],
//         username: json["username"],
//         email: json["email"],
//         isAdmin: json["isAdmin"],
//         isAgent: json["isAgent"],
//         skills: List<dynamic>.from(json["skills"].map((x) => x)),
//         profile: json["profile"],
//         updatedAt: DateTime.parse(json["updatedAt"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "username": username,
//         "email": email,
//         "isAdmin": isAdmin,
//         "isAgent": isAgent,
//         "skills": List<dynamic>.from(skills.map((x) => x)),
//         "profile": profile,
//         "updatedAt": updatedAt.toIso8601String(),
//       };
// }
