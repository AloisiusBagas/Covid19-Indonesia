//https://data.covid19.go.id/public/api/update.json
import 'dart:convert';

Indonesia indonesiaFromJson(String str) => Indonesia.fromJson(json.decode(str));

String indonesiaToJson(Indonesia data) => json.encode(data.toJson());

class Indonesia {
  Indonesia({
    this.data,
    this.update,
  });

  Data data;
  Update update;

  factory Indonesia.fromJson(Map<String, dynamic> json) => Indonesia(
        data: Data.fromJson(json["data"]),
        update: Update.fromJson(json["update"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "update": update.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.jumlahOdp,
    this.jumlahPdp,
    this.totalSpesimen,
    this.totalSpesimenNegatif,
  });

  int id;
  int jumlahOdp;
  int jumlahPdp;
  int totalSpesimen;
  int totalSpesimenNegatif;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        jumlahOdp: json["jumlah_odp"],
        jumlahPdp: json["jumlah_pdp"],
        totalSpesimen: json["total_spesimen"],
        totalSpesimenNegatif: json["total_spesimen_negatif"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jumlah_odp": jumlahOdp,
        "jumlah_pdp": jumlahPdp,
        "total_spesimen": totalSpesimen,
        "total_spesimen_negatif": totalSpesimenNegatif,
      };
}

class Update {
  Update({
    this.penambahan,
    this.harian,
    this.total,
  });

  Penambahan penambahan;
  List<Harian> harian;
  Total total;

  factory Update.fromJson(Map<String, dynamic> json) => Update(
        penambahan: Penambahan.fromJson(json["penambahan"]),
        harian:
            List<Harian>.from(json["harian"].map((x) => Harian.fromJson(x))),
        total: Total.fromJson(json["total"]),
      );

  Map<String, dynamic> toJson() => {
        "penambahan": penambahan.toJson(),
        "harian": List<dynamic>.from(harian.map((x) => x.toJson())),
        "total": total.toJson(),
      };
}

class Harian {
  Harian({
    this.keyAsString,
    this.key,
    this.docCount,
    this.jumlahMeninggal,
    this.jumlahSembuh,
    this.jumlahPositif,
    this.jumlahDirawat,
    this.jumlahPositifKum,
    this.jumlahSembuhKum,
    this.jumlahMeninggalKum,
    this.jumlahDirawatKum,
  });

  DateTime keyAsString;
  int key;
  int docCount;
  Jumlah jumlahMeninggal;
  Jumlah jumlahSembuh;
  Jumlah jumlahPositif;
  Jumlah jumlahDirawat;
  Jumlah jumlahPositifKum;
  Jumlah jumlahSembuhKum;
  Jumlah jumlahMeninggalKum;
  Jumlah jumlahDirawatKum;

  factory Harian.fromJson(Map<String, dynamic> json) => Harian(
        keyAsString: DateTime.parse(json["key_as_string"]),
        key: json["key"],
        docCount: json["doc_count"],
        jumlahMeninggal: Jumlah.fromJson(json["jumlah_meninggal"]),
        jumlahSembuh: Jumlah.fromJson(json["jumlah_sembuh"]),
        jumlahPositif: Jumlah.fromJson(json["jumlah_positif"]),
        jumlahDirawat: Jumlah.fromJson(json["jumlah_dirawat"]),
        jumlahPositifKum: Jumlah.fromJson(json["jumlah_positif_kum"]),
        jumlahSembuhKum: Jumlah.fromJson(json["jumlah_sembuh_kum"]),
        jumlahMeninggalKum: Jumlah.fromJson(json["jumlah_meninggal_kum"]),
        jumlahDirawatKum: Jumlah.fromJson(json["jumlah_dirawat_kum"]),
      );

  Map<String, dynamic> toJson() => {
        "key_as_string": keyAsString.toIso8601String(),
        "key": key,
        "doc_count": docCount,
        "jumlah_meninggal": jumlahMeninggal.toJson(),
        "jumlah_sembuh": jumlahSembuh.toJson(),
        "jumlah_positif": jumlahPositif.toJson(),
        "jumlah_dirawat": jumlahDirawat.toJson(),
        "jumlah_positif_kum": jumlahPositifKum.toJson(),
        "jumlah_sembuh_kum": jumlahSembuhKum.toJson(),
        "jumlah_meninggal_kum": jumlahMeninggalKum.toJson(),
        "jumlah_dirawat_kum": jumlahDirawatKum.toJson(),
      };
}

class Jumlah {
  Jumlah({
    this.value,
  });

  int value;

  factory Jumlah.fromJson(Map<String, dynamic> json) => Jumlah(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class Penambahan {
  Penambahan({
    this.jumlahPositif,
    this.jumlahMeninggal,
    this.jumlahSembuh,
    this.jumlahDirawat,
    this.tanggal,
    this.created,
  });

  int jumlahPositif;
  int jumlahMeninggal;
  int jumlahSembuh;
  int jumlahDirawat;
  DateTime tanggal;
  DateTime created;

  factory Penambahan.fromJson(Map<String, dynamic> json) => Penambahan(
        jumlahPositif: json["jumlah_positif"],
        jumlahMeninggal: json["jumlah_meninggal"],
        jumlahSembuh: json["jumlah_sembuh"],
        jumlahDirawat: json["jumlah_dirawat"],
        tanggal: DateTime.parse(json["tanggal"]),
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "jumlah_positif": jumlahPositif,
        "jumlah_meninggal": jumlahMeninggal,
        "jumlah_sembuh": jumlahSembuh,
        "jumlah_dirawat": jumlahDirawat,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "created": created.toIso8601String(),
      };
}

class Total {
  Total({
    this.jumlahPositif,
    this.jumlahDirawat,
    this.jumlahSembuh,
    this.jumlahMeninggal,
  });

  int jumlahPositif;
  int jumlahDirawat;
  int jumlahSembuh;
  int jumlahMeninggal;

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        jumlahPositif: json["jumlah_positif"],
        jumlahDirawat: json["jumlah_dirawat"],
        jumlahSembuh: json["jumlah_sembuh"],
        jumlahMeninggal: json["jumlah_meninggal"],
      );

  Map<String, dynamic> toJson() => {
        "jumlah_positif": jumlahPositif,
        "jumlah_dirawat": jumlahDirawat,
        "jumlah_sembuh": jumlahSembuh,
        "jumlah_meninggal": jumlahMeninggal,
      };
}
