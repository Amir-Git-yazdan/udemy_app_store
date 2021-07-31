import 'package:flutter/material.dart';
import 'package:udemy_appstore_tutorial/consts/icons.dart';
import 'package:udemy_appstore_tutorial/screens/cart.dart';
import 'package:udemy_appstore_tutorial/screens/feeds.dart';
import 'package:udemy_appstore_tutorial/screens/home.dart';
import 'package:udemy_appstore_tutorial/screens/search.dart';
import 'package:udemy_appstore_tutorial/screens/user_info.dart';

class BottomBarScreen extends StatefulWidget {
  // final AuthBase auth;

  // const TabsScreen2({Key? key, this.auth}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Map<String, Widget>> _pages = [];
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': Home(),
      },
      {
        'page': Feeds(),
      },
      {
        'page': Search(),
      },
      {
        'page': Cart(),
      },
      {
        'page': UserInfo(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    print('index : $index');
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _selectPage,
              backgroundColor: Theme.of(context).primaryColor,
              // unselectedItemColor: Theme.of(context).textSelectionColor,//depricated
              unselectedItemColor:
                  Theme.of(context).textSelectionTheme.selectionColor,
              selectedItemColor: Colors.purple,
              currentIndex: _selectedPageIndex,
              items: [
                //TODO: 2. after todo 1, replace the icons here
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.rss_feed), label: 'Feeds'),
                BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_shopping_cart), label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'User'),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(8.0),
        child: FloatingActionButton(
          hoverElevation: 10,
          splashColor: Colors.greenAccent,
          tooltip: 'searching...',
          elevation: 4,
          child: Icon(Icons.search),
          onPressed: () {
            setState(() {
              _selectedPageIndex = 2;
            });
          },
        ),
      ),
    );
  }
}
