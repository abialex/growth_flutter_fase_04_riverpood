import 'package:flutter/material.dart';

/// Validator signature used by Flutter form fields.
typedef AppValidator = FormFieldValidator<String>;

/// Reusable validators for common form field constraints.
///
/// Validators skip empty values by default when they represent a format or
/// length rule. Combine them with [AppValidators.requiredField] when the field
/// is mandatory.
abstract final class AppValidators {
  /// Validates that value contains non-whitespace characters.
  static AppValidator requiredField({
    String message = 'Campo requerido.',
  }) {
    return (value) => value?.trim().isNotEmpty ?? false ? null : message;
  }

  /// Validates that a non-empty value has at least minLength characters.
  static AppValidator minLength({
    required int minLength,
    String? message,
  }) {
    _validateLengthArgument(minLength, 'minLength');
    return (value) {
      if (value == null || value.isEmpty || value.length >= minLength) {
        return null;
      }
      return message ?? 'Debe tener al menos $minLength caracteres.';
    };
  }

  /// Validates that a non-empty value has at most maxLength characters.
  static AppValidator maxLength({
    required int maxLength,
    String? message,
  }) {
    _validateLengthArgument(maxLength, 'maxLength');
    return (value) {
      if (value == null || value.isEmpty || value.length <= maxLength) {
        return null;
      }
      return message ?? 'No puede tener más de $maxLength caracteres.';
    };
  }

  /// Validates that a non-empty value has exactly length characters.
  static AppValidator exactLength({
    required int length,
    String? message,
  }) {
    _validateLengthArgument(length, 'length');
    return (value) {
      if (value == null || value.isEmpty || value.length == length) {
        return null;
      }
      return message ?? 'Debe tener exactamente $length caracteres.';
    };
  }

  /// Validates an email address.
  ///
  /// Empty values are valid when allowEmpty is true, which allows this
  /// validator to be composed with [requiredField].
  static AppValidator email({
    bool allowEmpty = true,
    String message = 'Ingresa un correo válido.',
  }) {
    final emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    return (value) {
      final email = value?.trim() ?? '';
      if (email.isEmpty) {
        return allowEmpty ? null : message;
      }
      return emailPattern.hasMatch(email) ? null : message;
    };
  }

  /// Validates a password with configurable security requirements.
  static AppValidator password({
    int minLength = 6,
    bool requireUppercase = false,
    bool requireLowercase = false,
    bool requireDigit = false,
    bool requireSpecialCharacter = false,
    String emptyMessage = 'Campo requerido.',
    String? minLengthMessage,
    String uppercaseMessage = 'Debe tener al menos una mayúscula.',
    String lowercaseMessage = 'Debe tener al menos una minúscula.',
    String digitMessage = 'Debe tener al menos un número.',
    String specialCharacterMessage =
        'Debe tener al menos un carácter especial.',
  }) {
    _validateLengthArgument(minLength, 'minLength');
    final specialCharacterPattern = RegExp(r'[^\w\s]');

    return (value) {
      if (value == null || value.isEmpty) {
        return emptyMessage;
      }
      if (value.length < minLength) {
        return minLengthMessage ?? 'Debe tener al menos $minLength caracteres.';
      }
      if (requireUppercase && !RegExp('[A-Z]').hasMatch(value)) {
        return uppercaseMessage;
      }
      if (requireLowercase && !RegExp('[a-z]').hasMatch(value)) {
        return lowercaseMessage;
      }
      if (requireDigit && !RegExp(r'\d').hasMatch(value)) {
        return digitMessage;
      }
      if (requireSpecialCharacter && !specialCharacterPattern.hasMatch(value)) {
        return specialCharacterMessage;
      }
      return null;
    };
  }

  /// Validates that a non-empty numeric value does not exceed the maxValue
  /// parameter.
  static AppValidator maxNumber({
    required int maxValue,
    String invalidMessage = 'Ingresa un número válido.',
    String? message,
  }) {
    return (value) {
      final normalizedValue = value?.trim() ?? '';
      if (normalizedValue.isEmpty) {
        return null;
      }
      final number = int.tryParse(normalizedValue);
      if (number == null) {
        return invalidMessage;
      }
      return number <= maxValue
          ? null
          : message ?? 'No puede exceder de $maxValue.';
    };
  }

  /// Runs validators in order and returns the first error.
  static AppValidator compose(Iterable<AppValidator> validators) {
    return (value) {
      for (final validator in validators) {
        final error = validator(value);
        if (error != null) {
          return error;
        }
      }
      return null;
    };
  }

  /// Makes the validator optional by accepting empty values.
  static AppValidator optional(AppValidator validator) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return null;
      }
      return validator(value);
    };
  }

  static void _validateLengthArgument(int value, String name) {
    if (value < 0) {
      throw ArgumentError.value(value, name, 'must not be negative');
    }
  }
}
