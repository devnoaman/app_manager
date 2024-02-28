import 'dart:io';

import 'package:app_manager/src/config/config.dart';
import 'package:path/path.dart' as path;
// import 'package:path_provider/path_provider.dart';

Future<void> createLocalizations(List<String> arguments) async {
  final config = MyConfig.loadConfigFromPubSpec();
  print(config?.supportedLocales);
  print(
    path.join('/lib'),
  );
  var i = await _createDirectory();
  if (i) {
    // start generation process
  }
}

// CREATE a new directory for the output folder,

Future<bool> _createDirectory() async {
  // var myDir = Directory(
  //   path.join(outPutDirectory),
  // );
  // our base file
  final File file = File('lib/l10n/app_en.arb');
  if (!file.existsSync()) {
    stdout.writeln('you dont have added arb files inside lib/l10n');
    return false;
  } else {
    return true;
  }

  // Directory appDocDirectory = await getApplicationDocumentsDirectory();
  // print(myDir.path);
  // var exist = await myDir.exists();
  // // print(appDocDirectory);
  // if (exist) {
  //   print('we have it');
  // } else {
  //   // var directory = await Directory(myDir.path).create(recursive: true)
  //   //     // .then((value) =>);
  //   //     ;
  //   // print('created: ${directory}');
  //   print('we not have it');
  // }
}
