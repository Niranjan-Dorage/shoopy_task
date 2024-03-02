import 'package:flutter/material.dart';
import 'package:shoopy_whatsapp_task/provider/json_data.dart';
import 'package:shoopy_whatsapp_task/screens/conversation/conversation_screen.dart';
import 'package:shoopy_whatsapp_task/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => JsonDataProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          routes: {
            '/': (context) => const HomeScreen(),
            '/ConversationScreen': (context) => const ConversationScreen(),
          }),
    );
  }
}
