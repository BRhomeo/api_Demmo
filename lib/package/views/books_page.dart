import 'package:api_demmo/api/conroller_api.dart';
import 'package:api_demmo/api/end_point.dart';
import 'package:api_demmo/package/model/book_model.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatefulWidget {
  List hashList = [];
  BooksPage({Key? key, required this.hashList}) : super(key: key);

  @override
  _BooksPageState createState() => _BooksPageState(booksHashList: hashList);
}

class _BooksPageState extends State<BooksPage> {
  List booksHashList = [];
  List<BookModel> _booksList = [];
  final ContrillerApi api = ContrillerApi();
  _BooksPageState({required this.booksHashList});

  Future<List<BookModel>> _getBooksData() async {
    List<BookModel> _list = [];

    // booksHashList.forEach((element) async {
    //   BookModel tst =
    //       await api.getBook(bookHash: '${element["presentationNodeHash"]} ');
    //   _booksList.add(tst);
    //   _list.add(tst);
    //   print(tst.name);
    //   //  print('inside for loop');
    // });

    for (int i = 0; i < booksHashList.length; i++) {
      BookModel tst = await api.getBook(
          bookHash: '${booksHashList[i]["presentationNodeHash"]} ');
      _booksList.add(tst);
      _list.add(tst);

      print('inside for loop');
    }

    print('outside for loop');
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books Page'),
      ),
      body: Center(
        child: FutureBuilder<List<BookModel>>(
          future: _getBooksData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: _booksList.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                      onPressed: () async {
                        //_loreList[loreIndex].children
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Container(
                            width: 50,
                            color: Colors.black,
                            child: Image.network(
                                '${EndPoint.baseUrl}${_booksList[index].originalIcon}'),
                          ),
                          title:
                              SelectableText(_booksList[index].name ?? 'null!'),
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
