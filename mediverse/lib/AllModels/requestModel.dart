class RequestModel {
  String email;
  String name;
  String licenseNumber;
  String location;
  String orgName;
  String orgType;
  String staff;
  String status;

  RequestModel({
    required this.email,
    required this.name,
    required this.licenseNumber,
    required this.location,
    required this.orgName,
    required this.orgType,
    required this.staff,
    required this.status,
  });
  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      email: json['Email'] as String,
      name: json['Name'] as String,
      licenseNumber: json['License_Number'] as String,
      location: json['Location'] as String,
      orgName: json['Org Name'] as String,
      orgType: json['Org Type'] as String,
      staff: json['Staff'] as String,
      status: json['Status'] as String,
    );
  }
}
