import 'package:online_shopping/linkapi.dart';

import '../../../core/class/crud.dart';

class HomePageData {
  Crud crud;

  HomePageData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.homepage, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(AppLink.searchItems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
