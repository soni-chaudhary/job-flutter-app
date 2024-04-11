class RegisterModel {
  String password;
  String email;
  String username;
  String firstName;
  String lastName;
  String phoneNo;

  RegisterModel({
    required this.password,
    required this.email,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.phoneNo,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        password: json["password"],
        email: json["email"],
        username: json[""],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNo: json["phoneNo"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "email": email,
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNo": phoneNo,
      };
}
