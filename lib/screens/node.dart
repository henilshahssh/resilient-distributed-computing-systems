import 'package:flutter/material.dart';
import 'package:sepb_web_app/util/constants.dart';
import 'package:sepb_web_app/widgets/cardCustomized.dart';
import 'package:sepb_web_app/widgets/formattedText.dart';
import 'package:sepb_web_app/widgets/navBar.dart';

class NodeInfo extends StatefulWidget {
  const NodeInfo({super.key});

  @override
  State<NodeInfo> createState() => _NodeInfoState();
}

class _NodeInfoState extends State<NodeInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundScaffoldColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(25),
                    height: 450,
                    width: 500,
                    child: const CardCustomized(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: FormattedText(
                              text: 'Agents',
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20), // Middle space
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(25),
                    height: 450,
                    width: 500,
                    child: const CardCustomized(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: FormattedText(
                              text: 'Node Information',
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 10, 25, 20),
                  height: 400,
                  width: 1485,
                  child: CardCustomized(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: FormattedText(
                        text: 'Services',
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 10, 25, 20),
                  height: 300,
                  width: 1485,
                  child: CardCustomized(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: FormattedText(
                        text: 'Monitor',
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10), // Add space before the button
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the button horizontally
              children: [
                Container(
                  width: 1485,
                  height: 75,
                  margin: const EdgeInsets.fromLTRB(25, 0, 25, 20),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your button's click logic here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // Set the background color to white
                    ),
                    child: FormattedText(
                      text: "Delete Node",
                      fontSize: 24,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
