import 'dart:developer';
import 'dart:io';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/helpers/firestore_helper.dart';
import 'package:usado/helpers/storage_helper.dart';
import 'package:usado/model/Category.dart';
import 'package:usado/model/comments.dart';
import 'package:usado/model/product.dart';
import 'package:usado/model/user.dart';
import 'package:usado/views/home_screens/home_screen.dart';
import 'package:usado/widgets/custom_widget_dialoge.dart';

import '../widgets/comment.dart';

class FireStoreProvider extends ChangeNotifier {
  GlobalKey<FormState> addNewProductKey = GlobalKey();
  GlobalKey<FormState> sellProductKey = GlobalKey();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productUsedTimeController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productColorController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  bool addProduct = true;

  File? selectedImage;
  List<Product> allProducts = [];

  List<Category> categories = [];
  List<String> categoriesName = [];
  List<Product> products = [];

  List<Product> favourite = [];
  List<Product> myProducts = [];
  List<Product> myRequested = [];

  List<Product> sold = [];
  List<Comments> bids=[];
  List<String> colors = ['أسود','أبيض','رمادي','أزرق','أحمر','برتقالي','أصفر','أخضر','زهري','بنفسجي','بني'];
  String? value;


  FireStoreProvider() {
    getAllCategories();
    getAllOverProduct();
    getAllMyFavorite();
    getAllMyProduct();
    getAllMyRequested();
    // getFavouriteAndMyProduct();

  }

  String? requiredValidator(String? v) {
    if (v!.isEmpty || v==null) {
      return 'هذا الحقل مطلوب';
    }
  }

   getAllCategories() async {
    categories = await FireStoreHelper.fireStoreHelper.getAllCategories();
    categoriesName= categories.map((e) => e.name).toList();
    log(categoriesName.toString());
    notifyListeners();
  }

  selectImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(file!.path);
    notifyListeners();
  }



  addNewProductToRequested(String categoryName, String operation,String productHolder,String userImage,String number) async {
    if (addNewProductKey.currentState!.validate()) {
      Category category= categories.where((element) => element.name==categoryName).first;
      if (selectedImage != null) {
        String imageUrl =
        await StorageHelper.storageHelper.uploadImage(selectedImage!);
        Product product = Product(
          productHolderNumber: num.parse(number),
          productHolderImage: userImage,
          color: productColorController.text,
          name: productNameController.text,
          price: num.parse(productPriceController.text),
          image: imageUrl,
          categoryName: categoryName,
          location: 'غزة',
          productHolder: productHolder,
          publishDate:
          DateFormat('yMd').format(DateTime.now()).toString(),
          usedTime: productUsedTimeController.text,
          operation: operation,
          catId:category.id,
        );
        await FireStoreHelper.fireStoreHelper.addNewProductToRequested(product, category.id!);
        myProducts.add(product);
        // TODO: favorite and my products update
        notifyListeners();
        productNameController.text='';
        selectedImage=null;
        productPriceController.text='';
        productUsedTimeController.text='';
        productColorController.text='';
        value='';
        CustomDialog.showDialogFunction(
            '',
            Container(
              height: 160.h,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/check.svg',height: 50.h,width: 50.w,),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'تم إرسال طلبك للمراجعة ينجاح',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'سيتم الموافقة على طلبك في غضون ساعة',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ));
        Future.delayed(Duration(seconds: 3),() => AppRouter.popRouter(),);
      }
      else{
        value = 'يرجى اضافة صورة';
      }
    }else{
      if(selectedImage==null) {
        value = 'يرجى اضافة صورة';
      }
      addProduct=true;
    }
  }

  addNewFavorite(Product product) async {
    Product newProduct= await FireStoreHelper.fireStoreHelper.addNewToMyFavorite(product);
    favourite.add(newProduct);
    notifyListeners();
  }

  removeFromFavorite(Product product) async {
    await FireStoreHelper.fireStoreHelper.removeFromMyFavorite(product);
    favourite.removeWhere((element) => element.id==product.id);
    notifyListeners();
  }
  getAllMyFavorite() async {
    favourite= await FireStoreHelper.fireStoreHelper.getAllMyFavorite();
    notifyListeners();
    log(favourite.toString()+'222');

  }
  ///
  ///
   addNewSold(Product product) async {
     if(sellProductKey.currentState!.validate()) {
       Product soldProduct = await FireStoreHelper.fireStoreHelper.addNewSold(
           product);
       sold.add(soldProduct);
       notifyListeners();
       CustomDialog.showDialogFunction(
         '',
           Container(
             height: 160.h,
             child: Center(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   SvgPicture.asset(
                       'assets/icons/check.svg',height: 50.h,width: 50.w,),
                   SizedBox(
                     height: 2.h,
                   ),
                   Text(
                     'تم تأكيد طلبك ينجاح',
                     style: TextStyle(
                       color: Colors.black,
                       fontWeight: FontWeight.w500,
                       fontSize: 16.sp,
                     ),
                   ),
                   SizedBox(
                     height: 2.h,
                   ),
                   Text(
                     'سيتم إرسال تفاصيل عمليه الاستلام على البريد الالكتروني',
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       color: Colors.black,
                       fontWeight: FontWeight.w400,
                       fontSize: 14.sp,
                     ),
                   ),
                 ],
               ),
             ),
           ));
       Future.delayed(Duration(seconds: 3),() => AppRouter.NavigateToWidget(HomeScreen()),);



     }
  }


  addNewToMyProduct(Product product) async {
    Product newProduct= await FireStoreHelper.fireStoreHelper.addNewToMyProducts(product);
    myProducts.add(newProduct);
    notifyListeners();
  }

  removeFromMyProduct(Product product) async {
    await FireStoreHelper.fireStoreHelper.removeFromMyProducts(product);
    myProducts.removeWhere((element) => element.id==product.id);
    notifyListeners();
  }

  getAllMyProduct() async {
    myProducts= await FireStoreHelper.fireStoreHelper.getAllMyProduct();
    notifyListeners();
  }
  ///

  addNewToMyRequested(Product product) async {
      Product newProduct = await FireStoreHelper.fireStoreHelper
          .addNewToMyRequested(product);
      myRequested.add(newProduct);
      notifyListeners();
  }

  getAllMyRequested() async {
    myRequested= await FireStoreHelper.fireStoreHelper.getAllMyFavorite();
    notifyListeners();
  }
/////////////////////////////////////////////////////////////////////
  getAllProduct(String catId) async {
    products = await FireStoreHelper.fireStoreHelper.getAllProduct(catId);
    notifyListeners();
  }

  getAllOverProduct() async {
    allProducts = await FireStoreHelper.fireStoreHelper.getAllOverProduct();
    notifyListeners();
  }
/*


 */

///
//   updateProduct(Product product, String catId) async {
//     String? imageUrl;
//     if (selectedImage != null) {
//       imageUrl = await StorageHelper.storageHelper.uploadImage(selectedImage!);
//     }
//     // Product newProduct = Product(
//     //   name: productNameController.text,
//     //   description: productDescriptionController.text,
//     //   price: num.parse(productPriceController.text),
//     //   quantitiy: num.parse(productQuantityController.text),
//     //   image: imageUrl ?? product.image,
//     // );
//     // newProduct.id = product.id;
//     // await FireStoreHelper.fireStoreHelper.updateProduct(newProduct, catId);
//     // getAllProduct(catId);
//   }

  deleteProduct(Product product) async {
      log(product.id!);
      await FireStoreHelper.fireStoreHelper.deleteProduct(product);
      products.removeWhere((element) => element.id == product.id);
      allProducts.removeWhere((element) => element.id == product.id);
      myProducts.removeWhere((element) => element.id == product.id);
      log('deleted');
      notifyListeners();

  }

  addNewComment(Product product,String name,) async {
    // if(addNewCommentKey.currentState!.validate()){
      Comments comment = Comments(
        name: name,
        answer: commentController.text+' ILS',
        image: 'image',
        date: DateFormat('dd-MM-yyyy').format(DateTime.now()),
      );
      Comments newComment =
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
}
