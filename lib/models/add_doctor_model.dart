class AddDoctorModel {
  late String doctorName;
  late String email;
  late String pass;
  late String uid;
  AddDoctorModel({
    required this.email,
    required this.pass,
    required this.doctorName,
  });

  factory AddDoctorModel.fromJson(Map<String, dynamic> json) => AddDoctorModel(
      email: json["email"], pass: json["pass"], doctorName: json["doctorName"]);
  Map<String, dynamic> tojJson() => {
        "email": email,
        "pass": pass,
        "doctorName": doctorName,
      };
}
