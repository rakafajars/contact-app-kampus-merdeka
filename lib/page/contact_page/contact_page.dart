import 'package:contact_app/model/contact_model.dart';
import 'package:contact_app/page/contact_page/detail_contact_page.dart';
import 'package:contact_app/page/contact_page/widget/header_contact_page.dart';
import 'package:contact_app/theme/theme_color.dart';
import 'package:contact_app/theme/theme_text_style.dart';
import 'package:contact_app/widget/button_widget.dart';
import 'package:contact_app/widget/text_field_widget.dart';
import 'package:flutter/material.dart';

class ContacePage extends StatefulWidget {
  const ContacePage({super.key});

  @override
  State<ContacePage> createState() => _ContacePageState();
}

class _ContacePageState extends State<ContacePage> {
  // Value
  String _nameValue = "";
  String _phoneValue = "";

  // Message Error
  String? messageErrorNameValue;

  List<ContactModel> contactModel = [];

  void nameOnChanged(String value) {
    if (_nameValue.isEmpty) {
      messageErrorNameValue = "Name Tidak Boleh Kosong";
    } else if (_nameValue.length <= 2) {
      messageErrorNameValue = "Name Harus Lebih Dari 2 Kata";
    } else {
      messageErrorNameValue = null;
    }
    setState(() {});
  }

  // void addContact() {
  //   contactModel.add(ContactModel(
  //     name: _nameValue,
  //     phone: _phoneValue,
  //     umur: "10",
  //   ));
  //   resetField();

  //   setState(() {});
  // }

  void removeContact(int index) {
    contactModel.removeAt(index);
    setState(() {});
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  int selectIndexContact = -1;

  // void updateContact(int index) {
  //   if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty) {
  //     contactModel[index] = ContactModel(
  //       name: _nameValue,
  //       phone: _phoneValue,
  //       umur: "10",
  //     );
  //     resetField();

  //     index = -1;
  //     setState(() {});
  //   }
  // }

  void resetField() {
    _nameController.clear();
    _phoneController.clear();
    _nameValue = "";
    _phoneValue = "";
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  var nilaiDariHalamanB = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor().whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Contact',
          style: ThemeTextStyle().m3DisplayLarge,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const HeaderContactPage(),
          TextFieldWidget(
            label: 'Name',
            hintText: 'Insert Your Name',
            controller: _nameController,
            errorText: messageErrorNameValue,
            onChanged: (val) {
              _nameValue = val;

              nameOnChanged(_nameValue);
              setState(() {});
            },
          ),
          TextFieldWidget(
            label: 'Nomor',
            hintText: '+62....',
            controller: _phoneController,
            textInputType: TextInputType.phone,
            onChanged: (val) {
              _phoneValue = val;
              setState(() {});
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                  title: 'Submit',
                  onPressed: _nameValue.isNotEmpty && _phoneValue.isNotEmpty
                      ? () {
                          // if (selectIndexContact == -1) {
                          //   addContact();
                          // } else {
                          //   updateContact(selectIndexContact);
                          // }
                        }
                      : null,
                ),
              ],
            ),
          ),
          const SizedBox(height: 49),
          Text(
            'List Contact',
            style: ThemeTextStyle().m3HeadlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: ThemeColor().m3SysLightPurple50,
              borderRadius: BorderRadius.circular(28),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: contactModel.length,
              itemBuilder: (context, index) {
                var contact = contactModel[index];
                return ListTile(
                  leading: const CircleAvatar(
                    child: Text(
                      'A',
                    ),
                  ),
                  title: Text(contact.name),
                  subtitle: Text(contact.phone),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      contact.isEdited == true
                          ? const SizedBox()
                          : IconButton(
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Pindah Halaman ?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.pop(context);

                                            // final value = await Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (_) =>
                                            //         DetailContactPage(
                                            //       contactModel: contact,
                                            //     ),
                                            //   ),
                                            // );

                                            // if (value != null) {
                                            //   final valueDariHalamanDetail =
                                            //       value as ContactModel;
                                            //   contactModel[index] =
                                            //       valueDariHalamanDetail;
                                            //   setState(() {});
                                            // }
                                          },
                                          child: const Text('Edit'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.edit,
                              ),
                            ),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isDismissible: false,
                            enableDrag: false,
                            builder: (context) => SizedBox(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      removeContact(index);
                                    },
                                    child: const Text(
                                      'Delete',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
