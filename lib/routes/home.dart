import 'package:flutter/material.dart';
import 'package:kosmos/widgets/date_selector.dart';
import 'package:kosmos/widgets/main_card.dart';
import 'package:kosmos/widgets/nav_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/appicon.png",
          fit: BoxFit.contain,
          height: 42,
        ),
        toolbarHeight: 68,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon((Icons.info_outline)),
          ),
        ],
      ),
      body: Scrollable(
        axisDirection: AxisDirection.down,
        viewportBuilder: (context, position) {
          return ListView(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: MainCard(),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: NavCard(),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: DateSelector(),
              ),
            ],
          );
        },
      ),
    );
  }
}
