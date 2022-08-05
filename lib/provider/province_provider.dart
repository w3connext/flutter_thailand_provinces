import 'package:flutter_thailand_provinces/dao/province_dao.dart';
import 'package:flutter_thailand_provinces/flutter_thailand_provinces.dart';

class ProvinceProvider {
  static const String TABLE_PROVINCES = "provinces";

  static Future<List<ProvinceDao>> all() async {
    List<Map<String, dynamic>>? mapResult =
        await ThailandProvincesDatabase.db?.query(TABLE_PROVINCES);

    if (mapResult == null) return <ProvinceDao>[];

    List<ProvinceDao> listProvinces = mapProvinceList(mapResult);

    return listProvinces;
  }

  static List<ProvinceDao> mapProvinceList(
      List<Map<String, dynamic>> mapResult) {
    List<ProvinceDao> listProvinces = [];
    for (var mapRow in mapResult) {
      listProvinces.add(ProvinceDao.fromJson(mapRow));
    }
    return listProvinces;
  }

  static Future<List<ProvinceDao>> search({String keyword = ""}) async {
    List<Map<String, dynamic>>? mapResult =
        await ThailandProvincesDatabase.db?.query(
      TABLE_PROVINCES,
      where: "name_th LIKE ? OR name_en LIKE ?",
      whereArgs: ["%$keyword%", "%$keyword%"],
    );

    if (mapResult == null) return <ProvinceDao>[];

    List<ProvinceDao> listProvinces = mapProvinceList(mapResult);

    return listProvinces;
  }
}
