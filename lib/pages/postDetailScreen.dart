import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:job_inter/pages/commentScreen.dart';
import 'package:provider/provider.dart';

import '../provider/appProvider.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: SafeArea(
          
            child: Center(
      child: Column(
        children: [
          SizedBox(
            height: 10,
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
          SizedBox(
            height: 60,
          ),
          Consumer<AppProvider>(builder: (context, appProvider, child) {
            return appProvider.isDetailoading == true
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                            backgroundColor: Color.fromARGB(255, 71, 195, 216)),
                        Text("loading ")
                      ],
                    ),
                  )
                : appProvider.Error == "yes"
                    ? Center(child: Text("something went wrong "))
                    : Container(
                        margin: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        height: 350,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 71, 195, 216),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(onTap: () {
                          
                                    Provider.of<AppProvider>(context,listen: false)
                                        .getcomments(appProvider.listDetail.id.toString()
                                      
                                    );

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CommentScreeen(id: appProvider.listDetail.id.toString(),)));
                               
                          },
                            child: Animate(
                            effects: [FadeEffect(), ScaleEffect()],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("userId:  ",
                                          style: TextStyle(fontSize: 23, color: Colors.white,)),
                                      Flexible(
                                        child: Text(
                                          appProvider.listDetail.userId.toString(),
                                          style: TextStyle(fontSize: 20,color: Colors.white,),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("id:  ", style: TextStyle(fontSize: 23, color: Colors.white,)),
                                      Flexible(
                                        child: Text(
                                          appProvider.listDetail.id.toString(),
                                          style: TextStyle(fontSize: 20, color: Colors.white,),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("title:  ",
                                          style: TextStyle(fontSize: 23, color: Colors.white,)),
                                      Flexible(
                                        child: Text(appProvider.listDetail.title.toString(),
                                            style: TextStyle(fontSize: 20, color: Colors.white,)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("body:  ",
                                          style: TextStyle(fontSize: 23, color: Colors.white,)),
                                      Flexible(
                                        child: Text(
                                          appProvider.listDetail.body.toString(),
                                          style: TextStyle(fontSize: 20, color: Colors.white,),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
          }),
        ],
      ),
    )));
  }
}
