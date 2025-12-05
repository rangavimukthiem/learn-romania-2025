import 'package:flutter/material.dart';
import 'package:learn_romania/widgets/listview_builder.dart';

class StationeryPage extends StatefulWidget {
  const StationeryPage({super.key});

  @override
  State<StationeryPage> createState() => _StationeryPageState();
}

class _StationeryPageState extends State<StationeryPage> {
  List<dynamic> favWords = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Stationery",
              ),
        ),
        body: const ListViewBuilder(
          sheetName: "stationery",
        ),
      ),
    );
  }
}
