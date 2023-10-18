import 'dart:convert';
import 'package:http_parser/http_parser.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sepb_web_app/screens/home.dart';
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
    String heading = "New system";
    bool isLoading = false;

    buildShowDialog(BuildContext context) {
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const Center(
              child: CircularProgressIndicator(color: primaryColor,),
            );
          });
    }

    return Scaffold(
      backgroundColor: backgroundScaffoldColor,
      body: Column(
        children: [
          const NavBar(screenIndex: 0,),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 20),
                        child: FormattedText(
                          text: heading,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 40, top: 20, bottom: 20),
                        child: GestureDetector(
                          onTap: () async {

                            // logicStart
                            var filePickerResult;

                            filePickerResult =
                                await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['json'],
                            ).then((result) => result);

                            if (filePickerResult != null &&
                                filePickerResult.files.isNotEmpty) {

                              final url = Uri.parse('http://localhost:9000/system');
                              final fileName = filePickerResult.names[0];
                              print(fileName);

                              final req = http.MultipartRequest('POST', url)
                                ..files.add(http.MultipartFile.fromBytes(
                                  'file',
                                    filePickerResult.files[0].bytes,
                                  filename: fileName,
                                  contentType: MediaType('application', 'json'),
                                ));

                              req.headers['accept'] = 'application/json';
                              req.headers['Content-Type'] = 'multipart/form-data';

                              setState(() {
                                isLoading = true;
                              });
                              if(isLoading){
                                buildShowDialog(context);
                              }

                              final stream = await req.send();
                              final response = await http.Response.fromStream(stream);


                              setState(() {
                                isLoading = false;
                                Navigator.pop(context);
                              });

                              final status = response.statusCode;
                              if (status != 200) throw Exception('http.send error: statusCode= $status');

                              print(response.body);


                              if (response.statusCode == 200) {
                                // If the server did return a 200 OK response,
                                // then parse the JSON.

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Configuration file uploaded successfully."),
                                  ),
                                );

                                Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));

                              } else {
                                // If the server did not return a 200 OK response,
                                // then throw an exception.
                                // print(response.body);
                                print(response.statusCode);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                    Text("Failed to Post config ${response.body}"),
                                  ),
                                );

                                // print(req.headers);
                                throw Exception('Failed to Post config ${response.body}');
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "filePath empty, please choose a valid file.",
                                  ),
                                ),
                              );
                            }
                            // logicEnd

                          },
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
