// ignore_for_file: file_names, prefer_collection_literals, unnecessary_this

class DoctorModel {
  int? id;
  String? password;
  String? lastLogin;
  bool? isSuperuser;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  bool? isStaff;
  bool? isActive;
  String? dateJoined;
  String? clinic;
  int? service;
  List<int>? groups;
  List? userPermissions;

  DoctorModel(
      {this.id,
      this.password,
      this.lastLogin,
      this.isSuperuser,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.isStaff,
      this.isActive,
      this.dateJoined,
      this.clinic,
      this.service,
      this.groups,
      this.userPermissions});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    lastLogin = json['last_login'];
    isSuperuser = json['is_superuser'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    isStaff = json['is_staff'];
    isActive = json['is_active'];
    dateJoined = json['date_joined'];
    clinic = json['clinic'];
    service = json['service'];
    groups = json['groups'].cast<int>();
    if (json['user_permissions'] != null) {
      json['user_permissions'].forEach((v) {
        userPermissions!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['password'] = this.password;
    data['last_login'] = this.lastLogin;
    data['is_superuser'] = this.isSuperuser;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['is_staff'] = this.isStaff;
    data['is_active'] = this.isActive;
    data['date_joined'] = this.dateJoined;
    data['clinic'] = this.clinic;
    data['service'] = this.service;
    data['groups'] = this.groups;
    if (this.userPermissions != null) {
      data['user_permissions'] =
          this.userPermissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
