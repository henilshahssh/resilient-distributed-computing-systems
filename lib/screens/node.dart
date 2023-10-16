import 'package:flutter/cupertino.dart';
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
  List<String> headings = ["CPU: ", "Network: ", "Memory: "];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundScaffoldColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(
              screenIndex: 0,
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(25),
                    height: 350,
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
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: ListTile(
                              title: Text("agent1"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20), // Middle space
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    height: 350,
                    width: 500,
                    child: CardCustomized(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: FormattedText(
                              text: 'Node Information',
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: SizedBox(
                              height: 250,
                              width: 300,
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: ListTile(
                                          title: Text(headings[0]),
                                        ),
                                      ),
                                      Text("16.84 %")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: ListTile(
                                          title: Text(headings[1]),
                                        ),
                                      ),
                                      Text("50.00 ↑ " + "40.00 ↓")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: ListTile(
                                          title: Text(headings[2]),
                                        ),
                                      ),
                                      Text("43.35 %")
                                    ],
                                  ),
                                ],
                              ),
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
                  height: 300,
                  width: 1485,
                  child: CardCustomized(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: FormattedText(
                            text: 'Services',
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              ListTile(
                                title: const Text("Database"),
                                subtitle: const Text("Running"),
                                trailing: Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                                  width: 100,
                                  // color: Colors.red,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.play_arrow, color: Colors.grey),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.close, color: Colors.red,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ListTile(
                                title: const Text("Web"),
                                trailing: Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                                  width: 100,
                                  // color: Colors.red,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.play_arrow, color: Colors.green),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.close, color: Colors.grey,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
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
                  height: 200,
                  width: 1485,
                  child: const CardCustomized(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          FormattedText(
                            text: 'Monitor',
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                          Padding(
                            padding: EdgeInsets.all(25.0),
                            child: ListTile(
                              title: Text("node2"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10), // Add space before the button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // Center the button horizontally
              children: [
                Container(
                  width: 1485,
                  height: 75,
                  margin: const EdgeInsets.fromLTRB(25, 0, 25, 20),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your button's click logic here
                      _showMyDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                          Colors.white, // Set the background color to white
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

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Delete node"),
          content: Text("Are you sure you want to delete this node?"),
          actions: [
            CupertinoDialogAction(child: Text("No"), onPressed: (){Navigator.pop(context);},),
            CupertinoDialogAction(child: Text("Yes"), onPressed: (){
              Navigator.pop(context);
              Navigator.pop(context);
            },),
          ],
        );
      },
    );
  }
}
