import "dart:convert";
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ClimateFeature extends StatefulWidget {
  final String city;
  final String stateCode;
  ClimateFeature({
    @required this.city,
    @required this.stateCode,
  });

  @override
  _ClimateFeatureState createState() => _ClimateFeatureState();
}

class _ClimateFeatureState extends State<ClimateFeature> {
  Image _image(String id) {
    return Image.network(
      "http://openweathermap.org/img/wn/$id@2x.png",
    );
  }

  Future<Map<String, dynamic>> getWeather(String city, String stateCode) async {
    final queryParameter = {
      "q": "$city,$stateCode",
      "appid": "b9f3f30a78e0579f90d3b1c6b2f004f5",
      "units": "metric",
    };
    final Uri url =
        Uri.http("api.openweathermap.org", "/data/2.5/weather", queryParameter);
    try {
      final response = await http.get(url);
      final extractData = json.decode(response.body) as Map<String, dynamic>;
      return extractData;
    } catch (error) {
      print(error);
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeather(widget.city, widget.stateCode),
      builder: (ctx, snapShot) {
        // print(snapShot.data);
        if (snapShot.connectionState == ConnectionState.waiting)
          return CircularProgressIndicator();
        if (snapShot.error != null) return Text("Not found");
        return Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              _image(snapShot.data["weather"][0]["icon"]),
              Positioned(
                bottom: 70,
                child: Text("${snapShot.data["main"]["temp"]}\u2103"),
              )
            ],
          ),
        );
      },
    );
  }
}
