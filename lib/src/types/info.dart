part of api_spec.types;

class Info {
  final String title;
  final String? summary;
  final String? description;
  final String? termsOfService;
  final Contact? contact;
  final License? license;
  final String version;

  const Info({
    required this.title,
    required this.version,
    this.summary,
    this.description,
    this.termsOfService,
    this.contact,
    this.license,
  });
}
