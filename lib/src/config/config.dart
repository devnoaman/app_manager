import 'dart:io';

import 'package:checked_yaml/checked_yaml.dart' as yaml;
import 'package:json_annotation/json_annotation.dart';
import 'package:app_manager/constants.dart' as constants;
import 'package:path/path.dart' as path;

part 'config.g.dart';

// / A model representing the app_manager teanslations Configuration
@JsonSerializable(
  anyMap: true,
  checked: true,
)
class MyConfig {
  MyConfig({
    this.supportedLocales,
    this.outputDirectory,
    this.arbDirectory,
  });

  /// android adaptive_icon_background image
  @JsonKey(name: 'supported_locales')
  final String? supportedLocales;
  @JsonKey(name: 'output_dir')
  final String? outputDirectory;
  @JsonKey(name: 'arb_dir')
  final String? arbDirectory;

  /// Creates [MyConfig] data from [json]
  factory MyConfig.fromJson(Map json) => _$MyConfigFromJson(json);

  /// Converts MyConfig to [Map]
  Map<String, dynamic> toJson() => _$MyConfigToJson(this);

  /// Loads flutter launcher icons config from `pubspec.yaml` file
  static MyConfig? loadConfigFromPubSpec() {
    return _getConfigFromPubspecYaml(
      pathToPubspecYamlFile: constants.pubspecFilePath,
    );
  }

  static MyConfig? _getConfigFromPubspecYaml({
    required String pathToPubspecYamlFile,
  }) {
    final configFile = File(path.join(pathToPubspecYamlFile));
    if (!configFile.existsSync()) {
      return null;
    }
    final configContent = configFile.readAsStringSync();
    try {
      return yaml.checkedYamlDecode<MyConfig?>(
        configContent,
        (Map<dynamic, dynamic>? json) {
          if (json != null) {
            // handle whether there is app_manager property inside the pubspec.yaml
            // file
            if (json['app_manager'] != null) {
              return MyConfig.fromJson(json['app_manager']);
            }
          }
          return null;
        },
        allowNull: true,
      );
    }
    // on yaml.ParsedYamlException catch (e) {
    //   throw Exception(e.formattedMessage);
    // }

    catch (e) {
      stdout.writeln(e.toString());
      rethrow;
    }
  }

  @override
  String toString() => 'App Manager Config: ${toJson()}';
}
