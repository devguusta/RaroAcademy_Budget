import 'dart:convert';

class UserModel {
  String email;
  String name;
  String phone;
  String cpf;

  UserModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.cpf,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'cpf': cpf,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      name: map['name'],
      phone: map['phone'],
      cpf: map['cpf'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(email: $email, name: $name, phone: $phone, cpf: $cpf)';
  }
}
