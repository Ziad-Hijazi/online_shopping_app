

import 'package:flutter/material.dart';
import 'package:online_shopping/core/functions/checkInternet.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();

    
  }
  var result;
  initialData() async{
  result=await checkInternet();
print(result);
  }


  @override
  void initState() {
    initialData();
    super.initState();
  }



 
}