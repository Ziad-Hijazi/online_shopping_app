import 'package:online_shopping/linkapi.dart';

import '../../../core/class/crud.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);

  getData(String id, String userId) async {
    var response =
        await crud.postData(AppLink.items, {"id": id, "usersid": userId});
    return response.fold((l) => l, (r) => r);
  }
}
