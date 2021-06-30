import 'package:api_demmo/api/conroller_api.dart';
import 'package:api_demmo/package/model/games_model.dart';
import 'package:api_demmo/package/model/model-controller-genral.dart';
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
  List<GamesModel> _gamseList = [];

  final ContrillerApi api = ContrillerApi();
  Future<ModelControllerGenral> _getGamesData() async {
    return await api.getGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<ModelControllerGenral>(
          future: _getGamesData(),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              //*( snapshot.data !=null ) ? snaphot.data.dataApp : null
              _gamseList = snapshot.data?.dataApp ?? [];
            return ListView.builder(
                itemCount: _gamseList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      subtitle: Text(_gamseList[index].id ?? '0'),
                      leading: Image.network(_gamseList[index].image ?? ''),
                      title: Text(_gamseList[index].named ?? 'null'),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
