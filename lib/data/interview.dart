import 'package:flutter/material.dart';
import 'package:learn_romania/widgets/listview_builder.dart';

class InterviewPage extends StatefulWidget {
  const InterviewPage({super.key});

  @override
  State<InterviewPage> createState() => _InterviewPageState();
}

class _InterviewPageState extends State<InterviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Embassy Interview",
        ),
      ),
      body: const Column(
        children: [
          Expanded(
            child: ListViewBuilder(
              sheetName: "interview",
            ),
          ),
        ],
      ),
    );
  }
}
