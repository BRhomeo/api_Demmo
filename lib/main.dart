import 'package:api_demmo/api/conroller_api.dart';
import 'package:api_demmo/api/end_point.dart';
import 'package:api_demmo/package/model/lore_model.dart';
import 'package:api_demmo/package/views/books_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<LoreModel> _loreList = [];

  final ContrillerApi api = ContrillerApi();
  Future _getLoresData() async {
    List<LoreModel> _getLore = [];

    _loreList.add(await api.getLore(loreHash: '3188244430'));
    _loreList.add(await api.getLore(loreHash: '2261683515'));
    _loreList.add(await api.getLore(loreHash: '2368205079'));
    return _getLore;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: _getLoresData(),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              //*( snapshot.data !=null ) ? snaphot.data.dataApp : null
              return ListView.builder(
                  itemCount: _loreList.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BooksPage(
                                  hashList: _loreList[index].children ?? [])),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Container(
                            color: Colors.black,
                            child: Image.network(
                                '${EndPoint.baseUrl}${_loreList[index].originalIcon}'),
                          ),
                          title: SelectableText(
                              _loreList[index].displayProperties?['name'] ??
                                  'null!'),
                        ),
                      ),
                    );
                  });
            else
              return Center(
                child: Text('loding...'),
              );
          },
        ),
      ),
    );
  }
}
