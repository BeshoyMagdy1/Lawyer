import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../contriller/controller_chat_room.dart';


class Chat_room_vieww extends GetView<Controller_chat_room> {
  Chat_room_vieww({Key? key}) : super(key: key);
  final x = Get.put(
    Controller_chat_room(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: Color(0xffDA9F5C)),
        ),
        leadingWidth: 100,
        leading: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () => Get.back(),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              width: 5,
            ),
            Icon(Icons.arrow_back),
            SizedBox(
              width: 5,
            ),
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('asset/images/noimage.png'),
            )
          ]),
        ),
        title: WillPopScope(
          onWillPop: () {
            if (x.isShowEmoji.isTrue) {
              x.isShowEmoji.value = false;
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  'status',
                  style: TextStyle(fontSize: 13),
                )
              ]),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            child: ListView(
              children: [
                Item_chat(
                  isSender: true,
                ),
                Item_chat(
                  isSender: false,
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              bottom:
                  x.isShowEmoji.isTrue ? 5 : context.mediaQueryPadding.bottom),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: Colors.white,
          height: Get.width * 0.2,
          width: Get.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(children: [
              Expanded(
                  flex: 6,
                  child: SizedBox(
                    child: GetBuilder<Controller_chat_room>(
                        builder: ((z) => TextField(
                              controller: z.chatC,
                              focusNode: z.focusNode,
                              autocorrect: false,
                              decoration: InputDecoration(
                                  prefixIcon: IconButton(
                                    icon: Icon(Icons.emoji_emotions_outlined),
                                    onPressed: () {
                                      z.focusNode.unfocus();
                                      x.isShowEmoji.toggle();
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            ))),
                  )),
              SizedBox(
                width: 10,
              ),
              Material(
                color: Color(0xffDA9F5C),
                borderRadius: BorderRadius.circular(100),
                child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    )),
              )
            ]),
          ),
        ),
        Obx(
          (() => (controller.isShowEmoji.isTrue)
              ? Container(
                  height: 270,
                  child: EmojiPicker(
                    onEmojiSelected: (category, emoji) {
                      x.addEmojiToChat(emoji);
                    },
                    onBackspacePressed: () {
                      x.deleteEmoji();
                    },
                    config: Config(
                      columns: 7,
                      emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                      verticalSpacing: 0,
                      horizontalSpacing: 0,
                      initCategory: Category.RECENT,
                      bgColor: Color(0xFFF2F2F2),
                      indicatorColor: Color(0xffc69f74),
                      iconColor: Colors.grey,
                      iconColorSelected: Color(0xffc69f74),
                      progressIndicatorColor: Color(0xffc69f74),
                      backspaceColor:  Color(0xffc69f74),
                      skinToneDialogBgColor: Colors.white,
                      skinToneIndicatorColor: Colors.grey,
                      enableSkinTones: true,
                      showRecentsTab: true,
                      recentsLimit: 28,
                      noRecents: const Text(
                        'No Recents',
                        style: TextStyle(fontSize: 20, color: Colors.black26),
                        textAlign: TextAlign.center,
                      ),
                      tabIndicatorAnimDuration: kTabScrollDuration,
                      categoryIcons: const CategoryIcons(),
                      buttonMode: ButtonMode.MATERIAL,
                    ),
                  ),
                )
              : SizedBox()),
        )
      ]),
    );
  }
}

class Item_chat extends StatelessWidget {
  const Item_chat({
    Key? key,
    required this.isSender,
  }) : super(key: key);

  final bool isSender;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
          crossAxisAlignment:
              isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Color(0xffDA9F5C),
                  borderRadius: isSender
                      ? BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        )
                      : BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  'hi im beshoy',
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 5,
            ),
            const Text('12pm'),
          ]),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    );
  }
}
