import 'dart:io';
import 'package:flutter/material.dart';
import '../services/zip_service.dart';

class ZipSelector extends StatefulWidget {
  const ZipSelector({ super.key });

  @override
  State<ZipSelector> createState() => _ZipSelector();
}

class _ZipSelector extends State<ZipSelector> {
  String? _extractedFolder;

  Future<void> _handleZipPick() async {
    final extractedPath = await ZipService.pickAndExtractZip();
    if (extractedPath != null) {
      setState(() {
        _extractedFolder = extractedPath;
      });
    }
  }

  void _showExtractedFiles() {
    final dir = Directory(_extractedFolder!);
    final files = dir
        .listSync(recursive: true)
        .whereType<File>()
        .map((f) => f.path.split('/').last)
        .toList();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Archivos dentro del ZIP'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: files.map((name) => Text(name)).toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ZIP Picker & Extractor')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _handleZipPick,
              child: const Text('Seleccionar ZIP'),
            ),
            const SizedBox(height: 20),
            if (_extractedFolder != null) ...[
              Text(
                'Descomprimido en:\n$_extractedFolder',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _showExtractedFiles,
                child: const Text('Ver contenidos'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
