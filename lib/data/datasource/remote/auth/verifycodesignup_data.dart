import 'package:online_shopping/linkapi.dart';

import '../../../../core/class/crud.dart';

class VerifyCodeSignUpData{
Crud crud;

VerifyCodeSignUpData(this.crud);

postData(String email,String verifycode)async{
  var response=await crud.postData(AppLink.verifycodesignup, {
    "email":email ,
    "verifycode":verifycode ,

  });
 return response.fold((l) => l, (r) => r);

}


}
 