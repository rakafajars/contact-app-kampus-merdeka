import 'package:contact_app/model/contact_model.dart';
import 'package:contact_app/provider/button_submit_change_notifier.dart';
import 'package:contact_app/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailContactArguments {
  ContactModel contactModel;

  DetailContactArguments({
    required this.contactModel,
  });
}

class DetailContactPage extends StatelessWidget {
  DetailContactPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as DetailContactArguments;

    nameController.text = arguments.contactModel.name;
    phoneController.text = arguments.contactModel.phone;

    final buttonSubmitProvider =
        Provider.of<ButtonSubmitChangeNotifier>(context);

    return Scaffold(
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
          Text(arguments.contactModel.index.toString()),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              buttonSubmitProvider.updateContact(
                ContactModel(
                  name: nameController.text,
                  phone: phoneController.text,
                  index: arguments.contactModel.index,
                ),
                arguments.contactModel.index ?? -1,
              );
            },
            child: const Text('Ubah'),
          )
        ],
      ),
    );
  }
}
