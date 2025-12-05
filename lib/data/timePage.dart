import 'package:flutter/material.dart';
import 'package:learn_romania/widgets/listview_builder.dart';

class TimePage extends StatefulWidget {
  const TimePage({super.key});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "කාල ප්‍රකාශන",
          ),
        ),
        body: const ListViewBuilder(
          sheetName: "time",
        ),
      ),
    );
  }
}
