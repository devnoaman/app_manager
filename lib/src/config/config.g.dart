// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyConfig _$MyConfigFromJson(Map json) => $checkedCreate(
      'MyConfig',
      json,
      ($checkedConvert) {
        final val = MyConfig(
          supportedLocales:
              $checkedConvert('supported_locales', (v) => v as String?),
          outputDirectory: $checkedConvert('output_dir', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'supportedLocales': 'supported_locales',
        'outputDirectory': 'output_dir'
      },
    );

Map<String, dynamic> _$MyConfigToJson(MyConfig instance) => <String, dynamic>{
      'supported_locales': instance.supportedLocales,
      'output_dir': instance.outputDirectory,
    };
