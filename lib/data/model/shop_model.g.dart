// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopModel _$ShopModelFromJson(Map<String, dynamic> json) => ShopModel(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      customers: (json['customers'] as List<dynamic>)
          .map((e) => Customer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShopModelToJson(ShopModel instance) => <String, dynamic>{
      'product': instance.product,
      'customers': instance.customers,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String?,
      category: json['category'] as String?,
      price: json['price'] as String?,
      quantity: json['quantity'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'price': instance.price,
      'quantity': instance.quantity,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      name: json['name'] as String?,
      job: json['job'] as String?,
      age: json['age'] as int?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'name': instance.name,
      'job': instance.job,
      'age': instance.age,
      'country': instance.country,
    };
