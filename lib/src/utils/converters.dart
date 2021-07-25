import 'dart:collection';

import 'package:yaml/yaml.dart';

/// Converts [YamlMap] and [YamlList] to native dart [Map] and [List].
///
/// It is used to remove type inconsistencies. types inside `yaml` package
/// provide same functionalities as native types but cause issues with type
/// system.
///
/// Since Api Specifications are written in two famous data formats `json` and
/// `yaml`, so converting both the inputs into same types is necessary for
/// parsing the Api Specification.
Map<String, dynamic> convertYamlMapToJsonMap(YamlMap map) {
  final data = <String, dynamic>{};
  final queue = Queue.of([MapEntry<dynamic, dynamic>(data, map)]);

  while (queue.isNotEmpty) {
    final item = queue.removeFirst();

    if (item.value is List) {
      for (final entry in item.value as List) {
        if (entry is YamlMap) {
          final object = {};
          if (item.key is Map) {
            throw 'Not Possible';
            // item.key[entry.key] = object;
          } else {
            (item.key as List).add(object);
          }
          queue.add(MapEntry(object, entry.value));
        } else if (entry is YamlList) {
          final list = [];
          if (item.key is Map) {
            throw 'Not Possible';
            // item.key[entry.key] = list;
          } else {
            (item.key as List).add(list);
          }
          queue.add(MapEntry(list, entry.value));
        } else {
          if (item.key is Map) {
            throw 'Not Possible';
            // item.key[entry.key] = entry.value;
          } else {
            (item.key as List).add(entry.value);
          }
        }
      }
    } else {
      for (final entry in item.value.entries) {
        if (entry.value is YamlMap) {
          final object = {};
          if (item.key is Map) {
            item.key[entry.key] = object;
          } else {
            (item.key as List).add(object);
          }
          queue.add(MapEntry(object, entry.value));
        } else if (entry.value is YamlList) {
          final list = [];
          if (item.key is Map) {
            item.key[entry.key] = list;
          } else {
            (item.key as List).add(list);
          }
          queue.add(MapEntry(list, entry.value));
        } else {
          if (item.key is Map) {
            item.key[entry.key] = entry.value;
          } else {
            (item.key as List).add(entry.value);
          }
        }
      }
    }
  }

  return data;
}