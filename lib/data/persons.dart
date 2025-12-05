import 'package:flutter/material.dart';
import 'package:learn_romania/widgets/listview_builder.dart';

class NounsPage extends StatefulWidget {
  const NounsPage({super.key});

  @override
  State<NounsPage> createState() => _NounsPageState();
}

class _NounsPageState extends State<NounsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nouns",
           ),
      ),
      body: const ListViewBuilder(
        sheetName: "nouns",
      ),
    );
  }
}
