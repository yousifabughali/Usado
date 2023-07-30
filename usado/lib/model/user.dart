import 'package:usado/model/product.dart';

class AppUser {
  String? id;
  late String name;
  late String email;
  late String? image;
  String? password;
  late num phone;

  AppUser({
    this.id,
    required this.email,
    this.password,
    required this.name,
    required this.phone,
    this.image,

  });

  AppUser.fromMap(Map<String, dynamic> map) {
      email= map['email'];
      name= map['name'];
      image= map['image'];
      phone= map['phone'];

  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'image': image,
      'phone': phone,
    };
  }
}
