import 'package:flutter/material.dart';
import 'package:learn_romania/widgets/listview_builder.dart';
import 'package:learn_romania/constant/utils.dart';

class MonthNampage extends StatefulWidget {
  const MonthNampage({super.key});

  @override
  State<MonthNampage> createState() => _DaysNamePageState();
}

class _DaysNamePageState extends State<MonthNampage> {
  List<dynamic> favWords = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Months",
           
          ),
        ),
        body: const ListViewBuilder(
          sheetName: "months",
        ),
      ),
    );
  }
}
