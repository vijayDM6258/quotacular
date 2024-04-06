import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'View/detail/page_view/details.dart';
import 'View/favorite/page_view/favorite.dart';
import 'View/homepage/page_view/homepage.dart';

void main() {
  runApp(DbMiner());
}

class DbMiner extends StatelessWidget {
  const DbMiner({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quotes App",
      getPages: [
        GetPage(name: "/", page: () => HomePage()),
        GetPage(name: "/details", page: () => DetailPage()),
        GetPage(name: "/favorite", page: () => Favorite()),
      ],
    );
  }
}
