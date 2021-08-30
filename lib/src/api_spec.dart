import 'types.dart';

class ApiSpecification {
  final Info info;
  final String spec;
  final Set<Path> paths;


  /// TODO(arish): Add Remaining fields.
  /// ...

  const ApiSpecification({
    required this.info,
    required this.spec,
    this.paths = const {},
  });
}
