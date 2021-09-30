import 'package:flutter/material.dart';

import './drawer.dart';
import '../widgets/main_feature.dart';
import '../widgets/wallet.dart';
import './menu_screen.dart';

class LocalScreen extends StatefulWidget {
  @override
  _LocalScreenState createState() => _LocalScreenState();
}

class _LocalScreenState extends State<LocalScreen> {
  bool _isNavigate = true;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerSheet(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wallet(),
            SizedBox(
              height: 50,
            ),
            Container(
                height: 300,
                width: 300,
                child: Container(
                  height: 100,
                  child: GridView.count(
                    primary: false,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    padding: const EdgeInsets.all(10),
                    crossAxisCount: 2,
                    children: <Widget>[
                      MainFeature(
                          featureName: "Food",
                          icon: Icon(Icons.food_bank_outlined)),
                      MainFeature(
                          featureName: "Shopping",
                          icon: Icon(Icons.shopping_cart_outlined)),
                      MainFeature(
                          featureName: "Destination",
                          icon: Icon(Icons.location_history_outlined)),
                      MainFeature(
                          featureName: "Club",
                          icon: Icon(Icons.volunteer_activism_outlined)),
                    ],
                  ),
                ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 0)
              _isNavigate = true;
            else
              _isNavigate = false;
            print(_isNavigate);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "menu"),
        ],
      ),
    );
    ;
  }
}
