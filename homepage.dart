import 'dart:math';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'TemperatureProgress.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_screen';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  double data = 0;
  // late String _displayText;
  // final _database = FirebaseDatabase.instance.reference();
  // late StreamSubscription _update;
  @override
  void initState() {
    super.initState();
    isLoading = true;
    _activateListeners();
  }

  void _activateListeners() async {
    // _update = _database.child('mlx90614/1-set/object').onValue.listen((event) {

    // progressController = AnimationController(
    //     vsync: this, duration: const Duration(milliseconds: 1000)); //5s
    //
    // tempAnimation =
    //     Tween<double>(begin: 0, end: temp).animate(progressController)
    //       ..addListener(() {
    //         setState(() {});
    //       });
    // progressController.forward();
    var url = Uri.parse('http://localhost:4000/users?token=1');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var temp = jsonResponse['temperature'];
      setState(() {
        data = temp;
      });
      print(temp);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('Temperature'),
                          Text(
                            '${data.toInt()}',
                            style: const TextStyle(
                                fontSize: 70, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            '°C',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : const Text(
                'Loading...',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
