part of api_spec.types;

class Operation {
  final List<String>? tags;
  final String? summary;
  final String? description;

  /// TODO(arish): change type to ExternalDocs.
  final String? externalDocs;
  final String? operationId;

  const Operation({
    this.tags,
    this.summary,
    this.description,
    this.externalDocs,
    this.operationId,
  });
}
