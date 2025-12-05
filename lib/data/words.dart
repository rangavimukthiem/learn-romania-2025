import 'package:flutter/material.dart';
import 'package:learn_romania/widgets/listview_builder.dart';

class DayTodayWords extends StatefulWidget {
  const DayTodayWords({super.key});

  @override
  State<DayTodayWords> createState() => _DayTodayWordsState();
}

class _DayTodayWordsState extends State<DayTodayWords> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Day today Words",
           
          ),
        ),
        body: const ListViewBuilder(
          sheetName: "day today words",
        ),
      ),
    );
  }
}
