import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:job_inter/data/model/commentmodel.dart';

import '../data/auth/url.dart';
import '../data/model/productDetailmodel.dart';
import '../data/model/productlistModel.dart';

Future<dynamic> getpostdata() async {
  var url = Uri.parse(baseurl);
  try {
    var response = await http.get(url);
    List responseJson = json.decode(response.body);
    List<Product> list = responseJson.map((e) => Product.fromJson(e)).toList();
    return list;
  } catch (e) {
    return "something went wrong";
  }
}

Future<dynamic> getlistdetail(String id) async {
  var url = Uri.parse("${baseurl}/${id}");
  try {
    var response = await http.get(url);
    Map<String,dynamic> jsondata = json.decode(response.body)as Map<String,dynamic>;
    
    DeatilList responseJson = DeatilList.fromJson(jsondata) ;

    return responseJson;
  } catch (e) {
    return "something went wrong";
  }
}

Future<dynamic> getcommentdata(String id) async {
  var url = Uri.parse("${baseurl}/${id}/comments");
  try {
    var response = await http.get(url);
    List responseJson = json.decode(response.body);
    List<Comments> list = responseJson.map((e) => Comments.fromJson(e)).toList();
    return list;
  } catch (e) {
    return "something went wrong";
  }
}
