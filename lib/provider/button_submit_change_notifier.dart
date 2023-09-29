import 'package:contact_app/model/contact_model.dart';
import 'package:flutter/material.dart';

class ButtonSubmitChangeNotifier with ChangeNotifier {
  final List<ContactModel> _contactModel = [];
  List<ContactModel> get contactModel => _contactModel;

  void addContact({
    required String name,
    required String phone,
  }) {
    _contactModel.add(
      ContactModel(
        name: name,
        phone: phone,
      ),
    );
    notifyListeners();
  }

  void removeContact(int index) {
    _contactModel.removeAt(index);
    notifyListeners();
  }

  void updateContact(
    ContactModel? value,
    int index,
  ) {
    if (value != null) {
      final valueDariHalamanDetail = value;
      contactModel[index] = valueDariHalamanDetail;
    }
    notifyListeners();
  }
}
