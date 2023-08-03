import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:usado_admin/app_router/router.dart';
import 'package:usado_admin/helpers/firestore_helper.dart';
import 'package:usado_admin/helpers/storage_helper.dart';
import 'package:usado_admin/model/Category.dart';
import 'package:usado_admin/model/comments.dart';
import 'package:usado_admin/model/comments.dart';
import 'package:usado_admin/model/comments.dart';
import 'package:usado_admin/model/product.dart';

class FireStoreProvider extends ChangeNotifier {
  GlobalKey<FormState> addNewCategoryKey = GlobalKey();
  TextEditingController categoryNameController = TextEditingController();

  GlobalKey<FormState> addNewProductKey = GlobalKey();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productUsedTimeController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productColorController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  File? selectedImage;
  List<Category> categories = [];
  List<Product> products = [];
  List<Product> allProducts = [];
  List<Product> requests = [];
  List<Product> soldProduct = [];
  List<Bids> bids = [];
  List<String> categoriesName = [];
  List<String> colors = ['أسود','أبيض','رمادي','أزرق','أحمر','برتقالي','أصفر','أخضر','زهري','بنفسجي','بني'];

  String? value;
  bool addProduct=true;

  FireStoreProvider() {
    getAllCategories();
    getAllRequested();
    getAllOverProduct();
    getAllSold();
  }

  String? requiredValidator(String? v) {
    if (v!.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
  }

  addNewCategory() async {
    if (addNewCategoryKey.currentState!.validate()) {
      if (selectedImage != null) {
        String imageUrl =
            await StorageHelper.storageHelper.uploadImage(selectedImage!);
        Category category =
            Category(name: categoryNameController.text, imageUrl: imageUrl);
        FireStoreHelper.fireStoreHelper.addNewCategory(category);
        categories.add(category);
        notifyListeners();
        AppRouter.popRouter();
        selectedImage=null;
        categoryNameController.text='';
      }
    }
  }

  getAllCategories() async {
    categories = await FireStoreHelper.fireStoreHelper.getAllCategories();
    categoriesName= categories.map((e) => e.name).toList();

    notifyListeners();
  }
  getAllSold() async {
    soldProduct = await FireStoreHelper.fireStoreHelper.getAllSoldProduct();
    notifyListeners();
    log(soldProduct.toString());
  }
  getAllOverProduct() async {
    allProducts = await FireStoreHelper.fireStoreHelper.getAllOverProduct();
    notifyListeners();
  }

  getAllRequested() async {
    requests = await FireStoreHelper.fireStoreHelper.getAllRequested();
    notifyListeners();
  }

  selectImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(file!.path);
    notifyListeners();
  }

  updateCategory(Category category) async {
    String? imageUrl;
    if (selectedImage != null) {
      imageUrl = await StorageHelper.storageHelper.uploadImage(selectedImage!);
    }
    Category newCategory = Category(
        name: categoryNameController.text,
        imageUrl: imageUrl ?? category.imageUrl);
    newCategory.id = category.id;
    await FireStoreHelper.fireStoreHelper.updateCategory(newCategory);
    int index = categories.indexOf(
        categories.where((element) => element.id == category.id).first);
    categories[index] = newCategory;
    notifyListeners();
  }


  addNewProduct(String categoryName, String operation) async {
    if (addNewProductKey.currentState!.validate()) {
      if (selectedImage != null) {
        String imageUrl =
            await StorageHelper.storageHelper.uploadImage(selectedImage!);
        Product product = Product(
          productHolderNumber: num.parse('00970568470037'),
          color: productColorController.text,
          name: productNameController.text,
          price: num.parse(productPriceController.text),
          image: imageUrl,
          categoryName: categoryName,
          location: 'غزة',
          productHolder: 'سحر زقوت',
          publishDate:
              DateFormat('yMd').format(DateTime.now()).toString(),
          usedTime: productUsedTimeController.text,
          operation: operation,
          catId: categories.where((element) => element.name==categoryName).first.id,
        );
        Product newProduct = await FireStoreHelper.fireStoreHelper
            .addNewProduct(product);
        await FireStoreHelper.fireStoreHelper.addNewProductToCategory(newProduct);
        products.add(newProduct);
        print(products);
        notifyListeners();
        AppRouter.popRouter();
      } else{
        value = 'يرجى اضافة صورة';
      }
    }else{
      if(selectedImage==null) {
        value = 'يرجى اضافة صورة';
      }
      addProduct=true;
    }
  }

  addProductToCategory(Product product) async {
    log('start ${product.id}');
    Product newProduct = await FireStoreHelper.fireStoreHelper.addNewProductToCategory(product);
    products.add(newProduct);
    notifyListeners();
  }



  getAllProduct(String catId) async {
    products = await FireStoreHelper.fireStoreHelper.getAllProduct(catId);
    notifyListeners();
  }




  addNewComment(Product product,String name,) async {
    // if(addNewCommentKey.currentState!.validate()){
    Bids comment = Bids(
      name: name,
      answer: commentController.text+'ILS',
      image: 'image',
      date: DateFormat('dd-MM-yyyy').format(DateTime.now()),
    );
    Bids newComment =
    await FireStoreHelper.fireStoreHelper.addNewComment(comment,product);
    bids.add(newComment);
    notifyListeners();
    commentController.text='';

    // }
  }
  Future<void> getAllComments(Product product) async {
    bids = await FireStoreHelper.fireStoreHelper.getAllComments(product);
    notifyListeners();
  }

  deleteProduct(Product product, String catId) async {
    await FireStoreHelper.fireStoreHelper.deleteProduct(product, catId);
    products.removeWhere((element) => element.id == product.id);
    notifyListeners();
  }
  deleteRequestedProduct(Product product) async {
    log('1- delete provider product: ${product.id}');
    await FireStoreHelper.fireStoreHelper.deleteRequestedProduct(product);
    log('4-delete provider product: ${product.id}');
    requests.removeWhere((element) => element.id == product.id);
    notifyListeners();
  }
}
