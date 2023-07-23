import 'package:online_shopping/linkapi.dart';

import '../../../core/class/crud.dart';

class AddressData {
  Crud crud;

  AddressData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.viewAddress, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  addData(String usersid, String name, String city, String street) async {
    var response = await crud.postData(AppLink.addAddress, {
      "usersid": usersid,
      "name": name,
      "city": city,
      "street": street,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String addressid) async {
    var response =
        await crud.postData(AppLink.deleteAddress, {"addressid": addressid});
    return response.fold((l) => l, (r) => r);
  }
}
