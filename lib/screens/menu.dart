import 'package:flutter/material.dart';

import '../util/constants.dart';
import '../util/helperFunctions.dart';
import '../widgets/cardCustomized.dart';
import '../widgets/formattedText.dart';
import '../widgets/navBar.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
