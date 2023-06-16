import 'package:online_shopping/linkapi.dart';

import '../../../../core/class/crud.dart';

class SignupData{
Crud crud;

SignupData(this.crud);

postData(String username,String email,String password,String phone)async{
  var response=await crud.postData(AppLink.signup, {
    "username":username ,
    "email":email ,
    "password":password ,
    "phone":phone ,

  });
 return response.fold((l) => l, (r) => r);

}


}
 