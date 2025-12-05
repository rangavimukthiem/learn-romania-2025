import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:learn_romania/constant/bannerads.dart';
import 'package:learn_romania/constant/colors.dart';
import 'package:learn_romania/constant/favourites_handler.dart';
// To get app directory

class ListViewBuilder extends StatefulWidget {
  static List<Map<String, dynamic>> saveWords = [];

  final String sheetName; // Specify the sheet name to load

  const ListViewBuilder({super.key, required this.sheetName});

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  final TextEditingController _search = TextEditingController();
  List<Map<String, String>> _allData = [];
  bool isthisiteminFavorite = false;

  // All data from the specified Excel sheet
  List<Map<String, String>> _filteredData = []; // Filtered data for search
  final FlutterTts _flutterTts = FlutterTts();
  final Favourites favourites = Favourites();

  // #################### add to Favourites

  @override
  void initState() {
    super.initState();
    loadData();
    _initializeTts();
    favourites.loadFromFile(); // Load saved favorites on start
  }

  void _initializeTts() async {
    try {
      await _flutterTts.setLanguage('ro-RO');
    } catch (e) {
      await _flutterTts.setLanguage("en-EN"); // Set the language
    }

    await _flutterTts.setSpeechRate(0.5); // Adjust the speech rate (0.0 to 1.0)
  }

  Future<void> _speakText(String text) async {
    await _flutterTts.speak(text);
  }

  Future<void> loadData() async {
    try {
      // Load Excel file from assets
      final ByteData data = await rootBundle.load('assets/xl/myDatasheet.xlsx');
      final bytes = data.buffer.asUint8List();
      final excel = Excel.decodeBytes(bytes);

      // Check if the specified sheet exists
      if (!excel.tables.containsKey(widget.sheetName)) {
        setState(() {
          _allData = [];
          _filteredData = [];
        });
        return;
      }

      // Process data from the specified worksheet
      final sheet = excel.tables[widget.sheetName]!;
      final headers = sheet.rows.first; // First row contains headers

      final sheetData = <Map<String, String>>[];
      for (var row in sheet.rows.skip(1)) {
        final rowData = <String, String>{};
        for (int i = 0; i < headers.length; i++) {
          if (headers[i] != null) {
            String columnName =
                headers[i]?.value?.toString() ?? 'Unknown Column';
            rowData[columnName] = row[i]?.value.toString() ?? 'N/A';
          }
        }
        sheetData.add(rowData);
      }

      setState(() {
        _allData = sheetData;
        _filteredData = sheetData; // Initially, show all data
      });
    } catch (e) {
    }
  }

  void _filterData(String query) {
    final filteredData = _allData.where((row) {
      return row.values.any((value) =>
          value.toString().toLowerCase().contains(query.toLowerCase()));
    }).toList();

    setState(() {
      _filteredData = filteredData;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(3),
          child: Column(
            children: [
              Card(
                child: TextField(
                  controller: _search,
                  decoration: const InputDecoration(
                      labelText: 'Search & tap to speak',
                      border: InputBorder.none,
                      fillColor: Color.fromARGB(255, 243, 243, 243)),
                  onChanged: _filterData,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: _filteredData.isNotEmpty
                    ? ListView.builder(
                        itemCount: _filteredData.length,
                        itemBuilder: (context, index) {
                          final row = _filteredData[index];

                          bool isFav =
                              favourites.isFavourite(widget.sheetName, row);

                          return Card(
                            color: kontList,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      for (int i = 0;
                                          i < row.values.length;
                                          i++)
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () => _speakText(row.values
                                                .elementAt(i)
                                                .toString()),
                                            child: Text(
                                              row.values
                                                  .elementAt(i)
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.04,
                                                  color: konListFont,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isFav) {
                                              favourites.removeItem(
                                                  widget.sheetName, row);

                                            } else {
                                              favourites.addItem(
                                                  widget.sheetName, row);

                                            }
                                          });
                                          setState(() {
                                            isFav = favourites.isFavourite(
                                                widget.sheetName, row);
                                          });
                                        },
                                        child: Icon(
                                          isFav
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          size: 30,
                                          color: const Color.fromARGB(
                                              255, 235, 24, 140),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
              // banner Ad Widget here
              SizedBox(
                height: screenHeight * 0.1,
                width: screenWidth,
                child: const Center(
                  child: BannerAdWidget(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
