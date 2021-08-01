part of api_spec.types;

enum ParameterIn {
  query,
  path,
  header,
  cookie
}

enum ParameterStyle {
  matrix,
  label,
  form,
  simple,
  spaceDelimited,
  pipeDelimited,
  deepObject
}

class Parameter {
  final String name;
  final ParameterIn $in;
  final String? description;
  final bool required;
  final bool? deprecated;
  final bool? allowEmptyValue;
  final ParameterStyle? style;
  final bool? explode;
  final bool? allowReserved;

  /// TODO(arish): link it to schema object.
  final dynamic schema;
  final dynamic example;
  final dynamic examples;
  final Map<String, dynamic>? content;

  const Parameter({
    required this.$in,
    required this.required,
    required this.name,
    this.description,
    this.deprecated,
    this.allowEmptyValue,
    this.style,
    this.explode,
    this.allowReserved,
    this.schema,
    this.example,
    this.examples,
    this.content,
  });
}
