import 'package:flutter/material.dart';
import 'package:sepb_web_app/widgets/cardCustomized.dart';
import 'package:sepb_web_app/widgets/formattedText.dart';
import 'package:sepb_web_app/widgets/navBar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavBar(),
          SizedBox(
            height: 20,
          ),
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: 1300,
              height: 550,
              padding: EdgeInsets.fromLTRB(25, 25, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  const FormattedText(text: 'Current state of the system'),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(25, 25, 0, 0),
                    width: 400,
                    height: 450,
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(25, 25, 0, 0),
                            child: FormattedText(
                              text: 'Node Information',
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ListView(
                            shrinkWrap: true,
                            // Ensure the ListView takes only the necessary space
                            children: const [
                              ListTile(
                                title: FormattedText(text:'CPU:'),
                              ),
                              Divider(),
                              ListTile(
                                title: FormattedText(text:'Network:'),
                              ),
                              Divider(),
                              ListTile(
                                title: FormattedText(text:'Memory:'),
                              ),
                              Divider(),
                              ListTile(
                                title: FormattedText(text:'View More:'),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
