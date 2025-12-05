// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learn_romania/widgets/listview_builder.dart';

class GreetingsPage extends StatefulWidget {
  const GreetingsPage({super.key});

  @override
  State<GreetingsPage> createState() => _GreetingsPageState();
}

class _GreetingsPageState extends State<GreetingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Greetings",
          
        ),
      ),
      body: const Column(
        children: [
          Expanded(
            child: ListViewBuilder(
              sheetName: "greetings",
            ),
          ),
        ],
      ),
    );
  }
}
