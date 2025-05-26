import 'package:flutter/material.dart';
import 'package:flutx_plus/extensions/string_extension.dart';
import 'package:flutx_plus/validation/field_validator.dart';

class FxFormValidator {
  Map<String, dynamic> errors = {};
  Map<String, dynamic> remainingError = {};
  GlobalKey<FormState> formKey = GlobalKey();
  bool consumeError = true;

  // Map<String, FxFieldValidator> _validators = {};
  final Map<String, dynamic> _validators = {};
  final Map<String, TextEditingController> _controllers = {};
  final Map<String, dynamic> _data = {};

  void addField<T>(String name,
      {bool required = false,
      List<FxFieldValidatorRule<T>> validators = const [],
      String? label,
      TextEditingController? controller}) {

    _validators[name] = _createValidation<T>(name, required: required, validators: validators, label: label);
    if (controller != null) _controllers[name] = controller;
  }

  FxFieldValidator<T>? getValidation<T>(String name) =>
      _validators[name] != null ? _validators[name] as FxFieldValidator<T> : null;
  TextEditingController? getController(String name) => _controllers[name];

  FxFieldValidator<T> _createValidation<T>(String name,
      {bool required = false, List<FxFieldValidatorRule<T>> validators = const [], String? label}) {
    return (T? value) {
      label ??= name.capitalize;
      final String? error = getError(name);
      if (error != null) {
        return error;
      }

      if (required && (value == null || (value.toString().isEmpty))) {
        return '$label is required';
      }
      for (FxFieldValidatorRule validator in validators) {
        final String? validationError = validator.validate(value, required, getData());
        if (validationError != null) {
          return validationError;
        }
      }
      return null;
    };
  }

  String? getError(String name) {
    if (errors.containsKey(name)) {
      final dynamic error = errors[name];

      if (error is List && error.isNotEmpty) {
        final String errorText = error[0].toString();
        if (consumeError) {
          remainingError.remove(name);
        }
        return errorText;
      } else {
        final String errorText = error.toString();
        if (consumeError) {
          remainingError.remove(name);
        }
        return errorText;
      }
    }
    return null;
  }

  bool validateForm({bool clear = false, bool consumeError = true}) {
    if (clear) {
      errors.clear();
      remainingError.clear();
    }
    this.consumeError = consumeError;

    return formKey.currentState?.validate() ?? false;
  }

  ValueChanged<T> onChanged<T>(String key) {
    return (T value) {
      _data[key] = value;
    };
  }

  Map<String, dynamic> getData() {
    final map = {
      ..._data,
    };
    for (var key in _controllers.keys) {
      if (_controllers[key]?.text != null) {
        map[key] = _controllers[key]!.text;
      }
    }

    return map;
  }

  void resetForm() {
    formKey.currentState?.reset();
  }

  void clearErrors() {
    errors.clear();
  }

  void addError(String key, dynamic error) {
    errors[key] = error;
  }

  void addErrors(Map<String, dynamic> errors) {
    errors.forEach((key, value) {
      this.errors[key] = value;
    });
  }
}
