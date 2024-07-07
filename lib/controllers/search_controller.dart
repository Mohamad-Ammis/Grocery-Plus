import 'package:get/get.dart';
import '../models/product_model.dart';


class SearchPageController extends GetxController {
  List<String> categoryNames = [
    'Fruits & Vegetables',
    'Breakfast',
    'Beverages',
    'Snacks',
  ];
  List<ProductModel> visibleProducts = [];
  List<ProductModel> allProducts = [];
  List<ProductModel> fruitsProducts = [];
  List<ProductModel> breakfastProducts = [];
  List<ProductModel> beveragesProducts = [];
  List<ProductModel> snacksroducts = [];
  @override
  void onInit() {
    fruitsProducts.clear();
    breakfastProducts.clear();
    List<Map<String, dynamic>> product =
    ProductModel.data(category:'Fruits&Vegetables');
    for (var i = 0; i < product.length; i++) {
      fruitsProducts.add(ProductModel.json(product, i));
    }
    print(fruitsProducts.length);
    product = ProductModel.data(category:'Breakfast');
    for (var i = 0; i < product.length; i++) {
      breakfastProducts.add(ProductModel.json(product, i));
    }
    product = ProductModel.data(category: 'Beverages');
    for (var i = 0; i < product.length; i++) {
      beveragesProducts.add(ProductModel.json(product, i));
    }
    product = ProductModel.data(category:'Snacks');
    for (var i = 0; i < product.length; i++) {
      snacksroducts.add(ProductModel.json(product, i));
    }
    allProducts =
        fruitsProducts + breakfastProducts + beveragesProducts + snacksroducts;
    visibleProducts = allProducts;
    super.onInit();
  }

  void filterSearch(String value) {
    List<ProductModel> filterProducts = [];
    for (var i = 0; i < allProducts.length; i++) {
      if (allProducts[i].title.toLowerCase().contains(value.toLowerCase())) {
        filterProducts.add(allProducts[i]);
      }
    }
    visibleProducts = filterProducts;
    update();
  }
  List<bool>categoreis=[false,false,false,false];
  void filterCategory(int index) {
    visibleProducts=[];
    if(categoreis[0]==true&&categoreis[1]==true&&categoreis[2]==true&&categoreis[3]==true){
      visibleProducts=allProducts;
      print('object');
      update();
    }
    else{
      if((index==0)&&(categoreis[index]==false)){
        visibleProducts+=fruitsProducts;
      }
      if((index==1)&&(categoreis[index]==false)){
        visibleProducts+=breakfastProducts;
      }
      if((index==2)&&(categoreis[index]==false)){
        visibleProducts+=beveragesProducts;
      }
      if((index==3)&&(categoreis[index]==false)){
        print('asd');
        visibleProducts+=snacksroducts;
      }}
    categoreis[index]=(!categoreis[index]);
    update();
  }
}