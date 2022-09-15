import 'package:json_annotation/json_annotation.dart'; 

part 'shop_model.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ShopModel {
  @JsonKey(name: 'product')
  final  Product product;
  @JsonKey(name: 'customers')
  final  List<Customer> customers;

  ShopModel({required this.product, required this.customers});

   factory ShopModel.fromJson(Map<String, dynamic> json) => _$ShopModelFromJson(json);

   Map<String, dynamic> toJson() => _$ShopModelToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Product {
  @JsonKey(name: 'name')
  final  String? name;
  @JsonKey(name: 'category')
  final  String? category;
  @JsonKey(name: 'price')
  final  String? price;
  @JsonKey(name: 'quantity')
  final  String? quantity;

  Product({this.name, this.category, this.price, this.quantity});

   factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

   Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Customer {
  @JsonKey(name: 'name')
  final  String? name;
  @JsonKey(name: 'job')
  final  String? job;
  @JsonKey(name: 'age')
  final  int? age;
  @JsonKey(name: 'country')
  final  String? country;

  Customer({this.name, this.job, this.age, this.country});

   factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

   Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

