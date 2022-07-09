import 'package:flutter/material.dart';

import '../page/main_page.dart';
import 'page/product_list_page.dart';
import '../page/join_member_page.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const MainPage(),
        '/productList': (context) => const ProdukListPage(),
        '/joinMember': (context) => const MemberPage(),
      },
      initialRoute: '/',
      title: "hyzaofficial.id",
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}
