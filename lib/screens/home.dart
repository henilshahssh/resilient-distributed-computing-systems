import 'dart:convert';
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:sepb_web_app/screens/node.dart';
import 'package:sepb_web_app/widgets/cardCustomized.dart';
import 'package:sepb_web_app/widgets/formattedText.dart';
import 'package:sepb_web_app/widgets/navBar.dart';
import 'package:http/http.dart' as http;
import '../util/helperFunctions.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var nodes = {};
  var currentNode = {
    "cpu_percent": {
      "metric": "-",
    },
    "network_percent": {
      "incoming": "-",
      "outgoing": "-",
    },
    "memory_usage_percent": {
      "metric": "-",
    }
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // nodes = fetchData() as Map;

    // fetchData().then((result) {
    //   print("result: $result");
    //   setState(() {
    //     nodes = result;
    //   });
    // });

    nodes = fetchNodes();
  }

  Future<Map> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:9000/'));
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    String heading = "Current state of the system";

    int totalNodes = nodes.length;
    print(totalNodes);

    List<String> nodeNames = [];
    nodes.forEach((key, value) {
      nodeNames.add(key);
    });
    //on tap

    List<String> headings = ["CPU: ", "Network: ", "Memory: ", "View more"];

    return Scaffold(
      body: Column(
        children: [
          const NavBar(
            screenIndex: 1,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: CardCustomized(
              width: getScreenWidth(context),
              height: getScreenHeight(context) * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 40, top: 40, bottom: 20),
                    child: FormattedText(
                      text: heading,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 120),
                        child: CardCustomized(
                          width: 500,
                          height: 330,
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(bottom: 10),
                            itemCount: totalNodes,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  ListTile(
                                    title: FormattedText(
                                      text: nodeNames[index],
                                    ),
                                    onTap: () {
                                      var node = nodes[nodeNames[index]];


                                      setState(() {
                                        // if(node['cpu_percent']['metric'] != null){
                                        //   // currentNode['cpu_percent']?['metric'] = node['cpu_percent']['metric'].toStringAsFixed(2);
                                        //   currentNode['cpu_percent']?['metric'] = node['cpu_percent']['metric'].toString();
                                        // }else{
                                        //   currentNode['cpu_percent']?['metric'] = "-";
                                        // }
                                        //
                                        // if(node['inbound_bandwidth']['metric'] != null){
                                        //   currentNode['network_percent']?['incoming'] = node['inbound_bandwidth']['metric'].toStringAsFixed(2).toString();
                                        //   // currentNode['network_percent']?['incoming'] = node['inbound_bandwidth']['metric'].toString();
                                        // }else{
                                        //   currentNode['network_percent']?['incoming'] = "-";
                                        // }
                                        //
                                        // if(node['outbound_bandwidth']['metric'] != null){
                                        //   currentNode['network_percent']?['outgoing'] = node['outbound_bandwidth']['metric'].toStringAsFixed(2).toString();
                                        //   // currentNode['network_percent']?['outgoing'] = node['outbound_bandwidth']['metric'].toString();
                                        // }else{
                                        //   currentNode['network_percent']?['outgoing'] = "-";
                                        // }
                                        //
                                        // if(node['memory_usage_percent']['metric'] != null){
                                        //   // currentNode['memory_usage_percent']?['metric'] = node['memory_usage_percent']['metric'].toStringAsFixed(2);
                                        //   currentNode['memory_usage_percent']?['metric'] = node['memory_usage_percent']['metric'].toString();
                                        // }else{
                                        //   currentNode['memory_usage_percent']?['metric'] = "-";
                                        // }



                                        currentNode['cpu_percent']?['metric'] = node['cpu_percent']['metric'].toStringAsFixed(2);
                                        currentNode['network_percent']?['incoming'] = node['network_percent']['incoming'].toStringAsFixed(2).toString();
                                        currentNode['network_percent']?['outgoing'] = node['network_percent']['outgoing'].toStringAsFixed(2).toString();
                                        currentNode['memory_usage_percent']?['metric'] = node['memory_usage_percent']['metric'].toStringAsFixed(2);

                                      });

                                    },
                                  ),
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider();
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 150,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 40),
                        child: CardCustomized(
                          width: getScreenWidth(context) * 0.3,
                          height: 350,
                          child: Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 30, bottom: 30),
                                child: const FormattedText(
                                  text: 'Node Information',
                                ),
                              ),
                              SizedBox(
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
                                        Text(currentNode['cpu_percent']!['metric']
                                            .toString() + " %")
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
                                        Text(currentNode['network_percent']!['outgoing'].toString() + " ↑ " + currentNode['network_percent']!['incoming'].toString() + " ↓" )
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
                                        Text(currentNode['memory_usage_percent']!['metric'].toString() + " %")
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          child: ListTile(
                                            title: Text(headings[3]),
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const NodeInfo()),
                                              );
                                            },
                                            icon: Icon(Icons.link_outlined)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  fetchNodes() {
    return {
      "376457674": {
        "cpu_percent": {
          "metric": 16.837,
          "start_timestamp": 1695855960,
          "end_timestamp": 1695855840
        },
        "network_percent": {
          "incoming": 40,
          "outgoing": 50
        },
        "memory_usage_percent": {
          "metric": 43.35463474634031,
          "timestamp": 1695855960
        }
      },
      "376880265": {
        "cpu_percent": {
          "metric": 14.888,
          "start_timestamp": 1695855960,
          "end_timestamp": 1695855840
        },
        "network_percent": {
          "incoming": 30,
          "outgoing": 25
        },
        "memory_usage_percent": {
          "metric": 9.14376958003287,
          "timestamp": 1695855960
        }
      },
      "376880266": {
        "cpu_percent": {
          "metric": 12.662,
          "start_timestamp": 1695855960,
          "end_timestamp": 1695855840
        },
        "network_percent": {
          "incoming": 18,
          "outgoing": 36
        },
        "memory_usage_percent": {
          "metric": 9.435021612011143,
          "timestamp": 1695855960
        }
      },
      "376880267": {
        "cpu_percent": {
          "metric": 16.321,
          "start_timestamp": 1695855960,
          "end_timestamp": 1695855840
        },
        "network_percent": {
          "incoming": 14.6,
          "outgoing": 15
        },
        "memory_usage_percent": {
          "metric": 9.999990045105626,
          "timestamp": 1695855960
        }
      },
      "376880268": {
        "cpu_percent": {
          "metric": 18.561,
          "start_timestamp": 1695855960,
          "end_timestamp": 1695855840
        },
        "network_percent": {
          "incoming": 15.6,
          "outgoing": 45
        },
        "memory_usage_percent": {
          "metric": 10.4690045105626,
          "timestamp": 1695855960
        }
      }
    };
  }
}
