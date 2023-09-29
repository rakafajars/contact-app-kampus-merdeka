import 'package:flutter/material.dart';

class FormUsernameChangeNotifier with ChangeNotifier {
  // prorety textfield username
  final String _labelUsername = 'Name';
  String get labelUsername => _labelUsername;

  String _nameValue = "";
  String get nameValue => _nameValue;

  String? _messageErrorNameValue;
  String? get messageErrorNameValue => _messageErrorNameValue;

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  void nameOnChanged(String value) {
    _nameValue = value;
    if (_nameValue.isEmpty) {
      _messageErrorNameValue = "Name Tidak Boleh Kosong";
    } else if (_nameValue.length <= 2) {
      _messageErrorNameValue = "Name Harus Lebih Dari 2 Kata";
    } else {
      _messageErrorNameValue = null;
    }
    notifyListeners();
  }
}
