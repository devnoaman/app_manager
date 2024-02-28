import 'package:path/path.dart' as path;

String introMessage(String currentVersion) => '''
  ════════════════════════════════════════════════
     App Manger , Creating l10n (v$currentVersion)                   
  ════════════════════════════════════════════════
  ''';

/// Relative pubspec.yaml path
String pubspecFilePath = path.join('pubspec.yaml');
String outPutDirectory = '/lib/l10n/';
