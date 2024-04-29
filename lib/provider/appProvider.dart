import 'package:flutter/material.dart';

import '../data/model/commentmodel.dart';
import '../data/model/productDetailmodel.dart';
import '../data/model/productlistModel.dart';
import '../domain/repository.dart';

class AppProvider extends ChangeNotifier {
  List<Product> list = [];
  List<Comments> comments = [];
  DeatilList listDetail = DeatilList(title: "");
  bool isloading = false;
  bool iscommnetloading = false;
  bool isDetailoading = false;
  String DetailError = "no";
  String commentError = "no";

  String Error = "no";

  getData() async {
    isloading = true;
    notifyListeners();

    final response = await getpostdata();
    if (response == "something went wrong") {
      Error = "yes";
      notifyListeners();
    } else {
      List<Product> response = await getpostdata() as List<Product>;

      print(response.length);
      isloading = false;
      list = response;
      Error = "no";
      print(list.length);
      notifyListeners();
    }

    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(content: Text('something went WRONG')),
    // );
  }

  getfullDetailS(String id) async {
    isDetailoading = true;
    notifyListeners();

    final response = await getlistdetail(id);
    if (response == "something went wrong") {
      DetailError = "yes";
      notifyListeners();
    } else {
      DeatilList response = await getlistdetail(id) as DeatilList;

      isDetailoading = false;
      listDetail = response;
      DetailError = "no";
      print(list.length);
      notifyListeners();
    }
  }

  getcomments(String id) async {
    iscommnetloading = true;
    notifyListeners();

    final response = await getcommentdata(id);
    if (response == "something went wrong") {
      Error = "yes";
      notifyListeners();
    } else {
      List<Comments> responses = response as List<Comments>;

      print(responses.length);
      iscommnetloading = false;
      comments = response;
      commentError = "no";
      notifyListeners();
    }
  }
}
