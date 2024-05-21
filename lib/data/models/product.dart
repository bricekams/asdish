import 'package:asdish/data/models/restaurant.dart';

class Product {
  String id;
  String name;
  List<String> tags;
  double price;
  String description;
  double rate;
  ProductType type;
  Restaurant restaurant;
  String photo;
  List<String>? images = [];

  Product({
    required this.id,
    required this.name,
    required this.tags,
    required this.price,
    required this.description,
    required this.rate,
    required this.type,
    required this.restaurant,
    required this.photo,
    this.images,
  });
}

enum ProductType { FAST, SODA, DISH, ICECREAM, PIZZA }
