import 'package:online_shopping/linkapi.dart';

import '../../../core/class/crud.dart';

class CartData {
  Crud crud;

  CartData(this.crud);

  addCart(String userId, String itemId) async {
    var response = await crud
        .postData(AppLink.addCart, {"usersid": userId, "itemsid": itemId});
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String userId, String itemId) async {
    var response = await crud
        .postData(AppLink.deleteCart, {"usersid": userId, "itemsid": itemId});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String userId, String itemId) async {
    var response = await crud.postData(
        AppLink.getcountcartitems, {"usersid": userId, "itemsid": itemId});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String userId) async {
    var response = await crud.postData(AppLink.cartView, {"usersid": userId});
    return response.fold((l) => l, (r) => r);
  }
}
