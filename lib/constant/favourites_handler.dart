import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:collection/collection.dart';

class Favourites {
  static final Favourites _instance = Favourites._internal();
  factory Favourites() => _instance;
  Favourites._internal();

  List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  void addItem(String category, Map<String, String> item) {
    if (!_items.contains(item)) {
      if (!_items.any((element) =>
          element['category'] == category && element['data'] == item)) {
        _items.add({'category': category, 'data': item});
        saveToFile();
      }
      // print("item added to  favourites❤️");
    } else {}
  }

  Future removeItem(String category, Map<String, dynamic> item) async {
    _items.removeWhere((element) =>
        element['category'] == category && element['data'] == item);
    // print("item removed from favourites💔");
    saveToFile();
  }

  bool isFavourite(String category, Map<String, String> item) {
    var equality = const DeepCollectionEquality();
    bool isfav = _items.any((element) =>
        element['category'] == category &&
        equality.equals(element['data'], item));

    return isfav;
  }

  Future<void> saveToFile() async {
    try {
      final file = await _getFile();
      await file.writeAsString(jsonEncode(_items));
    } catch (e) {}
  }

  Future<List<Map<String, dynamic>>?> loadFromFile() async {
    try {
      final file = await _getFile();
      if (await file.exists()) {
        final data = await file.readAsString();
        _items = List<Map<String, dynamic>>.from(jsonDecode(data));
        // print("favorite loaded from file ✅ $_items");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<File> _getFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      return File('${directory.path}/favourites.json');
    } catch (e) {
      rethrow;
    }
  }
}
