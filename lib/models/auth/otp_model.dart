
import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
    String otp;
    String email;
    String? password;

    OtpModel({
        required this.otp,
        required this.email,
        this.password,
    });

    factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        otp: json["otp"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "otp": otp,
        "email": email,
        "password":password
    };
}
