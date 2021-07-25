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
  return Path(path: path);
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
