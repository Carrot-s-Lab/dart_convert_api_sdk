// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'convert_api_response.dart';
import 'file_response.dart';

class ConvertSuccessResponse extends ConvertApiResponse {
  final int conversionCost;
  final List<FileResponse> files;

  ConvertSuccessResponse({
    required this.conversionCost,
    required this.files,
  });

  ConvertSuccessResponse copyWith({
    int? conversionCost,
    List<FileResponse>? files,
  }) {
    return ConvertSuccessResponse(
      conversionCost: conversionCost ?? this.conversionCost,
      files: files ?? this.files,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ConversionCost': conversionCost,
      'Files': files.map((x) => x.toMap()).toList(),
    };
  }

  factory ConvertSuccessResponse.fromMap(Map<String, dynamic> map) {
    return ConvertSuccessResponse(
      conversionCost: map['ConversionCost'] != null ? map['ConversionCost'] as int : 0,
      files: List<FileResponse>.from(
        (map['Files'] as List).map<FileResponse>((x) => FileResponse.fromMap(x)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ConvertSuccessResponse.fromJson(String source) =>
      ConvertSuccessResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ConvertSuccessResponse(conversionCost: $conversionCost, files: $files)';

  @override
  bool operator ==(covariant ConvertSuccessResponse other) {
    if (identical(this, other)) return true;

    return other.conversionCost == conversionCost && listEquals(other.files, files);
  }

  @override
  int get hashCode => conversionCost.hashCode ^ files.hashCode;
}
