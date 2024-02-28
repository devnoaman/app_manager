import 'dart:io';
import 'package:app_manager/constants.dart';
import 'package:app_manager/src/version.dart';
import 'package:app_manager/genl10n.dart' as genl10n;

void main(List<String> args) {
  print(introMessage(packageVersion));
  stdout.writeln('Generates Localizations for your app');
  stdout.writeln('loading pubspec.yaml');
  genl10n.createLocalizations(args);
}
