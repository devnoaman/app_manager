import 'dart:io';
import 'package:args/args.dart';

const String helpFlag = 'help';

main(List<String> arguments) {
  print('Starting localizing application');
  final ArgParser parser = ArgParser(allowTrailingOptions: true);
  parser.addFlag(helpFlag, abbr: 'h', help: 'Usage help', negatable: false);
  // parser.addOption(
  //   'h',
  //   abbr: 'f',
  //   help: 'Path to config file',
  //   defaultsTo: 'defaultConfigFile',
  // );

  final ArgResults argResults = parser.parse(arguments);
  // creating logger based on -v flag
  // final logger = FLILogger(argResults[verboseFlag]);

  print('Received args ${argResults.arguments}');
  if (argResults.arguments.contains(helpFlag)) {
    stdout.writeln('Generates Localizations for your app');
    stdout.writeln(parser.usage);
    exit(0);
  }
  print(arguments);
}
