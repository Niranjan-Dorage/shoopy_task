import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoopy_whatsapp_task/provider/json_data.dart';
import 'package:shoopy_whatsapp_task/theme/app_color.dart';
import 'package:shoopy_whatsapp_task/theme/app_font.dart';

class ConversationScreen extends StatelessWidget {
  final int? index;
  // ignore: use_key_in_widget_constructors
  const ConversationScreen({Key? key, this.index});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final index = arguments['index'] as int?;
    final jsonProvider = Provider.of<JsonDataProvider>(context);
    return Scaffold(
      backgroundColor: AppColorScheme().tabBackground,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColorScheme().white),
        backgroundColor: AppColorScheme().appBarBackground,
        titleSpacing: 0,
        title: Row(
          children: [
            CachedNetworkImage(
              imageUrl: jsonProvider.jsonData[index!].profileImageUrl,
              imageBuilder: (context, imageProvider) => Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(width: 10),
            Text(
              jsonProvider.jsonData[index].name,
              style: FontThemeClass().paragraph(
                context,
                fontWeight: FontWeight.w400,
                color: AppColorScheme().white,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.videocam,
              color: AppColorScheme().white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.call,
              color: AppColorScheme().white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.more_vert,
              color: AppColorScheme().white,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/chat_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: jsonProvider.jsonData[index].messages.length,
                itemBuilder: (context, messageIndex) {
                  final message =
                      jsonProvider.jsonData[index].messages[messageIndex];
                  final isSenderYou = message.senderId == "you";
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: isSenderYou
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.8,
                          ),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: isSenderYou
                                ? AppColorScheme().green
                                : AppColorScheme().appBarBackground,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            message.message,
                            style: FontThemeClass().body(
                              context,
                              fontWeight: FontWeight.w500,
                              color: AppColorScheme().white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: AppColorScheme().appBarBackground,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: TextField(
                        style: TextStyle(color: AppColorScheme().white),
                        decoration: InputDecoration(
                          hintText: 'Message',
                          hintStyle: TextStyle(color: AppColorScheme().white),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColorScheme().appBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.attach_file,
                      color: AppColorScheme().white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColorScheme().appBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: AppColorScheme().white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColorScheme().green,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.mic,
                      color: AppColorScheme().white,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
