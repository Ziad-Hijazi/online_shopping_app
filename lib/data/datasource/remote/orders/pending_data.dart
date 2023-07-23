import 'package:online_shopping/linkapi.dart';
import '../../../../core/class/crud.dart';

class PendingOrdersData {
  Crud crud;

  PendingOrdersData(this.crud);

  getData(String userId) async {
    var response = await crud.postData(AppLink.pendingOrders, {"id": userId});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String orderId) async {
    var response = await crud.postData(AppLink.deleteOrders, {"id": orderId});
    return response.fold((l) => l, (r) => r);
  }
}
