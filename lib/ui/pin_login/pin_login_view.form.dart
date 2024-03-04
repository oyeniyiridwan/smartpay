// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String PinValueKey = 'pin';

final Map<String, TextEditingController> _PinLoginViewTextEditingControllers =
    {};

final Map<String, FocusNode> _PinLoginViewFocusNodes = {};

final Map<String, String? Function(String?)?> _PinLoginViewTextValidations = {
  PinValueKey: null,
};

mixin $PinLoginView {
  TextEditingController get pinController =>
      _getFormTextEditingController(PinValueKey);

  FocusNode get pinFocusNode => _getFormFocusNode(PinValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_PinLoginViewTextEditingControllers.containsKey(key)) {
      return _PinLoginViewTextEditingControllers[key]!;
    }

    _PinLoginViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _PinLoginViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_PinLoginViewFocusNodes.containsKey(key)) {
      return _PinLoginViewFocusNodes[key]!;
    }
    _PinLoginViewFocusNodes[key] = FocusNode();
    return _PinLoginViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    pinController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    pinController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          PinValueKey: pinController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _PinLoginViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _PinLoginViewFocusNodes.values) {
      focusNode.dispose();
    }

    _PinLoginViewTextEditingControllers.clear();
    _PinLoginViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get pinValue => this.formValueMap[PinValueKey] as String?;

  set pinValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PinValueKey: value}),
    );

    if (_PinLoginViewTextEditingControllers.containsKey(PinValueKey)) {
      _PinLoginViewTextEditingControllers[PinValueKey]?.text = value ?? '';
    }
  }

  bool get hasPin =>
      this.formValueMap.containsKey(PinValueKey) &&
      (pinValue?.isNotEmpty ?? false);

  bool get hasPinValidationMessage =>
      this.fieldsValidationMessages[PinValueKey]?.isNotEmpty ?? false;

  String? get pinValidationMessage =>
      this.fieldsValidationMessages[PinValueKey];
}

extension Methods on FormStateHelper {
  setPinValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PinValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    pinValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      PinValueKey: getValidationMessage(PinValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _PinLoginViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _PinLoginViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      PinValueKey: getValidationMessage(PinValueKey),
    });
