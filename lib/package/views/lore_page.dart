import 'package:api_demmo/api/conroller_api.dart';
import 'package:api_demmo/package/model/description_model.dart';
import 'package:flutter/material.dart';

class LorePage extends StatefulWidget {
  int? hash;
  LorePage({Key? key, required this.hash}) : super(key: key);

  @override
  _LorePageState createState() => _LorePageState(hash: hash);
}

class _LorePageState extends State<LorePage> {
  int? hash;
  final ContrillerApi api = ContrillerApi();

  _LorePageState({required this.hash});
  DescriptionModel? description;

  Future<DescriptionModel> _getDescriptionData() async {
    DescriptionModel obj = await api.getDescription(hash: hash.toString());

    description = obj;

    return obj;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lore Page'),
      ),
      body: Center(
        child: FutureBuilder<DescriptionModel>(
          future: _getDescriptionData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Text(description?.name ?? 'null'),
                      Divider(color: Colors.black),
                      Text(description?.subtitle ?? '-'),
                      Divider(color: Colors.black),
                      Text(description?.description ?? 'null'),
                    ],
                  ),
                ),
              );
            } else
              return Center(
                child: Text('loding...'),
              );
          },
        ),
      ),
    );
  }
}
