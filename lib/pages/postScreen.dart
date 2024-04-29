import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:job_inter/pages/postDetailScreen.dart';
import 'package:provider/provider.dart';

import '../provider/appProvider.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: Text("List",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: Consumer<AppProvider>(
                    builder: (context, appProvider, child) {
                  return appProvider.isloading == true
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
                      : appProvider.Error == "yes"
                          ? Center(child: Text("something went wrong "))
                          : ListView.builder(
                              itemCount: appProvider.list.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Provider.of<AppProvider>(context,listen: false)
                                        .getfullDetailS(
                                      appProvider.list[index].id.toString(),
                                    );

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PostDetailScreen()));
                                  },
                                  child: Animate(
                                     effects: [FadeEffect(), ScaleEffect()],
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 71, 195, 216),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomLeft:
                                                      Radius.circular(20))),
                                          child: ListTile(
                                            title: Text(
                                              appProvider.list[index].id
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            subtitle: Text(appProvider
                                                .list[index].body
                                                .toString()),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                }),
              ),
            ],
          ),
        ));
  }
}
