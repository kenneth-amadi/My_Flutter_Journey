class Shop {
  final Map<String, dynamic> product;
  final List<dynamic> customers;

  Shop._({required this.product, required this.customers});

  factory Shop.fromJson(Map<String, dynamic> json) => Shop._(product: json["product"], customers: json["customers"]);

  Map<String, dynamic> toJson(Shop shop) => {"product": shop.product, "customers": shop.customers};

  @override
  String toString() {
    return "$product - $customers";
  }
}
