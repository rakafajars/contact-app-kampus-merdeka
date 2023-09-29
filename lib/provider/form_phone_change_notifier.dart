import 'package:flutter/material.dart';

class FormPhoneChangeNotifier with ChangeNotifier {
  String _phoneValue = "";
  String get phoenValue => _phoneValue;

  final TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;

  String? _messageErrorPhone = '';
  String? get messageErrorPhone => _messageErrorPhone;

  void validationPhone(String value) {
    _phoneValue = value;
    if (_phoneValue.isEmpty) {
      _messageErrorPhone = "Nomor Telepon Tidak Boleh Kosng!";
    } else {
      _messageErrorPhone = null;
    }
    notifyListeners();
  }
}
