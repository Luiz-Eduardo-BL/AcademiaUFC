// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._();
//   static Database? _database;

//   DatabaseHelper._();

//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     // Obtenha o caminho do diretório de armazenamento do banco de dados
//     String path = join(await getDatabasesPath(), 'my_database.db');

//     // Abra o banco de dados (será criado na primeira execução)
//     _database = await openDatabase(
//       path,
//       version: 1,
//       onCreate: _createDatabase,
//     );

//     return _database!;
//   }

//   Future<void> _createDatabase(Database db, int version) async {
//     // Crie as tabelas do banco de dados
//     await db.execute('''
//       CREATE TABLE IF NOT EXISTS cursos (
//         id INTEGER PRIMARY KEY,
//         nome TEXT
//       )
//     ''');

//     await db.execute('''
//       CREATE TABLE IF NOT EXISTS usuarios (
//         id INTEGER PRIMARY KEY,
//         userName TEXT,
//         email TEXT,
//         senha TEXT,
//         cursoId INTEGER,
//         FOREIGN KEY (cursoId) REFERENCES cursos (id)
//       )
//     ''');

//     // Insira os dados iniciais, se necessário
//     await db.transaction((txn) async {
//       // Insira os cursos
//       await txn.rawInsert(
//           'INSERT INTO cursos (nome) VALUES ("Engenharia de Software")');
//       await txn.rawInsert(
//           'INSERT INTO cursos (nome) VALUES ("Engenharia da Computação")');
//       await txn.rawInsert(
//           'INSERT INTO cursos (nome) VALUES ("Ciência da Computação")');
//       await txn
//           .rawInsert('INSERT INTO cursos (nome) VALUES ("Design Digital")');
//       await txn.rawInsert('INSERT INTO cursos (nome) VALUES ("Redes")');
//     });

//     await db.transaction((txn) async {
//       // Insira os usuários
//       await txn.rawInsert(
//           'INSERT INTO usuarios (userName, email, senha, cursoId) VALUES ("admin", "admin@admin", "admin", 1)');
//     });

//     await db.execute('''
//       CREATE TABLE IF NOT EXISTS usuarios (
//         id INTEGER PRIMARY KEY,
//         userName TEXT,
//         email TEXT,
//         senha TEXT,
//         cursoId INTEGER,
//         FOREIGN KEY (cursoId) REFERENCES cursos (id)
//       )
//     ''');
//   }

//   Future<int> insertUsuario(Map<String, dynamic> row) async {
//     Database db = await instance.database;
//     return await db.insert('usuarios', row);
//   }

//   Future<List<Map<String, dynamic>>> queryAllCursos() async {
//     Database db = await instance.database;
//     return await db.query('cursos');
//   }

//   Future<List<Map<String, dynamic>>> queryAllUsuarios() async {
//     Database db = await instance.database;
//     return await db.query('usuarios');
//   }

//   Future<List<Map<String, dynamic>>> queryUsuario(int id) async {
//     Database db = await instance.database;
//     return await db.query('usuarios', where: 'id = ?', whereArgs: [id]);
//   }

//   Future<int> updateUsuario(Map<String, dynamic> row) async {
//     Database db = await instance.database;
//     int id = row['id'];
//     return await db.update('usuarios', row, where: 'id = ?', whereArgs: [id]);
//   }

//   Future<int> deleteUsuario(int id) async {
//     Database db = await instance.database;
//     return await db.delete('usuarios', where: 'id = ?', whereArgs: [id]);
//   }

//   Future<List<Map<String, dynamic>>> queryUsuarioByEmail(String email) async {
//     Database db = await instance.database;
//     return await db.query('usuarios', where: 'email = ?', whereArgs: [email]);
//   }

//   Future<List<Map<String, dynamic>>> queryUsuarioByUserName(
//       String userName) async {
//     Database db = await instance.database;
//     return await db
//         .query('usuarios', where: 'userName = ?', whereArgs: [userName]);
//   }

//   Future<List<Map<String, dynamic>>> queryUsuarioByEmailAndSenha(
//       String email, String senha) async {
//     Database db = await instance.database;
//     return await db.query('usuarios',
//         where: 'email = ? AND senha = ?', whereArgs: [email, senha]);
//   }

//   Future<List<Map<String, dynamic>>> queryUsuarioByUserNameAndSenha(
//       String userName, String senha) async {
//     Database db = await instance.database;
//     return await db.query('usuarios',
//         where: 'userName = ? AND senha = ?', whereArgs: [userName, senha]);
//   }

//   Future<List<Map<String, dynamic>>> queryUsuarioByEmailAndSenhaAndCursoId(
//       String email, String senha, int cursoId) async {
//     Database db = await instance.database;
//     return await db.query('usuarios',
//         where: 'email = ? AND senha = ? AND cursoId = ?',
//         whereArgs: [email, senha, cursoId]);
//   }

//   Future<List<Map<String, dynamic>>> queryUsuarioByUserNameAndSenhaAndCursoId(
//       String userName, String senha, int cursoId) async {
//     Database db = await instance.database;
//     return await db.query('usuarios',
//         where: 'userName = ? AND senha = ? AND cursoId = ?',
//         whereArgs: [userName, senha, cursoId]);
//   }

//   Future<List<Map<String, dynamic>>> queryUsuarioByEmailAndCursoId(
//       String email, int cursoId) async {
//     Database db = await instance.database;
//     return await db.query('usuarios',
//         where: 'email = ? AND cursoId = ?', whereArgs: [email, cursoId]);
//   }

//   Future<List<Map<String, dynamic>>> queryUsuarioByUserNameAndCursoId(
//       String userName, int cursoId) async {
//     Database db = await instance.database;
//     return await db.query('usuarios',
//         where: 'userName = ? AND cursoId = ?', whereArgs: [userName, cursoId]);
//   }

//   Future<List<Map<String, dynamic>>> queryUsuarioByCursoId(int cursoId) async {
//     Database db = await instance.database;
//     return await db
//         .query('usuarios', where: 'cursoId = ?', whereArgs: [cursoId]);
//   }

//   Future<List<Map<String, dynamic>>> queryCurso(int id) async {
//     Database db = await instance.database;
//     return await db.query('cursos', where: 'id = ?', whereArgs: [id]);
//   }

//   Future<int> updateCurso(Map<String, dynamic> row) async {
//     Database db = await instance.database;
//     int id = row['id'];
//     return await db.update('cursos', row, where: 'id = ?', whereArgs: [id]);
//   }

//   Future<int> deleteCurso(int id) async {
//     Database db = await instance.database;
//     return await db.delete('cursos', where: 'id = ?', whereArgs: [id]);
//   }

//   Future<List<Map<String, dynamic>>> queryCursoByNome(String nome) async {
//     Database db = await instance.database;
//     return await db.query('cursos', where: 'nome = ?', whereArgs: [nome]);
//   }

//   Future<Map<String, dynamic>?> getUsuarioLogado() async {
//     Database db = await instance.database;
//     List<Map<String, dynamic>> result =
//         await db.query('usuarios', where: 'id = 1');
//     if (result.isNotEmpty) {
//       return result.first;
//     } else {
//       return null;
//     }
//   }

//   Future<Map<String, dynamic>?> getUsuario(Map<String, String> usuario) async {
//   Database db = await instance.database;

//   List<Map<String, dynamic>> results = [];

//   if (usuario['email'] != null && usuario['senha'] != null) {
//     results = await db.query('usuarios',
//         where: 'email = ? AND senha = ?',
//         whereArgs: [usuario['email'], usuario['senha']]);
//   } else if (usuario['userName'] != null && usuario['senha'] != null) {
//     results = await db.query('usuarios',
//         where: 'userName = ? AND senha = ?',
//         whereArgs: [usuario['userName'], usuario['senha']]);
//   } else if (usuario['email'] != null &&
//       usuario['senha'] != null &&
//       usuario['cursoId'] != null) {
//     results = await db.query('usuarios',
//         where: 'email = ? AND senha = ? AND cursoId = ?',
//         whereArgs: [
//           usuario['email'],
//           usuario['senha'],
//           int.parse(usuario['cursoId']!)
//         ]);
//   } else if (usuario['userName'] != null &&
//       usuario['senha'] != null &&
//       usuario['cursoId'] != null) {
//     results = await db.query('usuarios',
//         where: 'userName = ? AND senha = ? AND cursoId = ?',
//         whereArgs: [
//           usuario['userName'],
//           usuario['senha'],
//           int.parse(usuario['cursoId']!)
//         ]);
//   } else if (usuario['email'] != null && usuario['cursoId'] != null) {
//     results = await db.query('usuarios',
//         where: 'email = ? AND cursoId = ?',
//         whereArgs: [usuario['email'], int.parse(usuario['cursoId']!)]);
//   } else if (usuario['userName'] != null && usuario['cursoId'] != null) {
//     results = await db.query('usuarios',
//         where: 'userName = ? AND cursoId = ?',
//         whereArgs: [usuario['userName'], int.parse(usuario['cursoId']!)]);
//   } else if (usuario['cursoId'] != null) {
//     results = await db.query('usuarios',
//         where: 'cursoId = ?', whereArgs: [int.parse(usuario['cursoId']!)]);
//   }

//   return results.isNotEmpty ? results.first : null;
// }
// }
