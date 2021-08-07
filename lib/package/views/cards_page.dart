import 'package:api_demmo/api/conroller_api.dart';
import 'package:api_demmo/api/end_point.dart';
import 'package:api_demmo/package/model/card_model.dart';
import 'package:api_demmo/package/views/lore_page.dart';
import 'package:flutter/material.dart';

class CardsPage extends StatefulWidget {
  List hash = [];
  CardsPage({Key? key, required this.hash}) : super(key: key);

  @override
  _CardsPageState createState() => _CardsPageState(cardsHashsList: hash);
}

class _CardsPageState extends State<CardsPage> {
  List cardsHashsList;
  List<CardModel> _cardsList = [];
  final ContrillerApi api = ContrillerApi();
  _CardsPageState({required this.cardsHashsList});

  Future<List<CardModel>> _getBooksData() async {
    List<CardModel> _list = [];

    for (int i = 0; i < cardsHashsList.length; i++) {
      CardModel tst =
          await api.getCard(cardHash: '${cardsHashsList[i]["recordHash"]} ');
      _cardsList.add(tst);
      _list.add(tst);
    }

    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Page'),
      ),
      body: Center(
        child: FutureBuilder<List<CardModel>>(
          future: _getBooksData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: _cardsList.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                LorePage(hash: _cardsList[index].loreHash),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Container(
                            width: 50,
                            color: Colors.black,
                            child: Image.network(
                                '${EndPoint.baseUrl}${_cardsList[index].originalIcon}'),
                          ),
                          title:
                              SelectableText(_cardsList[index].name ?? 'null!'),
                        ),
                      ),
                    );
                  });
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
