import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'build_mark_sheet.dart';
import 'build_pdf.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MarkSheet(),
              RaisedButton(
                child: Text("Click"),
                onPressed: () async {
                  final raw = base64.encode(await buildPdf());

                  final List<int> intList = base64.decode(raw);
                  final int8array = Int8List.fromList(intList);
                  final blob = Blob([int8array], 'application/pdf');

                  final url = Url.createObjectUrlFromBlob(blob);

                  final link = AnchorElement()
                    ..href = url
                    ..download = 'hexal_deck.pdf'
                    ..text = 'Download';

                  link.click();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
