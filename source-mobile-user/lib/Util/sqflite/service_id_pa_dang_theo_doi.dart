import 'package:demo_trangchu/Widgets/dang_theo_doi/model_pa_dang_theo_doi.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TasksDB {
  Database _database;
  final String kTableName = 'ds_phan_anh_da_luu';
  final String kId = 'id_phan_anh';

  // Mở db
  Future _openDB() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'ds_phan_anh_da_luu.db'),
      onCreate: (db, version) {
        return db.execute('CREATE TABLE $kTableName($kId INTEGER)');
      },
      version: 1,
    );
  }

  // thêm id nào đó vào db
  Future insert(IdDangTheoDoi id) async {
    await _openDB();
    await _database.insert(kTableName, id.toMap());
    print(' inserted id ');
  }

  // xoá id với id truyền vào
  Future delete(int id) async {
    await _openDB();
    await _database.delete(
      kTableName,
      where: '$kId = ?',
      whereArgs: [id],
    );
    print(' deleted !!!!!!');
  }
  

  // Lấy toàn bộ danh sách id
  Future<List<IdDangTheoDoi>> getIds() async {
    await _openDB();
    List<Map<String, dynamic>> maps = await _database.query(kTableName);
    return List.generate(
        maps.length,
        (i) => IdDangTheoDoi(
              id_phan_anh: maps[i][kId],
            ));
  }
}
