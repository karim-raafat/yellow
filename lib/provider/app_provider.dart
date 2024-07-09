import 'package:flutter/cupertino.dart';
import 'package:yellow/constants/constants.dart';
import 'package:yellow/models/cloth.dart';
import 'package:yellow/models/head_wear.dart';
import 'package:yellow/models/shoes.dart';
import 'package:yellow/models/trousers.dart';
import 'package:yellow/models/tshirts.dart';

class AppProvider extends ChangeNotifier {
  double price = 0;
  List<String> filters = [];
  var size = '';
  late Cloth chosenCloth;
  String clothView = 'All';
  List<Cloth> _allClothes = [
    Tshirt,
    TshirtW,
    jeans,
    jeansW,
    shoes,
    shoesW,
    bucketHat
  ];
  List<Tshirts> _tshirts = [Tshirt, TshirtW];
  List<Trousers> _trousers = [
    jeans,
    jeansW,
  ];
  List<Shoes> _allShoes = [
    shoes,
    shoesW,
  ];
  List<HeadWear> _hats = [bucketHat];
  List<Cloth> filterResults = [];
  List<Cloth> shoppingCart = [];

  List<Tshirts> get tshirts => _tshirts;
  String username = 'Karim Raafat';
  String email = 'MyEmail@example.com';
  String password = 'Lets goo flutter';

  List<Cloth> get allClothes => _allClothes;

  List<Trousers> get trousers => _trousers;

  List<Shoes> get allShoes => _allShoes;

  List<HeadWear> get hats => _hats;

  void changeClothView(String clothView) {
    this.clothView = clothView;
    notifyListeners();
  }

  void changeUserName(String name) {
    this.username = name;
    notifyListeners();
  }


  List<Cloth> searchResults(String search){
    List<Cloth> tmp = filtersResults();
    List<Cloth> results = [];
    for(int i = 0; i<tmp.length;i++){
      if(tmp[i].name.toLowerCase().contains(search.toLowerCase())){
        results.add(tmp[i]);
      }
    }
    return results;
  }

  List<Cloth> filtersResults(){
    switch (clothView) {
      case 'All':
        filterResults = allClothes;
      case 'Tops':
        filterResults = tshirts;
      case 'Trousers':
        filterResults = trousers;
      case 'Shoes':
        filterResults = allShoes;
      default:
        filterResults = hats;
    }
    List<Cloth> results = [];
    for(int i = 0; i<filterResults.length;i++){
      if(filters.contains('Men')){
        if(filterResults[i].gender == Gender.male){
          results.add(filterResults[i]);
        }
      }
      if(filters.contains('Women')){
        if(filterResults[i].gender == Gender.female){
          results.add(filterResults[i]);
        }
      }
      if(filters.contains('Unisex')){
        if(filterResults[i].gender == Gender.unisex){
          results.add(filterResults[i]);
        }
      }
      if(filters.contains('Discounts')){
        if(filterResults[i].discount>0){
          results.add(filterResults[i]);
        }
      }
    }
    if(filters.isEmpty){
      results = filterResults;
    }
    return results;
  }

  void addRemoveFilter(String filter){
    if(filters.contains(filter)){
      filters.remove(filter);
    }
    else{
      if(filter == 'Men' || filter == 'Women' || filter == 'Unisex' || filter == 'Discounts'){
        filters.add(filter);
      }
    }
    notifyListeners();
  }
  void addToShoppingCart(Cloth cloth){
    shoppingCart.add(cloth);
    price+=cloth.price - (cloth.price*cloth.discount/100);
    notifyListeners();
  }
  void removeFromShoppingCart(Cloth cloth){
    price-=cloth.price - (cloth.price*cloth.discount/100);
    shoppingCart.remove(cloth);
    notifyListeners();
  }

}
