import 'package:flutter/material.dart';
import 'package:learn_romania/constant/utils.dart';
import 'package:learn_romania/data/more_tools.dart';
import 'package:learn_romania/widgets/card_widget.dart';

class Moretools extends StatefulWidget {
  const Moretools({super.key});

  @override
  State<Moretools> createState() => _MoretoolsState();
}

class _MoretoolsState extends State<Moretools> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> list = mroreToolsList;
    double height = ScreenUtils.getSize(context, 8);
    double width = ScreenUtils.getSize(context, 100);
    return SizedBox(
      height: height,
      width: width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(1),
            child: CardsWidget(
                imageUrl: list[index]['imageUrl'],
                title: list[index]['title'],
                targrtPage: list[index]['targetPage']),
          );
        },
      ),
    );
  }
}
