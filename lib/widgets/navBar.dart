import 'package:flutter/material.dart';
import '../util/constants.dart';
import 'formattedText.dart';

class NavBar extends StatefulWidget {
  final double screenIndex;
  const NavBar({super.key, required this.screenIndex});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    double iconAreaHeight = 62;

    return Container(
      color: primaryColor,
      child: Column(
        children: [
          Container(
            height: iconAreaHeight,
            margin: const EdgeInsets.only(left: 30, top: 15, bottom: 10),
            child: const Row(
              children: [
                ImageIcon(
                  AssetImage("assets/images/monitor.png"),
                  color: Colors.transparent,
                  size: 50,
                ),
                SizedBox(width: 20),
                FormattedText(
                  text: "monitor.node",
                  color: Colors.white,
                  fontSize: 32,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, bottom: 10),
            child: Row(
              children: [
                navItem(heading: "Menu", isSelected: 0 == widget.screenIndex),
                navItem(heading: "Dashboard", isSelected: 1 == widget.screenIndex),
                // navItem(heading: "Support", isSelected: 2 == widget.screenIndex),
                // navItem(heading: "Settings", isSelected: 3 == widget.screenIndex),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget navItem({required String heading,
      required bool isSelected}) {

    Color? color = (isSelected) ? selectedMenuNavBarColor : const Color.fromRGBO(0, 64, 57, 0);

    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: FormattedText(
        text: heading,
        color: Colors.white,
      ),
    );
  }
}
