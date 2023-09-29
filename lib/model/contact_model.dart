class ContactModel {
  final String name;
  final String phone;
  final String? umur;
  final bool isEdited;
  int? index;

  ContactModel({
    required this.name,
    required this.phone,
    this.index,
    this.umur,
    this.isEdited = false,
  });
}
