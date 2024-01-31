 // ignore_for_file: unnecessary_null_comparison

 import 'package:flutter/material.dart';
import 'package:second/Models/catalog.dart';


class ItemWidget extends StatelessWidget {
  

  final Item item;

  const ItemWidget({super.key, required this.item}) : assert(item !=null);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:Card(
        child: ListTile(
          onTap: (){
            debugPrint("${item.name} : pressed");
          },
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text("\$${item.price}",
          textScaleFactor: 1.5,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
      ),
    );
  }
}