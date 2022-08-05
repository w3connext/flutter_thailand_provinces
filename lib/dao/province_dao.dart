class ProvinceDao {
  int id;
  String code;
  String nameTh;
  String nameEn;
  int geographyId;

  ProvinceDao({
    this.id = 0,
    this.code = '',
    this.nameTh = '',
    this.nameEn = '',
    this.geographyId = 0,
  });

  factory ProvinceDao.fromJson(Map<String, dynamic> json) {
    return ProvinceDao(
      id: json["id"] != null ? int.parse(json["id"]) : 0,
      code: json["code"] ?? '',
      nameTh: json["name_th"] ?? '',
      nameEn: json["name_en"] ?? '',
      geographyId:
          json["geography_id"] != null ? int.parse(json["geography_id"]) : 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "code": this.code,
      "name_th": this.nameTh,
      "name_en": this.nameEn,
      "geography_id": this.geographyId,
    };
  }
}
