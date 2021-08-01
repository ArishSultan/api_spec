part of '../parser.dart';

ApiSpecification _parseOpenapi(Map<String, dynamic> data) {
  return ApiSpecification(
    spec: 'openapi',
    info: _parseInfo(data['info']),
    paths: ((data['paths'] ?? {}) as Map<String, dynamic>)
        .entries
        .map((e) => _parsePath(e.key, e.value))
        .toSet()
        .cast<Path>(),
  );
}

Path _parsePath(String path, Map<String, dynamic>? data) {
  return Path(
    path: path,
    summary: data?['summary'],
    description: data?['description'],
    parameters: data?['parameters']?.map((e) => _parseParameter(e)).toList().cast<Parameter>(),
    get: _parseOperation(data?['get']),
    put: _parseOperation(data?['put']),
    post: _parseOperation(data?['post']),
    delete: _parseOperation(data?['delete']),
    options: _parseOperation(data?['options']),
    head: _parseOperation(data?['head']),
    patch: _parseOperation(data?['patch']),
    trace: _parseOperation(data?['trace']),
  );
}

Operation? _parseOperation(Map<String, dynamic>? data) {
  if (data == null) return null;
  return Operation(
    tags: data['tags'],
    summary: data['summary'],
    operationId: data['operationId'],
    description: data['description'],
    parameters: data['parameters']?.map((e) => _parseParameter(e)).toList().cast<Parameter>(),
    // externalDocs: data?['externalDocs'],
  );
}

Parameter _parseParameter(Map<String, dynamic> data) {
  ParameterStyle? style;
  switch (data['style']) {
    case 'matrix':
      style = ParameterStyle.matrix;
      break;
    case 'label':
      style = ParameterStyle.label;
      break;
    case 'form':
      style = ParameterStyle.form;
      break;
    case 'simple':
      style = ParameterStyle.simple;
      break;
    case 'spaceDelimited':
      style = ParameterStyle.spaceDelimited;
      break;
    case 'pipeDelimited':
      style = ParameterStyle.pipeDelimited;
      break;
    case 'deepObject':
      style = ParameterStyle.deepObject;
      break;
  }

  return Parameter(
    style: style,
    $in: data['in']!,
    name: data['name'],
    schema: data['schema'],
    example: data['example'],
    content: data['content'],
    examples: data['examples'],
    required: data['required'],
    deprecated: data['deprecated'],
    description: data['description'],
    allowReserved: data['allowReserved'],
    allowEmptyValue: data['allowEmptyValue'],
  );
}

Info _parseInfo(Map<String, dynamic>? data) {
  data = checkRequired(data, 'info');

  final title = checkRequired<String>(data?['title'], 'info.title');
  final version = checkRequired<String>(data?['version'], 'info.version');

  return Info(
    title: title,
    version: version,
    summary: data?['summary'],
    description: data?['description'],
    contact: _parseContact(data?['contact']),
    license: _parseLicense(data?['license']),
    termsOfService: data?['termsOfService'],
  );
}

Contact _parseContact(Map<String, dynamic>? data) => Contact(
    name: data?['name'], url: urlVerifier(data?['url']), email: data?['email']);

License _parseLicense(Map<String, dynamic>? data) {
  final name = checkRequired<String>(data?['name'], 'info.license.name');

  return License(
    name: name,
    identifier: data?['identifier'],
    url: urlVerifier(data?['url']),
  );
}
