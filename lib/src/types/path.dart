import 'package:api_spec/src/types/operation.dart';

class Path {
  final String path;
  final String? summary;
  final String? description;

  final Operation? get;
  final Operation? put;
  final Operation? post;
  final Operation? delete;
  final Operation? options;
  final Operation? head;
  final Operation? patch;
  final Operation? trace;

  const Path({
    required this.path,
    this.summary,
    this.description,
    this.get,
    this.put,
    this.post,
    this.delete,
    this.options,
    this.head,
    this.patch,
    this.trace,
  });
}
