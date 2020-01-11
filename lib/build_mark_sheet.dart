import 'package:flutter/material.dart';
import 'package:flutter_app/model.dart';

class MarkSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: MyTable(),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              flex: 1,
              child: MyTable(),
            ),
          ],
        )
      ],
    );
  }

  Widget MyTable() {
    return Table(
      border: TableBorder.all(color: Colors.black, width: 1.0),
      children: students.map((student) {
        return TableRow(children: [
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: containerText(students.indexOf(student).toString()),
              ),
              Expanded(
                flex: 2,
                child: containerText(student.name),
              ),
              Expanded(
                flex: 1,
                child: containerText(student.roll.toString()),
              ),
              Expanded(
                flex: 1,
                child: containerText(""),
              ),
              Expanded(
                flex: 1,
                child: containerText(""),
              ),
              Expanded(
                flex: 1,
                child: containerText(""),
              )
            ],
          )
        ]);
      }).toList()..insert(0, TableRow(
          children: [
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: containerText("S.No", bold: true),
                ),
                Expanded(
                  flex: 2,
                  child: containerText("Name", bold: true),
                ),
                Expanded(
                  flex: 1,
                  child: containerText("Roll", bold: true),
                ),
                Expanded(
                  flex: 1,
                  child: containerText("WR", bold: true),
                ),
                Expanded(
                  flex: 1,
                  child: containerText("MCQ", bold: true),
                ),
                Expanded(
                  flex: 1,
                  child: containerText("TOTAL", bold: true),
                )
              ],
            )
          ]
      )),
    );
  }

  Widget containerText(String text, {bool bold = false}) {
    return Container(
      decoration: BoxDecoration(
          border: Border(right: BorderSide(color: Colors.black, width: 1.0))),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: bold ? Text(text, style: TextStyle(fontWeight: FontWeight.bold),) :  Text(text),
      ),
    );
  }

}
