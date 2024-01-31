// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second/Models/cart.dart';
import 'package:second/core/store.dart';
import 'package:second/utility/routes.dart';
import 'package:second/widgets/home_widgets/catalogheader.dart';
import 'package:second/widgets/home_widgets/cataloglist.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:second/Models/catalog.dart';
//import 'package:second/widgets/item_widget.dart';

//import '../widgets/drawers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://g-sells-135ae-default-rtdb.firebaseio.com/products.json";
  
  @override
  void initState() {
    super.initState();
    // Call loadData to load JSON data when the widget is initialized
    loadData();
  }
    loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await DefaultAssetBundle.of(context)
        .loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.Items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }


 /* loadData() async {
    await Future.delayed(Duration(seconds: 2));
    //final catalogJson =
       // await rootBundle.loadString("assets/files/catalog.json");
    final response= await http.get(Uri.parse(url));
    final catalogJson = response.body;   
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.Items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }*/
 /*loadData() async {
  try {
    final response = await http.get(Uri.parse(url));
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final catalogJson = response.body;
      final decodedData = jsonDecode(catalogJson);
      var productsData = decodedData["products"];
      CatalogModel.Items = List.from(productsData)
          .map<Item>((item) => Item.fromMap(item))
          .toList();
      setState(() {});
    } else {
      debugPrint("Failed to load data: ${response.statusCode}");
    }
  } catch (e) {
    debugPrint("Error loading data: $e");
  }
}*/


  @override
  Widget build(BuildContext context) {
    //return
    //Scaffold(
    //appBar: AppBar(
    //title: Text(
    // "Catalog App",
    //style: TextStyle(color: Colors.black),
    //),
    //),
    //body:
    /// (CatalogModel.Items !=null && CatalogModel.Items!.isNotEmpty) ?
    //ListView.builder(
    //itemCount: CatalogModel.Items!.length,
    //itemBuilder: (context, index) =>  ItemWidget(item: CatalogModel.Items![index]),
    //)
    ///GridView.builder(

    /* gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 16,
        ), 
        itemBuilder: (context, index)  {
          final Item=CatalogModel.Items?[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: GridTile(
              header: Container(
                child: Text(                 
                  Item!.name,
                  style: TextStyle(color: Colors.white,
                  ),
                  ),
                padding:const EdgeInsets.all(12 ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                ),
                ),
              child: Image.network(
                Item!.image
                ),
              footer:Container(
                child: Text(                 
                  Item!.price.toString(),
                  style: TextStyle(color: Colors.white,
                  ),
                  ),
                padding:const EdgeInsets.all(12 ),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                ),
              ));
        },
      itemCount: CatalogModel.Items?.length,)
      : Center(
        child: CircularProgressIndicator(),
      ),
      drawer: MyDrawer(),
    );*/
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(  
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: const {AddMutation, RemoveMutation},
          builder: (context, _, __) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.CartRoute),
            backgroundColor: Colors.indigo,
            child: const Icon(CupertinoIcons.cart),
          ).badge(color: Vx.gray500, size: 22, count: _cart.items.length,
          textStyle: const TextStyle(
            color: Colors.black,fontWeight: FontWeight.bold,
          )),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatalogHeader(),
                if (CatalogModel.Items != null &&
                    CatalogModel.Items!.isNotEmpty)
                  const CatalogList().py16().expand()
                else
                  const CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
