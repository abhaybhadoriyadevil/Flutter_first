import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second/Models/catalog.dart';
import 'package:second/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Models/cart.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  //final _catalog = CatalogModel();
  //final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    final CartModel cArt = (VxState.store as MyStore).cart;
    //final CatalogModel _catalog = (VxState.store as MyStore).catalog;
    bool isInCart = cArt.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
         // isInCart = isInCart.toggle();
         // final _catalog = CatalogModel();
         // _cart.catalog = _catalog;
          //_cart.add(catalog);
          AddMutation(catalog);
          // setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.accentColor),
          shape: MaterialStateProperty.all(
            const StadiumBorder(),
          )),
      child: isInCart ? const Icon(Icons.done) : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
