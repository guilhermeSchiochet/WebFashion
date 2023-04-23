// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// ProductsDatabaseProvider class to manage database operations
class ProductsDatabaseProvider {
  
  // Singleton instance of the ProductsDatabaseProvider
  static final ProductsDatabaseProvider _instance = ProductsDatabaseProvider._internal();

  // Factory constructor to return the singleton instance
  factory ProductsDatabaseProvider() =>_instance;

  // Private constructor for singleton patternn
  ProductsDatabaseProvider._internal();

  // Nullable database object
  Database? _database;

  // Getter for the database object, initializes if not yet created
  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  // Initializes the database
  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'products.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE products(
            id INTEGER PRIMARY KEY,
            name TEXT,
            codeNum TEXT,
            productValue REAL,
            image BLOB
          )
        ''');
      },
      version: 1,
    );
  }
}