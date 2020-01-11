import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_app/model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<List<int>> buildPdf() async {
  final Document pdf = Document(title: 'My Document', author: 'David PHAM-VAN');

  Widget containerText(String text, {bool bold = false}) {
    return Container(
      decoration: BoxDecoration(border: BoxBorder(right: true, width: 1)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: bold
            ? Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            : Text(text, style: TextStyle(fontSize: 9)),
      ),
    );
  }

  Widget containerTextHeader(String text, {bool bold = false}) {
    return Container(
      decoration: BoxDecoration(border: BoxBorder(right: true, width: 1)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: bold
            ? Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
        )
            : Text(text),
      ),
    );
  }

  Widget MyTable() {
    return Table(
      border: TableBorder(color: PdfColors.black, width: 1.0),
      children: students.map((student) {
        return TableRow(children: [
          Expanded(
            flex: 2,
            child: containerText(students.indexOf(student).toString()),
          ),
          Expanded(
            flex: 8,
            child: containerText(student.name),
          ),
          Expanded(
            flex: 2,
            child: containerText(student.roll.toString()),
          ),
          Expanded(
            flex: 3,
            child: containerText(""),
          ),
          Expanded(
            flex: 3,
            child: containerText(""),
          ),
          Expanded(
            flex: 3,
            child: containerText(""),
          )
        ]);
      }).toList()
        ..insert(
            0,
            TableRow(children: [
              Expanded(
                flex: 2,
                child: containerTextHeader("No", bold: true),
              ),
              Expanded(
                flex: 8,
                child: containerTextHeader("Name", bold: true),
              ),
              Expanded(
                flex: 2,
                child: containerTextHeader("Roll", bold: true),
              ),
              Expanded(
                flex: 3,
                child: containerTextHeader("WR", bold: true),
              ),
              Expanded(
                flex: 3,
                child: containerTextHeader("MCQ", bold: true),
              ),
              Expanded(
                flex: 3,
                child: containerTextHeader("TOTAL", bold: true),
              )
            ])),
    );
  }

  final ByteData fontData = await rootBundle.load('assets/Roboto-Regular.ttf');
  final ttf = Font.ttf(fontData.buffer.asByteData());

  final ByteData fontDatab = await rootBundle.load('assets/Roboto-Bold.ttf');
  final ttfb = Font.ttf(fontDatab.buffer.asByteData());

  final PdfPageFormat format = PdfPageFormat(
    595,
    842,
    marginLeft: 1 * PdfPageFormat.cm,
    marginTop: 1 * PdfPageFormat.cm,
    marginRight: 1 * PdfPageFormat.cm,
    marginBottom: 1 * PdfPageFormat.cm,
  );

  pdf.addPage(Page(
    pageFormat: format,
    theme: Theme(
        defaultTextStyle: TextStyle(font: ttf, fontBold: ttfb, fontSize: 10)),
    build: (Context ctx) {
      return Column(
        children: <Widget>[
          Text(
            "Techinical Gove Hight School",
            style: TextStyle(fontSize: 12),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Exam Evaluate Sheet",
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: MyTable(),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: MyTable(),
              ),
            ],
          )
        ],
      );
    },
  ));

  return pdf.save();
}
