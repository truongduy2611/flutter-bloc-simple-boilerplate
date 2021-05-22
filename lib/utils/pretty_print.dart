import 'dart:convert';

void prettyPrintJson(Map<String, dynamic> input) {
  final dynamic jsonValue = json.encode(input);

  const JsonDecoder decoder = JsonDecoder();
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  final dynamic object = decoder.convert(jsonValue);
  final dynamic prettyString = encoder.convert(object);
  prettyString.split('\n').forEach((dynamic element) => print(element));
}
