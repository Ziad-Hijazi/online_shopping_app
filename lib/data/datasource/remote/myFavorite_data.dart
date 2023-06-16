import 'package:online_shopping/linkapi.dart';

import '../../../core/class/crud.dart';

class MyFavoriteData {
  Crud crud;

  MyFavoriteData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.favoriteView, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.postData(AppLink.deletefromfavorite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
