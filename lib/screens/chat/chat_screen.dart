import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoopy_whatsapp_task/provider/json_data.dart';
import 'package:shoopy_whatsapp_task/theme/app_color.dart';
import 'package:shoopy_whatsapp_task/theme/app_font.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<JsonDataProvider>(context, listen: false).loadChat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<JsonDataProvider>(builder: (context, value, child) {
      return ListView.builder(
        itemCount: value.jsonData.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/ConversationScreen',
                  arguments: {'index': index},
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                child: Row(children: [
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: CachedNetworkImage(
                        imageUrl: value.jsonData[index].profileImageUrl,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value.jsonData[index].name,
                        style: FontThemeClass()
                            .body(context, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        value.jsonData[index].lastMessage,
                        style: FontThemeClass()
                            .small(context, color: AppColorScheme().mediumGrey),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.only(right: 5),
                    child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          value.jsonData[index].lastMessageTimestamp[12] +
                              value.jsonData[index].lastMessageTimestamp[13] +
                              value.jsonData[index].lastMessageTimestamp[14] +
                              value.jsonData[index].lastMessageTimestamp[15],
                          style: FontThemeClass().small(context,
                              color: AppColorScheme().mediumGrey),
                        )),
                  ),
                ]),
              ));
        },
      );
    });
  }
}
