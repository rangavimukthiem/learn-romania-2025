// import 'package:flutter/material.dart';
// import 'package:learn_romania/constant/colors.dart';
// import 'package:learn_romania/widgets/listview_builder.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class FavList extends StatefulWidget {
//   const FavList({
//     super.key,
//   });
//   @override
//   _FavListState createState() => _FavListState();
// }

// class _FavListState extends State<FavList> {
//   List<String> favList = ListViewBuilder.saveWords.cast<String>();
//   //  List <Map<String, dynamic>> favList = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadFavList();
//   }

//   _loadFavList() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       favList = prefs.getStringList('favList') ?? [];
//     });
//   }

//   _addToFavList(String item) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       favList.add(item);
//       prefs.setStringList('favList', favList);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
