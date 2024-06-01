// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, prefer_collection_literals

class PatientsModel {
  int? id;
  String? slug;
  String? firstName;
  String? middleName;
  String? lastName;
  String? birthDate;
  bool? gender;
  String? contactsPhone;
  String? contactsMobile;
  String? financialBalance;
  bool? disabled;
  String? dateCreated;

  PatientsModel(
      {this.id,
      this.slug,
      this.firstName,
      this.middleName,
      this.lastName,
      this.birthDate,
      this.gender,
      this.contactsPhone,
      this.contactsMobile,
      this.financialBalance,
      this.disabled,
      this.dateCreated});

  PatientsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    contactsPhone = json['contacts_phone'];
    contactsMobile = json['contacts_mobile'];
    financialBalance = json['financial_balance'];
    disabled = json['disabled'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['slug'] = slug;
    data['first_name'] = firstName;
    data['middle_name'] = middleName;
    data['last_name'] = lastName;
    data['birth_date'] = birthDate;
    data['gender'] = gender;
    data['contacts_phone'] = contactsPhone;
    data['contacts_mobile'] = contactsMobile;
    data['financial_balance'] = financialBalance;
    data['disabled'] = disabled;
    data['date_created'] = dateCreated;
    return data;
  }
}
