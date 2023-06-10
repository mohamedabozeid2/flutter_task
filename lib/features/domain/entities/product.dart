import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final String rate;
  final String rateCount;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rate,
    required this.rateCount,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        category,
        image,
        rate,
        rateCount,
      ];
}
