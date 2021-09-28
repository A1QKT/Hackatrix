import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import './drawer.dart';

class MainSCreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // CollectionReference userInformations =
    //     FirebaseFirestore.instance.collection("userInformations");

    return Scaffold(
      drawer: DrawerSheet(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Image.network(
                    "https://media.istockphoto.com/photos/freedom-chains-that-transform-into-birds-charge-concept-picture-id1322104312"),
                Positioned(
                  top: 160,
                  child: Card(
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
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.account_balance_wallet_outlined,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Top-Up",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.star_rate_outlined,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Rate",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
            )
           // GridView.builder(gridDelegate: , itemBuilder: itemBuilder)
          ],
        ),
      ),
    );
  }
}
