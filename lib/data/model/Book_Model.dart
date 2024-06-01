// ignore_for_file: file_names, prefer_collection_literals

class BOOK {
  int? id;
  String? slug;
  String? date;
  String? startTime;
  String? endTime;
  bool? disabled;
  bool? confirmed;
  int? patient;
  int? service;
  int? doctor;

  BOOK(
      {this.id,
      this.slug,
      this.date,
      this.startTime,
      this.endTime,
      this.disabled,
      this.confirmed,
      this.patient,
      this.service,
      this.doctor});

  BOOK.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    disabled = json['disabled'];
    confirmed = json['confirmed'];
    patient = json['patient'];
    service = json['service'];
    doctor = json['doctor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['slug'] = slug;
    data['date'] = date;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['disabled'] = disabled;
    data['confirmed'] = confirmed;
    data['patient'] = patient;
    data['service'] = service;
    data['doctor'] = doctor;
    return data;
  }
}
