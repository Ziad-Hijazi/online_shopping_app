import 'package:online_shopping/linkapi.dart';
import '../../../../core/class/crud.dart';

class ArchiveOrdersData {
  Crud crud;

  ArchiveOrdersData(this.crud);

  getData(String userId) async {
    var response = await crud.postData(AppLink.archiveOrders, {"id": userId});
    return response.fold((l) => l, (r) => r);
  }

  rating(String orderId, String rating, String comment) async {
    var response = await crud.postData(
        AppLink.rating, {"id": orderId, "rating": rating, "comment": comment});
    return response.fold((l) => l, (r) => r);
  }
}
