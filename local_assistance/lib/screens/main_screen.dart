import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import './drawer.dart';
import '../widgets/main_feature.dart';
import '../widgets/climate_feature.dart';
import '../';

class MainSCreen extends StatefulWidget {
  @override
  _MainSCreenState createState() => _MainSCreenState();
}

class _MainSCreenState extends State<MainSCreen> {
  bool _isNavigate = true;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // CollectionReference userInformations =
    //     FirebaseFirestore.instance.collection("userInformations");
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerSheet(),
      body: _isNavigate
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Image.network(
                            "https://media.istockphoto.com/photos/freedom-chains-that-transform-into-birds-charge-concept-picture-id1322104312"),
                        new Positioned(
                          top: 160,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              width: 350,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Balance",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "150,000VND",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    height: 50,
                                    thickness: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              print("some thing");
                                            },
                                            child: Icon(
                                              Icons
                                                  .account_balance_wallet_outlined,
                                              size: 40,
                                            ),
                                          ),
                                          Text(
                                            "Top-Up",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: IconButton(
                                              alignment: Alignment.center,
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.star_rate_outlined,
                                                size: 40,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Rate",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
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
            )
          : Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                ClimateFeature(
                  city: "Ho Chi Minh",
                  stateCode: "vn",
                ),
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          print(index);
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
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_add), label: "notification"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "menu"),
        ],
      ),
    );
  }
}
