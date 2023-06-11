import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 4)
class Product extends HiveObject with EquatableMixin {
  @HiveField(0)final int id;
  @HiveField(1)final String title;
  @HiveField(2)final dynamic price;
  @HiveField(3)final String description;
  @HiveField(4)final String category;
  @HiveField(5)final String image;
  @HiveField(6)final String rate;
  @HiveField(7)final String rateCount;

  Product({
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
