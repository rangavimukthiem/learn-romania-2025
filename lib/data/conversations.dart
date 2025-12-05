import 'package:flutter/material.dart';
import 'package:learn_romania/constant/utils.dart';
import 'package:learn_romania/widgets/listview_builder.dart';

class Conversations extends StatefulWidget {
  const Conversations({super.key});

  @override
  State<Conversations> createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "conversations",
            style: TextStyle(
                fontSize: ScreenUtils.getSize(context, 1),),
          ),
        ),
        body: const ListViewBuilder(
          sheetName: "conversations",
        ),
      ),
    );
  }
}
