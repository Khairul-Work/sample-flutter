import 'dart:convert';

class ProductModel {
  String name;
  double price;
  int id;
  ProductModel({
    required this.name,
    required this.price,
    required this.id,
  });

  ProductModel copyWith({
    String? name,
    double? price,
    int? id,
  }) {
    return ProductModel(
      name: name ?? this.name,
      price: price ?? this.price,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'id': id,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() => 'ProductModel(name: $name, price: $price, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.name == name &&
        other.price == price &&
        other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode ^ id.hashCode;
}
