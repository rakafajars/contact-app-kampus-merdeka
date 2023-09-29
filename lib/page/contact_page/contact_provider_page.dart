import 'package:contact_app/main.dart';
import 'package:contact_app/model/contact_model.dart';
import 'package:contact_app/page/contact_page/detail_contact_page.dart';
import 'package:contact_app/page/contact_page/widget/header_contact_page.dart';
import 'package:contact_app/provider/button_submit_change_notifier.dart';
import 'package:contact_app/provider/form_phone_change_notifier.dart';
import 'package:contact_app/provider/form_username_change_notifier.dart';
import 'package:contact_app/theme/theme_color.dart';
import 'package:contact_app/theme/theme_text_style.dart';
import 'package:contact_app/widget/button_widget.dart';
import 'package:contact_app/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactProviderPage extends StatelessWidget {
  const ContactProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formUsernameProvider =
        Provider.of<FormUsernameChangeNotifier>(context);
    final formPasswordProvider = Provider.of<FormPhoneChangeNotifier>(context);
    final buttonSubmitProvider =
        Provider.of<ButtonSubmitChangeNotifier>(context);
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
            label: formUsernameProvider.labelUsername,
            hintText: 'Insert Your Name',
            controller: formUsernameProvider.nameController,
            errorText: formUsernameProvider.messageErrorNameValue,
            onChanged: (val) {
              formUsernameProvider.nameOnChanged(val);
            },
          ),
          TextFieldWidget(
            label: 'Nomor',
            hintText: '+62....',
            controller: formPasswordProvider.phoneController,
            textInputType: TextInputType.phone,
            errorText: formPasswordProvider.messageErrorPhone,
            onChanged: (val) {
              formPasswordProvider.validationPhone(val);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                  title: 'Submit',
                  onPressed: formUsernameProvider.nameValue.isNotEmpty &&
                          formPasswordProvider.phoenValue.isNotEmpty
                      ? () {
                          buttonSubmitProvider.addContact(
                            name: formUsernameProvider.nameValue,
                            phone: formPasswordProvider.phoenValue,
                          );
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
              itemCount: buttonSubmitProvider.contactModel.length,
              itemBuilder: (context, index) {
                var contact = buttonSubmitProvider.contactModel[index];
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
                                Navigator.pushNamed(
                                  context,
                                  RoutedNamed.contactDetail,
                                  arguments: DetailContactArguments(
                                    contactModel: ContactModel(
                                      name: contact.name,
                                      phone: contact.phone,
                                      index: index,
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.edit,
                              ),
                            ),
                      IconButton(
                        onPressed: () {
                          buttonSubmitProvider.removeContact(index);
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
