import 'package:cloudapp/Controller/clsContactContoller.dart';
import 'package:cloudapp/Modle/clsContactModle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Shape/clsContactItmeSearchShape.dart';

class clsSearchScreanContactDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        query = '';
        // When pressed here the query will be cleared from the search bar.
      },
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
        // When pressed here the query will be cleared from the search bar.
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<clsContactController>(context, listen: false)
            .getContactAndNumberBySearch(query),
        builder: (context, snapShot) {
          return Consumer<clsContactController>(
              builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.searchListDeligate.length,
              itemBuilder: (context, index) {
                clsContactModle _modle = value.searchListDeligate[index];
                return clsContactItmeSearchContactShape(
                  context: context,
                  modle: _modle,
                  categoryId: 17,
                  onComplate: () {},
                );
              },
            );
          });
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Provider.of<clsContactController>(context,listen: false)
        .getContactAndNumberBySearch(query);
    return Consumer<clsContactController>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.searchListDeligate.length,
            itemBuilder: (context, index) {
              clsContactModle _modle = value.searchListDeligate[index];
              return clsContactItmeSearchContactShape(
                context: context,
                modle: _modle,
                categoryId: 17,
                onComplate: () {},
              );
            },
          );
        });;
  }
// Dummy list
}
