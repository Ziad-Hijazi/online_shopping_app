import 'package:online_shopping/linkapi.dart';

import '../../../core/class/crud.dart';

class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);

  addFavorite(String userId, String itemId) async {
    var response = await crud
        .postData(AppLink.addFavorite, {"usersid": userId, "itemsid": itemId});
    return response.fold((l) => l, (r) => r);
  }

  deleteFavorite(String userId, String itemId) async {
    var response = await crud.postData(
        AppLink.deleteFavorite, {"usersid": userId, "itemsid": itemId});
    return response.fold((l) => l, (r) => r);
  }
}
