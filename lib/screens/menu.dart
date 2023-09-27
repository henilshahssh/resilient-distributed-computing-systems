import 'dart:convert';
import 'package:http_parser/http_parser.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
                            var filePickerResult;
                            var jsonFileString;

                            filePickerResult =
                                await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['json'],
                            ).then((result) => result);

                            print("62");
                            if (filePickerResult != null &&
                                filePickerResult.files.isNotEmpty) {
                              jsonFileString =
                                  utf8.decode(filePickerResult.files[0].bytes);

                              // print("68");
                              // var bodyList = [
                              //   "Content-Disposition: form-data; name='fileb'; filename='init.json'",
                              //   "Content-Type: application/json",
                              //   jsonFileString
                              // ];
                              //
                              // final response = await http.post(
                              //     Uri.parse("http://170.64.160.83:9000/files"),
                              //     // headers: {
                              //     //   "Access-Control-Allow-Origin": "*",
                              //     //   'Content-Type': 'application/json',
                              //     //   'Accept': '*/*'
                              //     // },
                              //     body: bodyList);
                              // print(response.body);

                              // final request = http.MultipartRequest(
                              //   'POST',
                              //   Uri.parse('http://170.64.160.83:9000/files'),
                              // );
                              //
                              // request.files.add(
                              //   http.MultipartFile
                              //       .fromString('fileb', jsonFileString, contentType: MediaType('multipart', 'form-data'))
                              // );
                              //
                              // final response = await http.Response.fromStream(await request.send());
                              //
                              // print(response.body);


                              final url = Uri.parse('http://170.64.160.83:9000/files');

                              final req = http.MultipartRequest('POST', url)
                                ..files.add(await http.MultipartFile.fromBytes(
                                  'fileb',
                                    filePickerResult.files[0].bytes,
                                  filename: 'download.json',
                                  contentType: MediaType('application', 'json'),
                                ));

                              req.headers['accept'] = 'application/json';
                              req.headers['Content-Type'] = 'multipart/form-data';

                              final stream = await req.send();
                              final response = await http.Response.fromStream(stream);
                              final status = response.statusCode;
                              if (status != 200) throw Exception('http.send error: statusCode= $status');

                              print(response.body);



                              if (response.statusCode == 200) {
                                // If the server did return a 200 OK response,
                                // then parse the JSON.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Configuration file uploaded."),
                                  ),
                                );
                              } else {
                                // If the server did not return a 200 OK response,
                                // then throw an exception.
                                print(response.body);
                                print(response.statusCode);
                                print(req.headers);
                                throw Exception('Failed to Post config');
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
                          },
                          // child: ElevatedButton(
                          //   onPressed: () {  },
                          //   style: ButtonStyle(
                          //     minimumSize: Size(100, 40)
                          //   ),
                          //   child: const Icon(
                          //     Icons.add_rounded,
                          //     size: 60,
                          //     color: primaryColor,
                          //   ),
                          // ),
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
