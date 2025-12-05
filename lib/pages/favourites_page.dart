// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learn_romania/constant/favourites_handler.dart'; // Adjust the import path
import 'package:flutter_tts/flutter_tts.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  final Favourites favourites = Favourites();
  final FlutterTts _flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    favourites.loadFromFile();
    _loadFavourites();
    _initializeTts();
  }

  void _loadFavourites() async {
    await favourites.loadFromFile();
    setState(() {}); // Ensure UI updates when data loads
  }

  void _initializeTts() async {
    try {
      await _flutterTts.setLanguage('ro-RO');
    } catch (e) {
      print('Failed to set language: $e');
      await _flutterTts.setLanguage("en-EN"); // Set the language
    }

    await _flutterTts.setSpeechRate(0.5); // Adjust the speech rate (0.0 to 1.0)
  }

  Future<void> _speakText(String text) async {
    await _flutterTts.speak(text);
  }

  void _RemoveFavourites(a, b) async {
    await favourites.removeItem(
      a,
      b,
    );
    setState(() {}); // Ensure UI updates when data loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: favourites.items.isNotEmpty
          ? ListView.builder(
              itemCount: favourites.items.length,
              itemBuilder: (context, index) {
                final favItem = favourites.items[index];
                final category = favItem['category'];
                final data = favItem['data'] as Map<String, dynamic>;

                return Card(
                  color: const Color.fromARGB(255, 113, 123, 231),
                  child: ListTile(
                    title: GestureDetector(
                      child: Text(
                        data.values.join(" _ "),
                        style: TextStyle(
                            fontSize: 13,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                      onTap: () {
                        _speakText(data["romainia"]);
                      },
                    ),
                    subtitle: Text("Category: $category",
                        style: TextStyle(
                            fontSize: 10,
                            color: const Color.fromARGB(255, 41, 41, 41))),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_sweep,
                          color: Color.fromARGB(255, 241, 148, 141)),
                      onPressed: () {
                        setState(() {
                          _RemoveFavourites(category, data);
                        });
                      },
                    ),
                  ),
                );
              },
            )
          : const Center(child: Text("No favourites added yet!")),
    );
  }
}
