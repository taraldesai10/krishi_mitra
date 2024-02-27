class CropDetail {
  String cropName;
  String condition;
  String date;
  String acres;
  String picture;
  String name;

  CropDetail(
      {required this.acres,
      required this.condition,
      required this.cropName,
      required this.date,
      required this.picture,
      required this.name});
  factory CropDetail.fromJson(Map<String, dynamic> json) => CropDetail(
      acres: json["acres"],
      condition: json["condition"],
      cropName: json["cropName"],
      date: json["date"],
      picture: json["picture"],
      name: json["name"]);
  Map<String, dynamic> toJson() => {
        "acres": acres,
        "condition": condition,
        "cropName": cropName,
        "date": date,
        "picture": picture,
        "name": name
      };
}
