import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_lawyer2/view/search_view.dart';

import '../model/profile/views/profile_view.dart';
import 'chat_room.dart';


class Chat_Screen extends StatelessWidget {
  Chat_Screen({Key? key}) : super(key: key);
  final List mychat = List.generate(
      20,
      (index) => ListTile(
            onTap: () {
              Get.to(Chat_room_vieww());
            },
            leading: CircleAvatar(
              radius: 30,
              child: Image.asset('asset/images/noimage.png'),
            ),
            title: Text('chat name ${index + 1}'),
            subtitle: Text('last_massage${index + 1}'),
            trailing: Chip(label: Text('3')),
          )).reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(SearchView());
        },
        backgroundColor: Color(0xffDA9F5C),
        child: const Icon(Icons.search),
      ),
      body: Column(children: [
        Material(
          elevation: 5,
          child: Container(
              margin: EdgeInsets.only(top: context.mediaQueryPadding.top),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black38))),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Chats",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xffDA9F5C),
                        child: InkWell(
                            //  borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              Get.to(ProfileView());
                            },
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 40,
                            )),
                      )
                    ]),
              )),
        ),
        Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: mychat.length,
                itemBuilder: (context, index) => mychat[index])),
      ]),
    );
  }
}
