import 'package:flutter/material.dart';
import 'package:learn_romania/constant/colors.dart';
import 'package:learn_romania/constant/utils.dart';
import 'package:learn_romania/pages/favourites_page.dart';
import 'package:learn_romania/widgets/time_function.dart';

class DateTimeCard extends StatefulWidget {
  const DateTimeCard({super.key});

  @override
  State<DateTimeCard> createState() => _DateTimeCardState();
}

class _DateTimeCardState extends State<DateTimeCard> {
  @override
  Widget build(BuildContext context) {
    var Fontsize = ScreenUtils.getWidth(context) * 0.04;
    var width = ScreenUtils.getWidth(context);
    var containerHei = ScreenUtils.getSize(context, 8);
    return Container(
        height: containerHei,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(colors: [
              konTitleBackground,
              Color.fromARGB(255, 101, 125, 232)
            ])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Card(
              elevation: 0.5,
              color: Colors.white.withAlpha(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                      "Romanian Time",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: Fontsize,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    getCurrentDate('Europe/Bucharest'),
                    style: TextStyle(
                        color: const Color.fromARGB(255, 0, 255, 17),
                        fontSize: Fontsize * 1.5,
                        fontFamily: "mydotFont",
                        fontWeight: FontWeight.bold),
                  ),
                  const TimeDisplay(
                    countryName: 'Europe/Bucharest',
                  )
                ],
              ),
            )),
            Expanded(
                child: Card(
              color: const Color.fromARGB(0, 255, 255, 255),
              elevation: 0.5,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Text(
                        "Favorite Items",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: Fontsize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const FavouritesPage()), // Navigate to YourTargetPage
                        );
                      },
                      child: Center(
                        child: SizedBox(
                          child: Icon(
                            Icons.favorite_sharp,
                            color: const Color.fromARGB(255, 242, 75, 136),
                            size: width * 0.25,
                            weight: 5,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ))
          ],
        ));
  }
}
