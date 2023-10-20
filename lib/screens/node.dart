import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sepb_web_app/util/constants.dart';
import 'package:sepb_web_app/widgets/cardCustomized.dart';
import 'package:sepb_web_app/widgets/formattedText.dart';
import 'package:sepb_web_app/widgets/navBar.dart';

class NodeInfo extends StatefulWidget {
  final String id;
  final String cpu;
  final String networkIn;
  final String networkOut;
  final String memory;

  const NodeInfo({super.key, required this.id, required this.cpu, required this.memory, required this.networkIn, required this.networkOut});

  @override
  State<NodeInfo> createState() => _NodeInfoState();
}

class _NodeInfoState extends State<NodeInfo> {
  var nodes = {};
  List<String> headings = ["CPU: ", "Network: ", "Memory: "];
  Timer? timer;
  bool isLoaded = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) => fetchData());
  }

  fetchData() async {
    print("Nodes 39: $nodes");

    if(nodes.isNotEmpty){
      setState(() {
        isLoaded = true;
      });
      timer?.cancel();
      return;
    }

    final response = await http.get(Uri.parse('http://localhost:9000/system'));

    print("Response body: ${response.body}");
    setState(() {
      nodes = jsonDecode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backgroundScaffoldColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(
              screenIndex: 1,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 550,
                  margin: const EdgeInsets.fromLTRB(260, 25, 25, 0),
                  child: CardCustomized(
                    width: 500,
                    height: 290,
                    child: Container(
                      width: 500,
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(30, 20, 20, 0),
                            child: FormattedText(
                              text: 'Node Information',
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(60, 20, 20, 0),
                            child: Container(
                              width: 425,
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  CardCustomized(
                                    width: 10,
                                    height: 60,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          child: ListTile(
                                            title: Text(headings[0]),
                                          ),
                                        ),
                                        Text("${widget.cpu} %")
                                      ],
                                    ),
                                  ),
                                  CardCustomized(
                                    width: 10,
                                    height: 60,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          child: ListTile(
                                            title: Text(headings[1]),
                                          ),
                                        ),
                                        Text("${widget.networkOut} MB/s ↑  ${widget.networkIn} MB/s ↓")
                                      ],
                                    ),
                                  ),
                                  CardCustomized(
                                    width: 10,
                                    height: 60,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          child: ListTile(
                                            title: Text(headings[2]),
                                          ),
                                        ),
                                        Text("${widget.memory} %")
                                      ],
                                    ),
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
                Container(
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(25, 25, 200, 0),
                  child: CardCustomized(
                    width: 350,
                    height: 290,
                    child: Container(
                      width: 500,
                      height: 200,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 20, 20, 0),
                            child: FormattedText(
                              text: 'Agents',
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(60, 20, 20, 0),
                            child: CardCustomized(
                              width: 220,
                              height: 60,
                              child: ListTile(
                                title: Text("agent1"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(260, 10, 25, 20),
                  height: 260,
                  width: 550,
                  child: CardCustomized(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(30, 20, 20, 0),
                          child: FormattedText(
                            text: 'Services',
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(60, 20, 20, 0),
                          child: Column(
                            children: [
                              CardCustomized(
                                width: 425,
                                height: 70,
                                child: Center(
                                  child: ListTile(
                                    title: const Text("Database"),
                                    subtitle: const Text("Running"),
                                    trailing: Container(
                                      width: 100,
                                      // color: Colors.red,
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.play_arrow, color: Colors.grey),
                                          ),
                                          SizedBox(width: 10,),
                                          IconButton(
                                            onPressed: () {
                                              _showMyDialog("Stop service?", "Are you sure you want to stop this service?", () async {
                                                var url = Uri.parse('http://localhost:9000/service/stop?node_id=${widget.id}&service=database');
                                                final res = await http.post(
                                                    url);

                                                print("url: $url");

                                                if(res.statusCode == 200){
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                }else{
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    const SnackBar(
                                                      content:
                                                      Text("Service stopping was unsuccessful."),
                                                    ),
                                                  );
                                                }
                                              }, (){
                                                Navigator.pop(context);
                                              });
                                            },
                                            icon: const Icon(Icons.close, color: Colors.red,),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // SizedBox(height: 20),
                              CardCustomized(
                                width: 425,
                                height: 70,
                                child: Center(
                                  child: ListTile(
                                    title: const Text("Web"),
                                    subtitle: const Text("Running"),
                                    trailing: Container(
                                      width: 100,
                                      // color: Colors.red,
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.play_arrow, color: Colors.grey),
                                          ),
                                          SizedBox(width: 10,),
                                          IconButton(
                                            onPressed: () {
                                              _showMyDialog("Stop service?", "Are you sure you want to stop this service?", () async {
                                                var url = Uri.parse('http://localhost:9000/service/stop?node_id=${widget.id}&service=web');
                                                final res = await http.post(
                                                    url);

                                                print("url: $url");

                                                if(res.statusCode == 200){
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                }else{
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    const SnackBar(
                                                      content:
                                                      Text("Service stopping was unsuccessful."),
                                                    ),
                                                  );
                                                }
                                              }, (){
                                                Navigator.pop(context);
                                              });
                                            },
                                            icon: const Icon(Icons.close, color: Colors.red,),
                                          ),
                                        ],
                                      ),
                                    ),
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
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 10, 25, 20),
                  child: const CardCustomized(
                    width: 350,
                    height: 260,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 20, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormattedText(
                            text: 'Node connections',
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                          Padding(
                            padding: EdgeInsets.all(25.0),
                            child: CardCustomized(
                              width: 220,
                              height: 60,
                              child: ListTile(
                                title: Text("node2"),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 940,
                  height: 75,
                  margin: const EdgeInsets.fromLTRB(265, 0, 25, 20),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your button's click logic here
                      _showMyDialog("Delete node?", "Are you sure you want to delete this node?", () async {
                        var url = Uri.parse('http://localhost:9000/kill/${widget.id}');
                        final res = await http.post(
                            url);

                        print("url: $url");

                        if(res.statusCode == 200){
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }else{
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                              Text("Node deletion was unsuccessful."),
                            ),
                          );
                        }
                      }, (){
                        Navigator.pop(context);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                      Colors.white, // Set the background color to white
                    ),
                    child: const FormattedText(
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

  Future<void> _showMyDialog(String title, String question, Function() yesFunction, Function() noFunction) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(question),
          actions: [
            CupertinoDialogAction(child: Text("No"), onPressed: noFunction,),
            CupertinoDialogAction(child: Text("Yes"), onPressed: yesFunction,),
          ],
        );
      },
    );
  }
}
