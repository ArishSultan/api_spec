part of api_spec.types;

class Path {
  final String path;
  final List<PathSegment> pathSegments;

  final String? summary;
  final String? description;
  final List<Parameter>? parameters;

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
    required this.pathSegments,
    this.summary,
    this.description,
    this.parameters,
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

class PathSegment {
  final String value;
  final bool isPlaceholder;

  const PathSegment({required this.isPlaceholder, required this.value});
}
