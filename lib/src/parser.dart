import 'package:api_spec/src/errors/invalid_input_file.dart';

import 'api_spec.dart';
import 'types.dart';
import 'utils/parser.dart';

part 'parsers/openapi_parser.dart';

class ApiSpecificationParser {
  static ApiSpecification parse(Map<String, dynamic> data) {
    if (data.containsKey('openapi') || data.containsKey('swagger')) {
      /// Log message that Openapi specification is found.
      return _parseOpenapi(data);
    }

    throw const InvalidInputFile(InvalidInputFileReason.unRecognized);
  }
}