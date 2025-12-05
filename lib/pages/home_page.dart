import 'package:flutter/material.dart';
import 'package:learn_romania/widgets/more_tools_builder.dart';
import 'package:learn_romania/widgets/horizontal_list.dart';
import 'package:learn_romania/widgets/date_time_card.dart';
import 'package:learn_romania/widgets/drawer.dart';
import 'package:learn_romania/widgets/titlee.dart';
import 'package:learn_romania/constant/bannerads.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({
    super.key,
  });

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            drawer: const DrawerPage(),
            appBar: AppBar(
              title: const Text(
                "Learn Romanian",
              ),
            ),
            // ignore: prefer_const_constructors
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DateTimeCard(),
                      SizedBox(
                        height: 5,
                      ),
                      TitleWidget(title: "උපාංග"),
                      SizedBox(
                        height: 2,
                      ),
                      Moretools(),
                      TitleWidget(title: "සිංහල තේරුම් සහ උච්චාරණය "),
                      SizedBox(
                        height: 2,
                      ),
                      HorizontalList(),
                      SizedBox(
                        height: 2,
                      ),
                    ]),
              ),
            )));
  }
}
