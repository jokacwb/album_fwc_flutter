import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterUserModel {
  final String name;
  final String email;
  final String password;
  final String passwordConfirm;

  RegisterUserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirm,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirm,
    };
  }

  factory RegisterUserModel.fromMap(Map<String, dynamic> map) {
    return RegisterUserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      passwordConfirm: map['password_confirmation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUserModel.fromJson(String source) => RegisterUserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
