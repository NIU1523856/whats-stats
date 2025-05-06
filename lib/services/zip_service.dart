import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:archive/archive_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class ZipService {
  static Future<String?> pickAndExtractZip() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['zip'],
    );
    if (result == null) return null;

    final zipPath = result.files.single.path!;
    final bytes = File(zipPath).readAsBytesSync();
    final archive = ZipDecoder().decodeBytes(bytes);
    final fileName = p.basenameWithoutExtension(zipPath);
    final name = fileName.replaceFirst('Chat de WhatsApp con ', '');


    final appDocDir = await getApplicationDocumentsDirectory();
    final extractDir = Directory('${appDocDir.path}/unzipped');
    if (extractDir.existsSync()) {
      extractDir.deleteSync(recursive: true);
    }
    extractDir.createSync(recursive: true);

    for (final file in archive) {
      final filename = file.name;

      if (file.isFile) {
        if (filename.contains('Chat')) {

        }
      }

      final esDeseado = filename.contains('reporte') || filename.endsWith('.json');

      final outPath = '${extractDir.path}/$filename';

      if (file.isFile) {
        final outFile = File(outPath);
        outFile.createSync(recursive: true);
        outFile.writeAsBytesSync(file.content as List<int>);
      } else {
        Directory(outPath).create(recursive: true);
      }
    }

    return extractDir.path;
  }
}
