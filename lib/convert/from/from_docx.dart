import 'dart:io';

import 'package:convert_api/client/convert_http_client.dart';
import 'package:convert_api/models/convert_api_response.dart';
import 'package:convert_api/models/end_line_char.dart';
import 'package:convert_api/models/save_format.dart';
import 'package:convert_api/models/success_response.dart';
import 'package:convert_api/models/text_encoding.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class FromDocxMethods {
  final ConvertHttpClient client;

  FromDocxMethods(this.client);

  /// Convert DOCX to TXT
  /// The API for converting Word documents to Text files.
  /// Read more about the converter here: https://www.convertapi.com/docx-to-txt
  Future<ConvertApiResponse> toTxt({
    /// File to convert
    required File file,

    /// Store converted file on our secure server and provides download URL.
    bool storeFile = false,

    /// Converted output file name without extension. The extension will be added automatically.
    String? fileName,

    /// Sets the password to open protected documents.
    String? password,

    /// Conversion timeout in seconds.
    int timeout = 900,

    /// Replace similar symbols with their counterparts in a text file, such as a copyright symbol with (c).
    bool substitutions = false,

    /// Inserts line breaks at the end of each line of text.
    bool lineBreaks = true,

    /// Specifies what encoding the parser should use when converting text files.
    TextEncoding textEncoding = TextEncoding.auto,

    /// Set end of line character. The character which will be used to break lines.
    EndLineChar endLineChar = EndLineChar.crlf,

    /// Specifies the format to use when saving a document.
    SaveFormat saveFormat = SaveFormat.unicodetext,
  }) async {
    final formData = FormData.fromMap({
      'TextEncoding': textEncoding.value,
      'Timeout': timeout.toString(),
      'EndLineChar': endLineChar.value,
      'FileName': fileName ?? (file.path.split('/').last).split('.').first,
      'LineBreaks': lineBreaks.toString(),
      'SaveFormat': saveFormat.value,
      'Substitutions': substitutions.toString(),
      'Password': password ?? '',
      'File': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
        contentType: MediaType(
          'application',
          'vnd.openxmlformats-officedocument.wordprocessingml.document',
        ),
      ),
      'StoreFile': storeFile,
    });

    try {
      final response = await client.post(
        path: '/convert/docx/to/txt',
        data: formData,
      );

      if (response.statusCode == 200) {
        return ConvertSuccessResponse.fromMap(response.data);
      } else {
        throw Exception(
            'Error ${response.statusCode}: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Error converting file: $e');
    }
  }

  /// Convert DOCX to JPG
  /// The API for converting PDF documents to Text files.
  /// Read more about the converter here: https://www.convertapi.com/pdf-to-jpg
  Future<ConvertApiResponse> toJpg({
    /// File to convert
    required File file,

    /// Store converted file on our secure server and provides download URL.
    bool storeFile = false,

    /// Converted output file name without extension. The extension will be added automatically.
    String? fileName,

    /// Sets the password to open protected documents.
    String? password,

    /// Conversion timeout in seconds.
    int timeout = 600,

    /// Enable optical character recognition(OCR).
    bool enableOcr = true,

    /// Persist formatting while extracting text. Only works when RemoveHeadersFooters and RemoveFootnotes properties are disabled.
    bool includeFormatting = false,

    /// Set page range. Example 1-10 or 1,2,5. Default is 1-2000.
    String pageRange = '1-2000',

    /// Remove tables from the document.
    bool removeTables = true,

    /// Remove footnotes from the document.
    bool removeFootnotes = true,

    /// Remove headers and footers from the document.
    bool removeHeadersFooters = true,
  }) async {
    final formData = FormData.fromMap({
      'StoreFile': storeFile,
      'File': await MultipartFile.fromFile(
        file.path,
        // filename: (file.path.split('/').last).split('.').first,
        filename: file.path.split('/').last,
        contentType: MediaType('application', 'docx'),
      ),
      'FileName': fileName ?? (file.path.split('/').last).split('.').first,
      'Timeout': timeout.toString(),
      'Password': password ?? '',
      'PageRange': pageRange,
      'OcrLanguage': 'automatic',
      'EnableOcr': enableOcr.toString(),
      'IncludeFormatting': includeFormatting.toString(),
      'RemoveHeadersFooters': removeHeadersFooters.toString(),
      'RemoveFootnotes': removeFootnotes.toString(),
      'RemoveTables': removeTables.toString(),
    });

    try {
      final response = await client.post(
        path: '/convert/docx/to/jpg',
        data: formData,
      );

      if (response.statusCode == 200) {
        return ConvertSuccessResponse.fromMap(response.data);
      } else {
        throw Exception(
            'Error ${response.statusCode}: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Error converting file: $e');
    }
  }

  /// Convert DOCX to Pdf
  /// The API for converting Word documents to Text files.
  /// Read more about the converter here: https://www.convertapi.com/doc-to-pdf
  Future<ConvertApiResponse> toPdf({
    /// File to convert
    required File file,

    /// Store converted file on our secure server and provides download URL.
    bool storeFile = false,

    /// Converted output file name without extension. The extension will be added automatically.
    String? fileName,

    /// Sets the password to open protected documents.
    String? password,

    /// Conversion timeout in seconds.
    int timeout = 900,

    /// Replace similar symbols with their counterparts in a text file, such as a copyright symbol with (c).
    bool substitutions = false,

    /// Inserts line breaks at the end of each line of text.
    bool lineBreaks = true,

    /// Specifies what encoding the parser should use when converting text files.
    TextEncoding textEncoding = TextEncoding.auto,

    /// Set end of line character. The character which will be used to break lines.
    EndLineChar endLineChar = EndLineChar.crlf,

    /// Specifies the format to use when saving a document.
    SaveFormat saveFormat = SaveFormat.unicodetext,
  }) async {
    final formData = FormData.fromMap({
      'Timeout': timeout.toString(),
      'FileName': fileName ?? (file.path.split('/').last).split('.').first,
      'Password': password ?? '',
      'File': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
        contentType: MediaType(
          'application',
          'dox',
        ),
      ),
      'StoreFile': storeFile,
      'PageRange': 1,
      'ConvertMarkups': false,
      'ConvertTags': false,
      'ConvertMetadata': true,
      'ConvertHeadings': true,
      'ConvertBookmarks': false,
      'UpdateToc': false,
      'CompressPDF': false,
    });

    try {
      final response = await client.post(
        path: '/convert/docx/to/pdf',
        data: formData,
      );

      if (response.statusCode == 200) {
        return ConvertSuccessResponse.fromMap(response.data);
      } else {
        throw Exception(
            'Error ${response.statusCode}: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Error converting file: $e');
    }
  }
}
