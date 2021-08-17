import 'dart:convert';

class UserModel {
  String email;
  String name;
  String phone;
  String cpf;
  String uid;

  UserModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.cpf,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'cpf': cpf,
      'uid': uid
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        email: map['email'],
        name: map['name'],
        phone: map['phone'],
        cpf: map['cpf'],
        uid: map['uid']);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(email: $email, name: $name, phone: $phone, cpf: $cpf)';
  }

  UserModel copyWith({
    String? email,
    String? name,
    String? phone,
    String? cpf,
    String? uid,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      cpf: cpf ?? this.cpf,
      uid: uid ?? this.uid,
    );
  }
}
