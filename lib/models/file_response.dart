import 'dart:convert';

class FileResponse {
  final String fileName;
  final String fileExt;
  final int fileSize;
  final String? fileId;
  final String? fileData;
  final String? url;

  FileResponse({
    required this.fileName,
    required this.fileExt,
    required this.fileSize,
    this.fileId,
    this.fileData,
    this.url,
  });

  bool get isStoredInCloud => url != null;

  FileResponse copyWith({
    String? fileName,
    String? fileId,
    String? fileExt,
    int? fileSize,
    String? fileData,
    String? url,
  }) {
    return FileResponse(
      fileName: fileName ?? this.fileName,
      fileId: fileId ?? this.fileId,
      fileExt: fileExt ?? this.fileExt,
      fileSize: fileSize ?? this.fileSize,
      fileData: fileData ?? this.fileData,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'FileName': fileName,
      'FileId': fileId,
      'FileExt': fileExt,
      'FileSize': fileSize,
      'FileData': fileData,
      'Url': url,
    };
  }

  factory FileResponse.fromMap(Map<String, dynamic> map) {
    return FileResponse(
      fileName: map['FileName'] as String,
      fileExt: map['FileExt'] as String,
      fileSize: map['FileSize'] as int,
      fileId: map['FileId'] != null ? map['FileId'] as String : null,
      fileData: map['FileData'] != null ? map['FileData'] as String : null,
      url: map['Url'] != null ? map['Url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FileResponse.fromJson(String source) => FileResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FileResponse(fileName: $fileName, fileExt: $fileExt, fileSize: $fileSize, fileData: $fileData)';
  }

  @override
  bool operator ==(covariant FileResponse other) {
    if (identical(this, other)) return true;

    return other.fileName == fileName &&
        other.fileExt == fileExt &&
        other.fileSize == fileSize &&
        other.fileData == fileData;
  }

  @override
  int get hashCode {
    return fileName.hashCode ^ fileExt.hashCode ^ fileSize.hashCode ^ fileData.hashCode;
  }
}
