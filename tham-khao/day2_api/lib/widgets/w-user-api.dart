import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//8. lay du lieu... quy trinh nay chay tiep cho snapshot
Future<Album> fetchAlbum() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums/1');

  print(response.body);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  }

  // If the server did not return a 200 OK response, then throw an exception.
  throw Exception('Failed to load album');
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}


class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  //1. StatefulWidget là phần không thay đổi trong Widget Tree... khai bao truoc
  @override
  _MyAppState createState() => _MyAppState();
}

//2.State là phần được thay đổi. Mỗi khi Widget          bị làm bẩn, state của Widget đó sẽ được khởi tạo lại thông qua việc gọi đến phương thức StatefulWidget#createState()
class _MyAppState extends State<MyApp> {
  Future<Album> futureAlbum;

  //3. chay het innit
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  //4. run build widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example a',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          //danh sach icon tren navbar
          actions: <Widget>[
            IconButton(icon: Icon(Icons.ac_unit), onPressed: () {},),
            IconButton(icon: Icon(Icons.email),onPressed: () {},),
            IconButton(icon: Icon(Icons.edit),onPressed: () {},),
          ], //end danh sach icon tren navbar
          title: Text('Fetch Data Example b'),

        ),
        body: Center(
          child: FutureBuilder<Album>(
            //5. xem cach hoat dong cua futureBuilder...  https://medium.com/flutter-community/working-with-apis-in-flutter-8745968103e9
            future:
                futureAlbum, //ho tro phuong thuc post... du lieu tra ve la 1 future
            builder: (context, snapshot) {
              //ban chat no cung la 1 widget...  no ho tro
              if (snapshot.hasData) {
                //6. Chay xuong day check snapshot co data hay ko theo dang bat dong bo... trong khi goi se nhay di cho khac... ko dung lai cho nay... chay kieu bat dong bo
                return Text(snapshot.data.title);
              }

              //truong hop loi
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              //7. nhay qua hien thi loading truoc ... sau do quay nguoc len trong khi loading spinner.
              return CircularProgressIndicator();

              // //truong hop loi
              // if (snapshot.hasError) {
              //   return Text("${snapshot.error}");
              // }

              // return snapshot.hasData
              //     ? Text(snapshot.data.title)
              //     : CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
