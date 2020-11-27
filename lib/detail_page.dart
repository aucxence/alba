import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailPage extends StatefulWidget {

  final String hero;

  DetailPage({this.hero});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<String> data = [
    "Minion-birthday.png",
    "Toy.png",
    "minions.png",
    "jackpot.png",
    "Minions-2.png",
    "Minions-3.png"
  ];

  var heros;

  @override
  void initState() { 
    super.initState();
    heros = widget.hero.split(" ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.deepOrangeAccent],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/Despicable-me-1.png',
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Kavin the minion',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      letterSpacing: 2),
                ),
                Text(
                  'Kavin is the oldest brother of the 3 little yellow people. He has a special sense of responsibility',
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 2),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
          SlidingUpPanel(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            panelBuilder: (scroll) => Stack(
              children: <Widget>[
                Container(
                  margin:
                      const EdgeInsets.only(top: 70, bottom: 30, right: 20, left: 20),
                  child: _photoList(scroll),
                ), 
                Positioned(
                  top: 20,
                  child:  Container(
                    width: MediaQuery.of(context).size.width,
                                      child: Container(
                      alignment: Alignment.center,
                      // color: Colors.red,
                      child: Text(
                        "Images",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                        )
                      ),
                    ),
                  ),
                )
              ],
            ),
            minHeight: 200,
          )
        ],
      ),
    );
  }

  _photoList(ScrollController scroll) {
    return GridView.builder(
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          color: Colors.orange,
          child: new GridTile(
              child: Image.asset(
            "assets/" + data[index],
            fit: BoxFit.scaleDown,
          ) //just for testing, will fill with image later
              ),
        );
      },
    );
  }
}
