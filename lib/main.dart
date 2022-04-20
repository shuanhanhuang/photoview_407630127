/*import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '瀏覽影像',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  final widget=GridView.count(crossAxisCount: 2,
  padding: EdgeInsets.all(20.0),
    crossAxisSpacing: 20,
    mainAxisSpacing: 20,
    physics: BouncingScrollPhysics(),
    children: <Widget>[
      Image.asset('assets/image1.png'),
      Image.asset('assets/image2.png'),
      Image.asset('assets/image3.png'),
      Image.asset('assets/image4.png'),
      Image.asset('assets/image5.png'),
      Image.asset('assets/image6.png'),
      Image.asset('assets/image7.png'),
      Image.asset('assets/image8.png'),

    ],
  );

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('瀏覽影像'),
    );
    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;

  }
}*/
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: HomePage(),
    );
  }
}


