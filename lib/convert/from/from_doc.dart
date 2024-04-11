import 'dart:io';

import 'package:convert_api/client/convert_http_client.dart';
import 'package:convert_api/models/convert_api_response.dart';
import 'package:convert_api/models/end_line_char.dart';
import 'package:convert_api/models/save_format.dart';
import 'package:convert_api/models/success_response.dart';
import 'package:convert_api/models/text_encoding.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class FromDocMethods {
  final ConvertHttpClient client;

  FromDocMethods(this.client);

  /// Convert DOC to TXT
  /// The API for converting Word documents to Text files.
  /// Read more about the converter here: https://www.convertapi.com/doc-to-txt
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
          'msword',
        ),
      ),
      'StoreFile': storeFile,
    });

    try {
      final response = await client.post(
        path: '/convert/doc/to/txt',
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

  /// Convert DOC to JPG
  /// The API for converting Word documents to Text files.
  /// Read more about the converter here: https://www.convertapi.com/doc-to-jpg
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
          'msword',
        ),
      ),
      'StoreFile': storeFile,
      'PageRange': 2000,
      'ImageResolution': 200,
      'ScaleProportions': true,
      'ImageHeight': 600,
      'ImageWidth': 400,
      'ImageAntialiasing': 8,
      'Rotate': 0,
      'ImageQuality': 75,
      'ColorSpace': 'default',
    });

    try {
      final response = await client.post(
        path: '/convert/doc/to/jpg/',
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

  /// Convert DOC to DOCX
  /// The API for converting Word documents to Text files.
  /// Read more about the converter here: https://www.convertapi.com/doc-to-docx
  Future<ConvertApiResponse> toDocx({
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
          'msword',
        ),
      ),
      'StoreFile': storeFile,
      'UpdateToc': false,
    });

    try {
      final response = await client.post(
        path: '/convert/doc/to/docx',
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

  /// Convert DOC to XLSX
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
          'msword',
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
        path: '/convert/doc/to/pdf',
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
