import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../provider/appProvider.dart';

class CommentScreeen extends StatelessWidget {
  final String id;

  const CommentScreeen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    )),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "post id :${id.toString()}",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Consumer<AppProvider>(builder: (context, appProvider, child) {
                return appProvider.iscommnetloading == true
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                                backgroundColor:
                                    Color.fromARGB(255, 71, 195, 216)),
                            Text("loading ")
                          ],
                        ),
                      )
                    : appProvider.commentError == "yes"
                        ? Center(child: Text("something went wrong "))
                        : Flexible(
                            child: ListView.builder(
                                itemCount: appProvider.comments.length,
                                itemBuilder: (context, index) {
                                  return Column(children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      width: MediaQuery.of(context).size.width,
                                      height: 350,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 71, 195, 216),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Animate(
                                          effects: [
                                            FadeEffect(),
                                            ScaleEffect()
                                          ],
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text("id:  ",
                                                      style: TextStyle(
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                      )),
                                                  Flexible(
                                                    child: Text(
                                                      appProvider
                                                          .comments[index].id
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text("email:  ",
                                                      style: TextStyle(
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                      )),
                                                  Flexible(
                                                    child: Text(
                                                      appProvider
                                                          .comments[index].email
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text("name:  ",
                                                      style: TextStyle(
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                      )),
                                                  Flexible(
                                                    child: Text(
                                                        appProvider
                                                            .comments[index]
                                                            .name
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text("post id:  ",
                                                      style: TextStyle(
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                      )),
                                                  Flexible(
                                                    child: Text(
                                                      appProvider
                                                          .comments[index]
                                                          .postId
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text("body:  ",
                                                      style: TextStyle(
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                      )),
                                                  Flexible(
                                                    child: Text(
                                                      appProvider
                                                          .comments[index].body
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    )
                                  ]);
                                }),
                          );
              }),
            ],
          ),
        )));
  }
}
