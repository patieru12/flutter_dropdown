import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dropdown/model/ItemModel.dart';
class Api{
  static const String appName = "Dropdown";
  static const String base = "http://172.20.10.2:8000/api/";
  
  static Future<List> fetchItems() async{
    var itemData = {"id" : 0};
    final String itemUrl = base + "items";
    final data = await http.post(itemUrl, body: json.encode(itemData));
    final parsed = json.decode(data.body).cast<Map<String, dynamic>>();
    List<ItemModel> itemList = parsed.map<ItemModel>((json) => ItemModel.fromJson(json)).toList();
    List<String> itemNameList = List<String>();
    for (int i = 0; i < itemList.length; i++) {
      itemNameList.add(itemList[i].name);
    }
    // print(itemNameList);
    return itemNameList;
  }
}