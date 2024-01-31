import 'package:second/Models/catalog.dart';
import 'package:second/core/store.dart';
import 'package:velocity_x/velocity_x.dart';



class CartModel{
  //singelton class 
 /*static final cartModel = CartModel._internal();
 CartModel._internal();
 factory CartModel()=> cartModel;*/

//catalog fields
  late CatalogModel _catalog;
  //colection of ids -store ids of each items
  final List<int> _itemIds =[];
//get catalog
  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newCatalog){
    // ignore: unnecessary_null_comparison
    assert(newCatalog != null);
    _catalog=newCatalog;
  }
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

// get total price
num get totalPrice => items.fold(0, (total, current) =>total + current.price);
//add item
//void add(Item item){
 // _itemIds.add(item.id);}
//remove item
//void remove(Item item){
  //_itemIds.remove(item.id);}
}
class AddMutation extends VxMutation<MyStore>{
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    
    store?.cart._itemIds.add(item.id);
  }
}
class RemoveMutation extends VxMutation<MyStore>{
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}