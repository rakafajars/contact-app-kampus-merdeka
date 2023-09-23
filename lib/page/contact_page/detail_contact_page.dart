import 'package:contact_app/model/contact_model.dart';
import 'package:contact_app/widget/text_field_widget.dart';
import 'package:flutter/material.dart';

class DetailContactPage extends StatefulWidget {
  final ContactModel contactModel;

  const DetailContactPage({super.key, required this.contactModel});

  @override
  State<DetailContactPage> createState() => _DetailContactPageState();
}

class _DetailContactPageState extends State<DetailContactPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.contactModel.name;
    phoneController.text = widget.contactModel.phone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Detail Contact'),
        ),
        body: Column(
          children: [
            TextFieldWidget(
              label: 'Name',
              hintText: 'Insert Your Name',
              controller: nameController,
            ),
            TextFieldWidget(
              label: 'Nomor',
              hintText: '+62....',
              controller: phoneController,
              textInputType: TextInputType.phone,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  ContactModel(
                    name: nameController.text,
                    phone: phoneController.text,
                    isEdited: true,
                  ),
                );
              },
              child: const Text('Ubah'),
            )
          ],
        ),
      ),
    );
  }
}
