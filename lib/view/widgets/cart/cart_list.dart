import 'package:flutter/material.dart';
import 'package:online_shopping/core/constants/image_asset.dart';
import 'package:online_shopping/linkapi.dart';

class CartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onDelete;

  const CartList({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.imagename,
    required this.onAdd,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Image.network(
                "${AppLink.imagesItems}/$imagename",
                height: 120,
                fit: BoxFit.fill,
              )),
          Expanded(
            flex: 3,
            child: ListTile(
              title: Text(
                name,
                style: TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                "$price\$",
                style: const TextStyle(color: Colors.red, fontSize: 20),
              ),
            ),
          ),
          Expanded(
              child: Column(
            children: [
              SizedBox(
                  height: 40,
                  child: IconButton(
                      onPressed: onAdd, icon: const Icon(Icons.add))),
              SizedBox(
                  height: 20,
                  child: Text(
                    count,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                  height: 30,
                  child: IconButton(
                      onPressed: onDelete, icon: const Icon(Icons.remove))),
            ],
          )),
        ],
      ),
    );
  }
}
