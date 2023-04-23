import 'dart:typed_data';

class Product {
  int? id;
  String name;
  String codeNum;
  double productValue;
  Uint8List image;

  Product({
    this.id,
    required this.name,
    required this.codeNum,
    required this.productValue,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'codeNum': codeNum,
      'productValue': productValue,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      codeNum: map['codeNum'],
      productValue: map['productValue'],
      image: map['image'],
    );
  }
}
