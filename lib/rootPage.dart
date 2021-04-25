import 'package:flutter/material.dart';
import 'package:shoping/page/catergory.dart';
import 'package:shoping/page/homePage.dart';
import 'package:shoping/page/mine.dart';
import 'package:shoping/page/shoping.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentIndex = 0;
  Widget currentPage;

  @override
  void initState() {
    currentPage = pageList[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
        appBar: AppBar(
          title: Text("Shoping"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: barItemList,
          onTap: (index){
            setState(() {
              currentIndex = index;
              currentPage = pageList[index];
            });
          },
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.lightBlue,
          unselectedItemColor: Colors.black26,
        ),
        body: currentPage,
      ),
    );
  }
  List<BottomNavigationBarItem> barItemList = [
    BottomNavigationBarItem(icon: Icon(Icons.home),label: "首页"),
    BottomNavigationBarItem(icon: Icon(Icons.category_rounded),label: "分类"),
    BottomNavigationBarItem(icon: Icon(Icons.shop_outlined),label: "购物车"),
    BottomNavigationBarItem(icon: Icon(Icons.headset_outlined),label: "我的"),
  ];
  List<Widget> pageList = [
    HomePage(),
    CatergoryPage(),
    ShopingPage(),
    MinePage()
  ];
}
