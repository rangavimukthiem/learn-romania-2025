import 'package:flutter/material.dart';
import 'package:learn_romania/constant/colors.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height * .06;
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        elevation: 2,
        color: konTitleBackground,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: konFontWight),
          ),
        ),
      ),
    );
  }
}
