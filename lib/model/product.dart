import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product{

  int? id;
  String? brand;
  String? name;
  String? price;
  String? image_link;
 String? description;
 double? rating;
 String? product_type;

  Product({
     this.id,
     this.brand,
     this.name,
     this.price,
     this.image_link,
     this.description,
     this.rating,
     this.product_type,
  });

factory Product.fromJson(Map<String,dynamic> map)=>_$ProductFromJson(map);



}