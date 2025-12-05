import 'package:flutter/material.dart';
import 'package:learn_romania/widgets/listview_builder.dart';

class DaysNamePage extends StatefulWidget {
  const DaysNamePage({super.key});

  @override
  State<DaysNamePage> createState() => _DaysNamePageState();
}

class _DaysNamePageState extends State<DaysNamePage> {
  List<dynamic> favWords = [];

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
