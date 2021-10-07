import 'package:meta/meta.dart';
import 'dart:convert';

class ConduitError {
  ConduitError({
    required this.errors,
  });

  final _Errors errors;

  factory ConduitError.fromRawJson(String str) =>
      ConduitError.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory ConduitError.fromJson(Map<String, dynamic> json) => ConduitError(
        errors: _Errors.fromJson(json["errors"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "errors": errors.toJson(),
      };
}

class _Errors {
  _Errors({
    required this.body,
  });

  final List<String> body;

  factory _Errors.fromRawJson(String str) =>
      _Errors.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory _Errors.fromJson(Map<String, dynamic> json) => _Errors(
        body: List<String>.from(
          (json["body"] as List).map<String>((x) => x.toString()),
        ),
      );

  Map<String, dynamic> toJson() => {
        "body": List<dynamic>.from(body.map((x) => x)),
      };
}
