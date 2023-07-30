import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:usado/model/Category.dart';
import 'package:usado/model/comments.dart';
import 'package:usado/model/product.dart';
import 'package:usado/model/user.dart';

class FireStoreHelper {
  FireStoreHelper._();

  static FireStoreHelper fireStoreHelper = FireStoreHelper._();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final String categoryCollectionName = 'categories';
  final String requestedCollectionName = 'requested';
  final String soldProductCollectionName = 'sold';
  final String allProductCollectionName = 'allProduct';

  String? userId;

  /// ----------------- Firestore Collection Names Initialized ----------------

  CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection('users');

  CollectionReference<Map<String, dynamic>> categoriesCollection =
      FirebaseFirestore.instance.collection('categories');

  CollectionReference<Map<String, dynamic>> commentsCollection =
      FirebaseFirestore.instance.collection('comments');

  CollectionReference<Map<String, dynamic>> requestedCollection =
      FirebaseFirestore.instance.collection('requested');

  CollectionReference<Map<String, dynamic>> allProductCollection =
      FirebaseFirestore.instance.collection('allProduct');

  CollectionReference<Map<String, dynamic>> soldCollection =
      FirebaseFirestore.instance.collection('sold');

  /// ----------------- User ----------------
  addUsersToFireStore(AppUser appUser) async {
    await userCollection.doc(appUser.id).set(appUser.toMap());
  }

  Future<AppUser> getUserFromFireStore(String id) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await userCollection.doc(id).get();
    return AppUser.fromMap(documentSnapshot.data()!);
  }

  /// ********** New ********* Favorite and My Products and MyRequests
  /// My Favorite
  Future<Product> addNewToMyFavorite(Product product) async {
    User? user = await FirebaseAuth.instance.currentUser;
        await userCollection
            .doc(user!.uid!)
            .collection('favorites').doc(product.id).set(product.toMap());
    return product;
  }

  Future<List<Product>> getAllMyFavorite() async {
    User? user = await FirebaseAuth.instance.currentUser;
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await userCollection.doc(user!.uid!).collection('favorites').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        querySnapshot.docs;
    List<Product> myProducts = documents.map((e) {
      Product myProduct = Product.fromMap(e.data());
      myProduct.id = e.id;
      return myProduct;
    }).toList();
    return myProducts;
  }

  Future<void> removeFromMyFavorite(Product product) async {
    User? user = await FirebaseAuth.instance.currentUser;
    await userCollection
        .doc(user!.uid!)
        .collection('favorites')
        .doc(product.id)
        .delete();
  }

  /// My Product

  Future<Product> addNewToMyProducts(Product product) async {
    User? user = await FirebaseAuth.instance.currentUser;
        await userCollection
            .doc(user!.uid!)
            .collection('myProducts')
            .doc(product.id).set(product.toMap());
    return product;
  }

  Future<List<Product>> getAllMyProduct() async {
    User? user = await FirebaseAuth.instance.currentUser;
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await userCollection.doc(user!.uid!).collection('myProducts').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        querySnapshot.docs;
    List<Product> myProducts = documents.map((e) {
      Product myProduct = Product.fromMap(e.data());
      myProduct.id = e.id;
      return myProduct;
    }).toList();
    return myProducts;
  }

  Future<void> removeFromMyProducts(Product product) async {
    User? user = await FirebaseAuth.instance.currentUser;
    await userCollection
        .doc(user!.uid!)
        .collection('myProducts')
        .doc(product.id)
        .delete();
  }

  /// My Requested

  Future<Product> addNewToMyRequested(Product product) async {
    User? user = await FirebaseAuth.instance.currentUser;
        await userCollection
            .doc(user!.uid!)
            .collection('myRequested')
            .doc(product.id).set(product.toMap());
    return product;
  }

  Future<List<Product>> getAllMyRequested() async {
    User? user = await FirebaseAuth.instance.currentUser;
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await userCollection.doc(user!.uid!).collection('myRequested').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        querySnapshot.docs;
    List<Product> myProducts = documents.map((e) {
      Product myProduct = Product.fromMap(e.data());
      myProduct.id = e.id;
      return myProduct;
    }).toList();
    return myProducts;
  }

  /// ----------------- Categories ----------------
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

  //products
  /// ----------------- Product ----------------

  Future<Product> addNewProductToRequested(
      Product product, String catId) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        await requestedCollection.add(product.toMap());
    product.id = documentReference.id;
    await addNewToMyProducts(product);
    log(product.id!);
    return product;
  }

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

  Future<Product> addNewSold(Product product) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        await soldCollection.add(product.toMap());
    product.id = documentReference.id;
    return product;
  }

  updateProduct(Product product, String catId) async {
    await categoriesCollection
        .doc(catId)
        .collection('products')
        .doc(product.id)
        .update(product.toMap());
  }
  updateUser(AppUser appUser) async {
    User? user = FirebaseAuth.instance.currentUser;
    await userCollection
        .doc(user!.uid)
        .update(appUser.toMap());
  }

  deleteProduct(Product product) async {
    User? user = FirebaseAuth.instance.currentUser;
    await userCollection
        .doc(product.catId)
        .collection('products')
        .doc(product.id)
        .delete();

    await categoriesCollection
        .doc(product.catId)
        .collection('products')
        .doc(product.id)
        .delete();

    await allProductCollection.doc(product.id).delete();
  }

  Future<Comments> addNewComment(Comments comment, Product product) async {
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

  Future<List<Comments>> getAllComments(Product product) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await categoriesCollection
            .doc(product.catId)
            .collection('products')
            .doc(product.id)
            .collection('comments')
            .get();

    List<Comments> comment = querySnapshot.docs.map((e) {
      Map<String, dynamic> data = e.data();
      data['id'] = e.id;
      Comments comment = Comments.fromMap(data);
      comment.id = e.id;
      return comment;
    }).toList();
    return comment;
  }
}
