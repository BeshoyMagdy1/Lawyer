import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contriller/con_auth.dart';
import '../contriller/search_controller.dart';

class SearchView extends StatelessWidget {
  final authC = Get.put(AuthController(),permanent: true);
  final con2 = Get.put(SearchController(),permanent: true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.red[900],
          title: Text('Search'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back),
          ),
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                onChanged: (value) => con2.searchFriend(
                  value,
                  authC.user!.value!.email!,
                ),
                controller: con2.searchC,
                cursorColor: Colors.red[900],
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  hintText: "Search new friend here..",
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  suffixIcon: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Icon(
                      Icons.search,
                      color: Color(0xffde9c56),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(140),
      ),
      body: Obx(
        () => con2.tempSearch.length == 0
            ? Center(
                child: Container(
                  width: Get.width * 0.7,
                  height: Get.width * 0.7,
                  child: Text('bhbhhbyy'),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: con2.tempSearch.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black26,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child:
                      con2.tempSearch[index]["photoUrl"] == "noimage"
                              ? Image.asset(
                                  "assets/logo/noimage.png",
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                        con2.tempSearch[index]["photoUrl"],
                                  fit: BoxFit.cover,
                                ),
                    ),
                  ),
                  title: Text(
                    "${con2.tempSearch[index]["name"]}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    "${con2.tempSearch[index]["email"]}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () => authC.addNewConnection(
                      con2.tempSearch[index]["email"],
                    ),
                    child: Chip(
                      label: Text("Message"),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
