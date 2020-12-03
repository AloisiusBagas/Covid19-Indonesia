import 'dart:convert';

List<RumahSakit> rumahSakitFromJson(String str) =>
    List<RumahSakit>.from(json.decode(str).map((x) => RumahSakit.fromJson(x)));

String rumahSakitToJson(List<RumahSakit> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RumahSakit {
  RumahSakit({
    this.name,
    this.address,
    this.region,
    this.phone,
    this.province,
  });

  String name;
  String address;
  String region;
  String phone;
  String province;

  factory RumahSakit.fromJson(Map<String, dynamic> json) => RumahSakit(
        name: json["name"],
        address: json["address"],
        region: json["region"],
        phone: json["phone"] == null ? null : json["phone"],
        province: json["province"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "region": region,
        "phone": phone == null ? null : phone,
        "province": province,
      };
}
