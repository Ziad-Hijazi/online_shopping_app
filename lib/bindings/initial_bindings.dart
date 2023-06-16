
import 'package:get/get.dart';
import 'package:online_shopping/core/class/crud.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
  }

}