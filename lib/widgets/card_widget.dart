import 'package:flutter/material.dart';
import 'package:learn_romania/constant/colors.dart';
import 'package:learn_romania/constant/utils.dart';

class CardsWidget extends StatefulWidget {
  final String imageUrl;
  final String title;
  final Widget targrtPage;
  const CardsWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.targrtPage,
  });

  @override
  State<CardsWidget> createState() => _CardsWidgetState();
}

class _CardsWidgetState extends State<CardsWidget> {
  @override
  Widget build(BuildContext context) {
    final width = ScreenUtils.getSize(context, 9);
    final height = ScreenUtils.getSize(context, 7);
    final imagewidth = ScreenUtils.getSize(context, 3);
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => widget.targrtPage));
        },
        child: SizedBox(
          width: width,
          height: height,
          child: Card(
            color: kontList,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.imageUrl,
                    width: imagewidth,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 1),
                  Center(
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
