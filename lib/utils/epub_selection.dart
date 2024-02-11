import '../providers/epub_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

selectFile(EpubProvider epubProvider) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['json'],
  );

  if (result != null && result.files.isNotEmpty) {
    String? filePath = result.files.first.path;

    if (filePath != null) {
      File selectedFile = File(filePath);

      String selectedEpubJson = await selectedFile.readAsString();

      await epubProvider.loadEpub(selectedEpubJson);
    } else {
      print("Caminho do arquivo é nulo.");
    }
  } else {
    print("Nenhum arquivo selecionado.");
  }
}
