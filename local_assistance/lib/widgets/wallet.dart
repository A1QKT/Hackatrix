import 'package:flutter/material.dart';

import '../widgets/climate_feature.dart';

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Image.network(
              "https://media.istockphoto.com/photos/freedom-chains-that-transform-into-birds-charge-concept-picture-id1322104312"),
          Positioned(
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
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(
                      height: 50,
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              alignment: Alignment.center,
                              onPressed: () {},
                              icon: Icon(
                                Icons.account_balance_wallet_outlined,
                                size: 40,
                              ),
                            ),
                            Text(
                              "Top-Up",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: IconButton(
                                alignment: Alignment.center,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.cloud_outlined,
                                  size: 40,
                                ),
                              ),
                            ),
                            Text(
                              "Climate",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
