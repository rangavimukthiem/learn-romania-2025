import 'package:flutter/material.dart';
import 'package:learn_romania/widgets/listview_builder.dart';

class BasicTools extends StatefulWidget {
  const BasicTools({super.key});

  @override
  State<BasicTools> createState() => _BasicToolsState();
}

class _BasicToolsState extends State<BasicTools> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Basic Tools",
          ),
        ),
        body: const ListViewBuilder(
          sheetName: "basic Tools",
        ),
      ),
    );
  }
}
