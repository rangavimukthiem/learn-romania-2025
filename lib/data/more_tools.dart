import 'package:learn_romania/pages/calculator.dart';
import 'package:learn_romania/pages/cnp_page.dart';
import 'package:learn_romania/pages/cor_page.dart';

final List<Map<String, dynamic>> mroreToolsList = [
  {
    "imageUrl": "assets/home/calculation.png",
    "title": "Salary Calculator",
    "targetPage": const CalculatorPage(),
  },
  {
    "imageUrl": "assets/home/job-search.png",
    "title": "CNP Checker",
    "targetPage": CNPCheckerWidget(),
  },
  {
    "imageUrl": "assets/home/search.png",
    "title": "COR",
    "targetPage": const CorPage(),
  },
];
