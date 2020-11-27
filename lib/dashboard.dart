import 'package:despicableme/model/characters.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:despicableme/widgets/hero_card.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final pi = 3.1415926535897932;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.only(left: 20),
          child: Icon(
            Icons.arrow_back_ios,
            size: 27,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.search,
              size: 32,
              color: Colors.black,
            ),
          )
        ],
//        title: Text('Dashboard'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Despicable Me',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Characters',
                style: TextStyle(fontSize: 24, letterSpacing: 3),
              ),
              Expanded(
                child: new Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return HeroCard(
                        image: characters[index]["image"],
                        title: characters[index]["title"],
                        detail: characters[index]["detail"],
                        hero: "background$index image_hero$index");
                    // );
                  },
                  indicatorLayout: PageIndicatorLayout.COLOR,
                  autoplay: false,
                  itemCount: characters.length,
                  pagination: new SwiperPagination(),
                  control: new SwiperControl(
                      color: Colors.white,
                      size: 20,
                      padding: EdgeInsets.symmetric(horizontal: 15)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
