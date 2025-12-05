import 'package:learn_romania/data/basic_tools.dart';
import 'package:learn_romania/data/conversations.dart';
import 'package:learn_romania/data/days_page.dart';
import 'package:learn_romania/data/greeting_page.dart';
import 'package:learn_romania/data/interview.dart';
import 'package:learn_romania/data/month_namPage.dart';
import 'package:learn_romania/data/number_page.dart';
import 'package:learn_romania/data/persons.dart';
import 'package:learn_romania/data/stationery.dart';
import 'package:learn_romania/data/timePage.dart';
import 'package:learn_romania/data/words.dart';

final List<Map<String, dynamic>> cardItemData = [
  {
    "imageUrl": "assets/dataicons/greetings.png",
    "title": "සුභ පැතුම්",
    "targetPage": const GreetingsPage(),
  },
  {
    "imageUrl": "assets/dataicons/nouns.png",
    "title": "නාම පද",
    "targetPage": const NounsPage(),
  },
  {
    "imageUrl": "assets/dataicons/numeric.png",
    "title": "ඉලක්කම්",
    "targetPage": const NumbersPage(),
  },
  {
    "imageUrl": "assets/dataicons/time-zone.png",
    "title": "වේලාව",
    "targetPage": const TimePage(),
  },
  {
    "imageUrl": "assets/dataicons/days.png",
    "title": "දින",
    "targetPage": const DaysNamePage(),
  },
  {
    "imageUrl": "assets/dataicons/month.png",
    "title": "මාස",
    "targetPage": const MonthNampage(),
  },
  {
    "imageUrl": "assets/dataicons/stationary.png",
    "title": "ලිපි ද්‍රව්‍ය",
    "targetPage": const StationeryPage(),
  },
  {
    "imageUrl": "assets/dataicons/swearing.png",
    "title": "නිතර භාවිතා වන වචන",
    "targetPage": const DayTodayWords(),
  },
  {
    "imageUrl": "assets/dataicons/tools.png",
    "title": "උපකරණ",
    "targetPage": const BasicTools(),
  },
  {
    "imageUrl": "assets/dataicons/talk.png",
    "title": "සංවාද",
    "targetPage": const Conversations(),
  },
  {
    "imageUrl": "assets/dataicons/interview.png",
    "title": "සම්මුඛ පරීක්ෂණය",
    "targetPage": const InterviewPage(),
  },
];
