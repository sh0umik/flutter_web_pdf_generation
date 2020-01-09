

import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

List<int> buildPdf() {
  final Document pdf = Document(title: 'My Document', author: 'David PHAM-VAN');

  pdf.addPage(Page(
    build: (Context ctx) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: FittedBox(
          child: Text(
            'Hello!',
            style: TextStyle(color: PdfColors.blueGrey),
          ),
        ),
      );
    },

  ));
  return pdf.save();
}