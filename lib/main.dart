import 'package:flutter/material.dart';
import 'package:sepb_web_app/util/constants.dart';
import 'package:sepb_web_app/util/helperFunctions.dart';
import 'package:sepb_web_app/widgets/cardCustomized.dart';
import 'package:sepb_web_app/widgets/formattedText.dart';
import 'package:sepb_web_app/widgets/navBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'monitor.node',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundScaffoldColor,
      body: Column(
        children: [
          const NavBar(),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: CardCustomized(
                  width: getScreenWidth(context),
                  height: getScreenHeight(context) * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 25, top: 20),
                        child: FormattedText(
                          text: "New system",
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 40, top: 20, bottom: 20),
                        child: const CardCustomized(
                          child: Center(
                            child: Icon(
                              Icons.add_rounded,
                              size: 60,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
