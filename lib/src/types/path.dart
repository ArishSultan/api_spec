part of api_spec.types;

class Path {
  final String path;
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

  static Map<String, int> extractParameter(String path) {
    var paraIndex = <String, int>{};
    var rawStrList = path.split('/').where((element) => element.isNotEmpty).toList();

    var i = 0;
    for(var str in rawStrList) {
      if (str[0] == '{'){
        paraIndex[str.substring(1, str.length)] = i;
        ++i;
      }
    }
    return paraIndex;
  }
}
