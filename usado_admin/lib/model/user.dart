import 'package:usado_admin/model/product.dart';

class AppUser {
  String? id;
  late String name;
  late String email;
  String? password;
  List<Product>? favourite;
  List<Product>? myProducts;
  List<Product>? requestedProducts;

  AppUser({
    this.id,
    required this.email,
    this.password,
    required this.name,
    this.favourite,
    this.myProducts,
    this.requestedProducts,
  });

  AppUser.fromMap(Map<String, dynamic> map) {
      email= map['email'];
      name= map['name'];
      favourite= map['favourite'];
      myProducts= map['myProducts'];
      requestedProducts= map['requestedProducts'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'favourite': favourite,
      'myProducts': myProducts,
      'requestedProducts': requestedProducts,
    };
  }
}
