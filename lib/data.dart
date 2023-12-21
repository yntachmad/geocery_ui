// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  final String name;
  final String price;
  final String quantity;
  final String image;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
    required this.description,
  });

  Product copyWith({
    String? name,
    String? price,
    String? quantity,
    String? image,
    String? description,
  }) {
    return Product(
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      image: image ?? this.image,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'quantity': quantity,
      'image': image,
      'description': description,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      price: map['price'] as String,
      quantity: map['quantity'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(name: $name, price: $price, quantity: $quantity, image: $image, description: $description)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.price == price &&
        other.quantity == quantity &&
        other.image == image &&
        other.description == description;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        price.hashCode ^
        quantity.hashCode ^
        image.hashCode ^
        description.hashCode;
  }
}
