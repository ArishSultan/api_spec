import 'dart:convert';
import 'dart:io';

import 'package:api_spec/api_spec.dart';
import 'package:api_spec/src/parser.dart';
import 'package:api_spec/src/utils/converters.dart';
import 'package:path/path.dart';
import 'package:yaml/yaml.dart';

enum ApiSpecificationInputType { json, yaml }

class ApiSpecificationReader {
  static ApiSpecification readMap(Map<String, dynamic> rawData) {
    return ApiSpecificationParser.parse(rawData);
  }

  static ApiSpecification readString(
    String content,
    ApiSpecificationInputType inputType,
  ) {
    final data = <String, dynamic>{};

    switch (inputType) {
      case ApiSpecificationInputType.json:
        final rawData = jsonDecode(content);
        if (rawData is! Map<String, dynamic>) {
          throw '[content] must be a single object i.e. Map type of dart.';
        }

        data.addAll(rawData);
        break;
      case ApiSpecificationInputType.yaml:
        final rawData = loadYaml(content);
        if (rawData is! YamlMap) {
          throw '[content] must be a single object i.e. Map type of dart.';
        }

        data.addAll(convertYamlMapToJsonMap(rawData));
        break;
    }

    return readMap(data);
  }

  static ApiSpecification readFile(
    File file, [
    ApiSpecificationInputType? inputType,
  ]) {
    if (inputType == null) {
      switch (extension(file.path)) {
        case '.json':
          inputType = ApiSpecificationInputType.json;
          break;
        case '.yaml':
          inputType = ApiSpecificationInputType.yaml;
          break;
        default:
          throw 'Either provide a [inputType] or '
              'provide extension in file path';
      }
    }

    return readString(file.readAsStringSync(), inputType);
  }
}
