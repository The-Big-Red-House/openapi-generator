//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FileSchemaTestClass {
  /// Returns a new [FileSchemaTestClass] instance.
  FileSchemaTestClass({
    this.file,
    this.files = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ModelFile? file;

  List<ModelFile> files;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FileSchemaTestClass &&
     other.file == file &&
     other.files == files;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (file == null ? 0 : file!.hashCode) +
    (files.hashCode);

  @override
  String toString() => 'FileSchemaTestClass[file=$file, files=$files]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (file != null) {
      _json[r'file'] = file;
    } else {
      _json[r'file'] = null;
    }
      _json[r'files'] = files;
    return _json;
  }

  /// Returns a new [FileSchemaTestClass] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FileSchemaTestClass? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "FileSchemaTestClass[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "FileSchemaTestClass[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FileSchemaTestClass(
        file: ModelFile.fromJson(json[r'file']),
        files: ModelFile.listFromJson(json[r'files']) ?? const [],
      );
    }
    return null;
  }

  static List<FileSchemaTestClass>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FileSchemaTestClass>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FileSchemaTestClass.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FileSchemaTestClass> mapFromJson(dynamic json) {
    final map = <String, FileSchemaTestClass>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FileSchemaTestClass.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FileSchemaTestClass-objects as value to a dart map
  static Map<String, List<FileSchemaTestClass>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FileSchemaTestClass>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FileSchemaTestClass.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

