import 'dart:io';

class Contact {
  final String id;
  final String name;
  final String email;
  final String phone;
  final File? image;

  Contact({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'imagePath': image?.path,
    };
  }

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['imagePath'] != null ? File(json['imagePath']) : null,
    );
  }

  Contact copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    File? image,
  }) {
    return Contact(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      image: image ?? this.image,
    );
  }
}
