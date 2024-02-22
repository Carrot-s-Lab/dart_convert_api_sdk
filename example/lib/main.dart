import 'dart:convert';
import 'dart:io';

import 'package:convert_api/convert_api.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final ConvertAPI converApi = ConvertAPI.instance;
  late final Directory tempDir;

  @override
  void initState() {
    converApi.configure(apiKey: '928095461', apiSecret: 'uLchWNHlcgdZlQt1');
    getTemporaryDirectory().then((value) => tempDir = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              final filePickerResult = await FilePicker.platform.pickFiles();

              if (filePickerResult != null) {
                final result = await converApi.convert.xlsx.toCsv(
                  file: File(filePickerResult.files.single.path!),
                  fileName: 'First_file',
                  storeFile: false,
                );

                if (result is ConvertSuccessResponse) {
                  final fileResponse = result.files.first;

                  final convertedFile = File(
                    '${tempDir.path}/${fileResponse.fileName}',
                  );

                  await convertedFile
                      .writeAsBytes(base64Decode(fileResponse.fileData!));

                  final xFile = XFile(
                    convertedFile.path,
                    name: fileResponse.fileName,
                  );

                  Share.shareXFiles([xFile]);
                }
              }
            },
            child: const Text('Select File'),
          ),
        ),
      ),
    );
  }
}
