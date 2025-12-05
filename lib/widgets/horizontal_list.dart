import 'package:flutter/material.dart';
import 'package:learn_romania/constant/utils.dart';
import 'package:learn_romania/data/list_data_module.dart';
import 'package:learn_romania/widgets/card_widget.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({
    super.key,
  });

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> list = cardItemData;
    double height = ScreenUtils.getSize(context, 14);
    double width = ScreenUtils.getSize(context, 100);
    return Container(
      height: height,
      width: width,
      child: GridView.builder(
          itemCount: cardItemData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.2),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(1),
              child: CardsWidget(
                  imageUrl: list[index]['imageUrl'],
                  title: list[index]['title'],
                  targrtPage: list[index]['targetPage']),
            );
          }),
    );
  }
}
