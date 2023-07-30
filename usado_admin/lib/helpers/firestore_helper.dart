import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:usado_admin/model/Category.dart';
import 'package:usado_admin/model/comments.dart';
import 'package:usado_admin/model/product.dart';
import 'package:usado_admin/model/user.dart';

class FireStoreHelper {
  FireStoreHelper._();

  static FireStoreHelper fireStoreHelper = FireStoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final String categoryCollectionName = 'categories';
  final String requestedCollectionName = 'requested';
  final String soldProductCollectionName = 'sold';
  final String allProductCollectionName = 'allProduct';

  CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection('users');

  CollectionReference<Map<String, dynamic>> soldCollection =
  FirebaseFirestore.instance.collection('sold');

  CollectionReference<Map<String, dynamic>> categoriesCollection =
      FirebaseFirestore.instance.collection('categories');

  CollectionReference<Map<String, dynamic>> allProductCollection =
  FirebaseFirestore.instance.collection('allProduct');

  CollectionReference<Map<String, dynamic>> requestedCollection =
      FirebaseFirestore.instance.collection('requested');

  addUsersToFireStore(AppUser appUser) async {
    await userCollection.doc(appUser.id).set(appUser.toMap());
  }

  Future<AppUser> getUserFromFireStore(String id) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await userCollection.doc(id).get();
    return AppUser.fromMap(documentSnapshot.data()!);
  }


  /// Category

  Future<Category> addNewCategory(Category category) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        await categoriesCollection.add(category.toMap());
    category.id = documentReference.id;
    return category;
  }

  Future<List<Category>> getAllCategories() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await categoriesCollection.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        querySnapshot.docs;
    List<Category> categories = documents.map((e) {
      Category category = Category.fromMap(e.data());
      category.id = e.id;
      return category;
    }).toList();
    return categories;
  }

  updateCategory(Category category) async {
    await categoriesCollection.doc(category.id).update(category.toMap());
  }



  /// Products
  ///


  Future<List<Product>> getAllOverProduct() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await allProductCollection.get();
    List<Product> allProducts = querySnapshot.docs.map((e) {
      Map<String, dynamic> data = e.data();
      data['id'] = e.id;
      Product product = Product.fromMap(data);
      product.id = e.id;
      return product;
    }).toList();
    return allProducts;
  }

  Future<List<Product>> getAllSoldProduct() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await soldCollection.get();
    List<Product> soldProducts = querySnapshot.docs.map((e) {
      Map<String, dynamic> data = e.data();
      data['id'] = e.id;
      Product product = Product.fromMap(data);
      product.id = e.id;
      return product;
    }).toList();
    return soldProducts;
  }

  Future<List<Product>> getAllRequested() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await requestedCollection.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        querySnapshot.docs;
    List<Product> requests = documents.map((e) {
      Product product = Product.fromMap(e.data());
      product.id = e.id;
      return product;
    }).toList();
    return requests;
  }


  Future<Product> addNewProduct(Product product) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        await categoriesCollection
            .doc(product.catId)
            .collection('products')
            .add(product.toMap());
    product.id = documentReference.id;
    return product;
  }

  Future<Product> addNewProductToCategory(Product product) async {

    categoriesCollection
            .doc(product.catId)
            .collection('products')
            .doc(product.id).set(product.toMap());
    await allProductCollection.doc(product.id).set(product.toMap());
    return product;
  }

  Future<Bids> addNewComment(Bids comment, Product product) async {
    DocumentReference<Map<String, dynamic>> documentReference =
    await categoriesCollection
        .doc(product.catId)
        .collection('products')
        .doc(product.id)
        .collection('comments')
        .add(comment.toMap());
    comment.id = documentReference.id;
    return comment;
  }

  Future<List<Bids>> getAllComments(Product product) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await categoriesCollection
        .doc(product.catId)
        .collection('products')
        .doc(product.id)
        .collection('comments')
        .get();

    List<Bids> comment = querySnapshot.docs.map((e) {
      Map<String, dynamic> data = e.data();
      data['id'] = e.id;
      Bids comment = Bids.fromMap(data);
      comment.id = e.id;
      return comment;
    }).toList();
    return comment;
  }

  Future<List<Product>> getAllProduct(String catId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await categoriesCollection.doc(catId).collection('products').get();
    List<Product> products = querySnapshot.docs.map((e) {
      Map<String, dynamic> data = e.data();
      data['id'] = e.id;
      Product product = Product.fromMap(data);
      product.id = e.id;
      return product;
    }).toList();
    return products;
  }



  updateProduct(Product product, String catId) async {
    await categoriesCollection
        .doc(catId)
        .collection('products')
        .doc(product.id)
        .update(product.toMap());
  }

  deleteProduct(Product product, String catId) async {
    await categoriesCollection
        .doc(catId)
        .collection('products')
        .doc(product.id)
        .delete();
  }

  deleteRequestedProduct(Product product) async {
    await requestedCollection.doc(product.id).delete();

  }

}
