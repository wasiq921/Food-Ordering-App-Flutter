import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tandooray/categories_model.dart';
import 'package:tandooray/cart_model.dart';

class MyProvider extends  ChangeNotifier{
  List<CategoriesModel> categoriesList=[];
  CategoriesModel categoriesModel;
  Future<void> getCategories() async {
    List<CategoriesModel> newCategoriesList=[];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('categories')
        .doc('Q9jnrlfEe2DlNETjuM6N').collection('Burger').get();
    querySnapshot.docs.forEach((element) {
      categoriesModel = CategoriesModel(image: element.data()['image'], name: element.data()['name']);
      print(categoriesModel.name);
      newCategoriesList.add(categoriesModel);
      categoriesList = newCategoriesList;
    });

  }
  get throwList{
    return categoriesList;
  }

  List<CartModel> cartList=[];
  List<CartModel> newCartList=[];

  CartModel cartModel;
  void addToCart({
    @required String foodName,
    @required int price,
  })
  {
    cartModel=CartModel(
        foodName: foodName,
        price: price,

    );
    newCartList.add(cartModel);
    cartList = newCartList;
  }
  get throwCartList{
    return cartList;
  }
  
  int deleteIndex;
  getDeleteIndex(int index){
    deleteIndex = index;
  }

  void delete(){
    cartList.removeAt(deleteIndex);
    notifyListeners();
  }



}