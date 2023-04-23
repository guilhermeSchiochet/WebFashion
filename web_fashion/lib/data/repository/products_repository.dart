import 'package:sqflite/sqflite.dart';
import 'package:web_fashion/data/providers/products_database_provider.dart';
import 'package:web_fashion/domain/model/products_model.dart';

class PruductsRepository {

  /// Instance of the ProductsDatabaseProvider
  final ProductsDatabaseProvider _productsdatabaseProvider = ProductsDatabaseProvider();

  /// Add a new product to the database
  Future<void> insertProduct(Product product) async {
    final db = await _productsdatabaseProvider.database;

    await db.insert(
      'products',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Retrieve all products from the database
  Future<List<Product>> getProducts() async {
    final db = await _productsdatabaseProvider.database;
    final List<Map<String, dynamic>> maps = await db.query('products');
    return List.generate(maps.length, (i) => Product.fromMap(maps[i]));
  }
}