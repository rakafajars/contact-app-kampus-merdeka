class ContactModel {
  final String name;
  final String phone;
  final String? umur;
  final bool isEdited;

  ContactModel({
    required this.name,
    required this.phone,
    this.umur,
    this.isEdited = false,
  });
}
