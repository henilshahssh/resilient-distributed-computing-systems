import 'package:flutter/material.dart';

import 'logIn.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                width: 1000,
                height: 200,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(25, 25, 0, 0),
                        child: Text(
                          'Account',
                          style: TextStyle(
                            color: Color(0xFF015249),
                            fontSize: 24,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Add some spacing between the text and the ListView
                      Expanded(
                        child: ListView(
                          children: const [
                            ListTile(
                              title: Text(
                                  'Name                Darwisyah Faqihah Mohamad Shahbodin'),
                            ),
                            Divider(),
                            ListTile(
                              title: Text(
                                  'Email                darwisyahfaqihah21@gmail.com'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 1000,
                height: 200,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(25, 25, 0, 0),
                        child: Text(
                          'Dashboard',
                          style: TextStyle(
                            color: Color(0xFF015249),
                            fontSize: 24,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                        child: Text(
                          'Currently viewing Darwisyahs system. Change system here.',
                          style: TextStyle(
                            color: Colors.black, // Customize the color
                            fontSize: 14,
                            fontFamily: 'Open Sans', // Customize the font size
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      // Add some spacing between the text and the ListView
                      Expanded(
                        child: ListView(
                          children: [
                            const Divider(),
                            ListTile(
                              title: const Text('Switch to a different system'),
                              onTap: () {},
                              trailing: const Icon(Icons.account_tree_outlined),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 60,
                margin: const EdgeInsets.only(right: 300),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginIn()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                      color: Color(0xFFD43441),
                      fontSize: 24,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
