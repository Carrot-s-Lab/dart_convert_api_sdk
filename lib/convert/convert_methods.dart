import 'package:convert_api/convert/from/from_doc.dart';

import '../client/convert_http_client.dart';
import 'from/from_docx.dart';
import 'from/from_pdf.dart';
import 'from/from_xlsx.dart';

class ConvertMethods {
  final ConvertHttpClient client;

  ConvertMethods(this.client) {
    pdf = FromPdfMethods(client);
    docx = FromDocxMethods(client);
    xlsx = FromXlsxMethods(client);
    doc = FromDocMethods(client);
  }

  // From A To B Methods
  late final FromPdfMethods pdf;
  late final FromDocxMethods docx;
  late final FromDocMethods doc;
  late final FromXlsxMethods xlsx;
}
