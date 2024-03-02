import 'package:flutter/material.dart';
import 'package:shoopy_whatsapp_task/screens/chat/chat_screen.dart';
import 'package:shoopy_whatsapp_task/theme/app_color.dart';
import 'package:shoopy_whatsapp_task/theme/app_font.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AppColorScheme appColorScheme = AppColorScheme();
  final FontThemeClass fontThemeClass = FontThemeClass();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColorScheme.tabBackground,
      appBar: AppBar(
        backgroundColor: appColorScheme.appBarBackground,
        title: Text(
          'WhatsApp',
          style: fontThemeClass.title2(context, fontWeight: FontWeight.w500),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.search,
              color: appColorScheme.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.more_vert,
              color: appColorScheme.white,
            ),
          ),
        ],
        bottom: TabBar(
          unselectedLabelColor: appColorScheme.grey,
          labelColor: appColorScheme.green,
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.people,
              ),
            ),
            Tab(
              child: Text(
                "CHATS",
              ),
            ),
            Tab(
                child: Text(
              "STATUS",
            )),
            Tab(
                child: Text(
              "CALLS",
            )),
          ],
          indicatorColor: appColorScheme.green,
          dividerColor: appColorScheme.appBarBackground,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        Center(
          child: Text(
            'Community',
            style: fontThemeClass.title(context),
          ),
        ),
        const ChatScreen(),
        Center(
          child: Text(
            'Status',
            style: fontThemeClass.title(context),
          ),
        ),
        Center(
          child: Text(
            'Calls',
            style: fontThemeClass.title(context),
          ),
        ),
      ]),
    );
  }
}
