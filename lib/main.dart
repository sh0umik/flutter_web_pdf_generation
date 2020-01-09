import 'dart:html';
import 'dart:typed_data';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/build_pdf.dart';

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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            RaisedButton(
              child: Text("Click"),
              onPressed: () {
                final raw = base64.encode(buildPdf());

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
    );
  }
}
