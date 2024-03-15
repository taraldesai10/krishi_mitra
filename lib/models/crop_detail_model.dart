class CropDetail {
  late String cropName;
  late String condition;
  late String date;
  late String acres;
  late String picture;
  late String name;
  late String uid;
  CropDetail({
    required this.acres,
    required this.condition,
    required this.cropName,
    required this.date,
    required this.picture,
    required this.name,
    required this.uid,
  });
  factory CropDetail.fromJson(Map<String, dynamic> json) => CropDetail(
      acres: json["acres"],
      condition: json["condition"],
      cropName: json["cropName"],
      date: json["date"],
      picture: json["picture"],
      name: json["name"],
      uid: json["uid"]);
  Map<String, dynamic> toJson() => {
        "acres": acres,
        "condition": condition,
        "cropName": cropName,
        "date": date,
        "picture": picture,
        "name": name,
        "uid": uid,
      };
}
