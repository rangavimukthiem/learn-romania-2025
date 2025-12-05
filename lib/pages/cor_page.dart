import 'package:flutter/material.dart';
import 'package:learn_romania/widgets/cor_list_builder.dart';
import 'package:learn_romania/constant/utils.dart';

class CorPage extends StatefulWidget {
  const CorPage({super.key});

  @override
  State<CorPage> createState() => _CorPageState();
}

class _CorPageState extends State<CorPage> {
  List<dynamic> favWords = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "COR",
            style: TextStyle(
                fontSize: ScreenUtils.getSize(context, 1), color: Colors.black),
          ),
        ),
        body: const CorListViewBuilder(
          sheetName: "COR",
        ),
      ),
    );
  }
}
