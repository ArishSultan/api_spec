part of api_spec.types;

class License {
  final String name;
  final String? identifier;
  final String? url;

  const License({required this.name, this.identifier, this.url});
}
