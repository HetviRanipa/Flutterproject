import 'package:sqflite/sqflite.dart'; // sqflite for database
import 'package:path/path.dart'; // the path package
import './todo_model.dart'; // the todo model we created before

class DatabaseConnect {
  Database? _database;


  Future<Database> get database async {

    final dbpath = await getDatabasesPath();

    const dbname = 'todo.db';

    final path = join(dbpath, dbname);


    _database = await openDatabase(path, version: 1, onCreate: _createDB);

    return _database!;
  }

  Future<void> _createDB(Database db, int version) async {

    await db.execute('''
      CREATE TABLE todo(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        creationDate TEXT,
        isChecked INTEGER
      )
    ''');
  }


  Future<void> insertTodo(Todo todo) async {
    // get the connection to database
    final db = await database;
    // insert the todo
    await db.insert(
      'todo',
      todo.toMap(),
      conflictAlgorithm:
      ConflictAlgorithm.replace,
    );
  }

  // function to delete a  todo from our database
  Future<void> deleteTodo(Todo todo) async {
    final db = await database;
    // delete the todo from database based on its id.
    await db.delete(
      'todo',
      where: 'id == ?', // this condition will check for id in todo list
      whereArgs: [todo.id],
    );
  }

  // function to fetch all the todo data from our database
  Future<List<Todo>> getTodo() async {
    final db = await database;
    // query the database and save the todo as list of maps
    List<Map<String, dynamic>> items = await db.query(
      'todo',
      orderBy: 'id DESC',
    );

    return List.generate(
      items.length,
          (i) => Todo(
        id: items[i]['id'],
        title: items[i]['title'],
        creationDate: DateTime.parse(items[i][
        'creationDate']),
        isChecked: items[i]['isChecked'] == 1
            ? true
            : false,
      ),
    );
  }


  // function for updating a todo in todoList
  Future<void> updateTodo(int id, String title) async {
    final db = await database;

    await db.update(
      'todo',
      {
        //
        'title': title,
      }, //
      where: 'id == ?',
      whereArgs: [id],
    );
  }
}