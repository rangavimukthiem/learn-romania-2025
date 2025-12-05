import 'package:flutter/material.dart';
import 'package:learn_romania/widgets/listview_builder.dart';

class FoodsNamesPage extends StatefulWidget {
  const FoodsNamesPage({super.key});

  @override
  State<FoodsNamesPage> createState() => _FoodsNamesPageState();
}

class _FoodsNamesPageState extends State<FoodsNamesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Foods",
            
          ),
        ),
        body: const ListViewBuilder(
          sheetName: "foods",
        ),
      ),
    );
  }
}
