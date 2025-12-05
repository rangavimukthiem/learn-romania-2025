import 'package:flutter/material.dart';
import 'package:learn_romania/widgets/listview_builder.dart';

class NumbersPage extends StatefulWidget {
  const NumbersPage({super.key});

  @override
  State<NumbersPage> createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Numbers ",
         ),
      ),
      body: const ListViewBuilder(
        sheetName: "numbers",
      ),
    );
  }
}
