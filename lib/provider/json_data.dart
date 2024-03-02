import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoopy_whatsapp_task/models/chat_model.dart';

class JsonDataProvider extends ChangeNotifier {
  List<Chat> jsonData = [];
  Future<void> loadChat() async {
    try {
      final jsonStr =
          await rootBundle.loadString('lib/screens/chat/chat_data.json');
      List<dynamic> jsonList = json.decode(jsonStr);
      List<Chat> chats = jsonList.map((e) => Chat.fromJson(e)).toList();
      jsonData = chats;
      debugPrint("$jsonData");
    } catch (e) {
      debugPrint('Error loading chat data: $e');
    }
    notifyListeners();
  }
}
