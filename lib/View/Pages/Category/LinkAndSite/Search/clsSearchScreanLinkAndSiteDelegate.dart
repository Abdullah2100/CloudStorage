import 'package:cloudapp/Controller/clsContactContoller.dart';
import 'package:cloudapp/Controller/clsLinkAndSiteController.dart';
import 'package:cloudapp/Modle/clsContactModle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Modle/clsLinkAndSiteModle.dart';
import '../Shape/clsLinkAndSiteItemShap.dart';

class clsSearchScreanLinkAndSiteDelegate extends SearchDelegate<String> {
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
        future: Provider.of<clsLinkAndSiteController>(context, listen: false)
            .getLinkAndSiteBySearch(query),
        builder: (context, snapShot) {
          return Consumer<clsLinkAndSiteController>(
              builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.searchListDeligate.length,
              itemBuilder: (context, index) {
                clsLinkAndSiteModle _modle = value.searchListDeligate[index];
                return clsLinkAndSiteItemShap(
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
    Provider.of<clsLinkAndSiteController>(context,listen: false)
        .getLinkAndSiteBySearch(query);
    return Consumer<clsLinkAndSiteController>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.searchListDeligate.length,
            itemBuilder: (context, index) {
              clsLinkAndSiteModle _modle = value.searchListDeligate[index];
              return clsLinkAndSiteItemShap(
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
