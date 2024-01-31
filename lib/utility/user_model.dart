 class UserModel {

  final  int id;
   final String name;
   final String desc;
   final num price;
   final String color;
   final String image;
 
 const UserModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
 });
 toJson(){
   return{
    'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
   };
 }
 }