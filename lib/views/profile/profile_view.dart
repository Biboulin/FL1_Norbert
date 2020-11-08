import 'dart:io';
import 'package:FL1_Norbert/models/data.dart';
import 'package:FL1_Norbert/models/project.dart';
import 'package:FL1_Norbert/services/project.dart';
import 'package:FL1_Norbert/services/task.dart';
import 'package:FL1_Norbert/utils/functions.dart';
import 'package:FL1_Norbert/views/new_element/select_image_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Future<List<Project>> _getAllProjects;

  File _image;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _getAllProjects = getAllProjects(context);
  }

  @override
  Widget build(BuildContext context) {
    //print(context.watch<Data>().user.image);
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(5),
          child: Container(
              child: Column(
            children: <Widget>[
              const Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                    onPressed: null,
                  )),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      height: 80,
                      width: 80,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: GestureDetector(
                            onTap: () {
                              showDialog<ImageSource>(
                                context: context,
                                child: SelectImageDialog(),
                              ).then((ImageSource source) {
                                _getImage(source);
                                uploadImageToFirebase(context, _image)
                                    .then((String link) {
                                  context.watch<Data>().currentUser.image =
                                      link;
                                  FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(context.watch<Data>().currentUser.id)
                                      .set(context
                                          .watch<Data>()
                                          .currentUser
                                          .toJson());
                                });
                              });
                            },
                            child:
                                context.watch<Data>().currentUser.image != null
                                    ? Image.network(
                                        context.watch<Data>().currentUser.image,
                                        //'assets/images/chat_cactus.jpg',
                                        fit: BoxFit.cover,
                                      )
                                    : const CircleAvatar(
                                        child: Icon(Icons.person),
                                      ),
                          )
                          //Image.memory(
                          //const Base64Decoder()
                          //   .convert(context.watch<Data>().user.image),
                          //fit: BoxFit.cover,
                          //),
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            context.watch<Data>().currentUser.firstName +
                                ' ' +
                                context.watch<Data>().currentUser.lastName,
                            style: const TextStyle(fontSize: 20)),
                        Text(context.watch<Data>().currentUser.email,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 17)),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            context
                                .watch<Data>()
                                .displayTasks
                                .length
                                .toString(),
                            style: const TextStyle(fontSize: 20)),
                        const Text('Tâches Créées',
                            style: TextStyle(color: Colors.grey, fontSize: 17)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(countCompletedTasks(context).toString(),
                            style: const TextStyle(fontSize: 20)),
                        const Text('Tâches Complétées',
                            style: TextStyle(color: Colors.grey, fontSize: 17)),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
        ),
      ),
      FutureBuilder<List<List<Project>>>(
          future: Future.wait(<Future<List<Project>>>[_getAllProjects]),
          builder: (BuildContext context,
              AsyncSnapshot<List<List<Project>>> snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.connectionState == ConnectionState.done) {
              context.watch<Data>().addProjects(snapshot.data[0]);
              context.watch<Data>().addUserProjects(getUserProjects(context));
              return Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                    width: MediaQuery.of(context).size.width,
                    child: context.watch<Data>().userProjects.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.all(8),
                            itemCount:
                                context.watch<Data>().userProjects.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: getColor(context
                                        .watch<Data>()
                                        .userProjects[index]
                                        .color),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(40.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            context
                                                .watch<Data>()
                                                .userProjects[index]
                                                .name,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            countTasksInProject(
                                                        context,
                                                        context
                                                            .watch<Data>()
                                                            .userProjects[index]
                                                            .id)
                                                    .toString() +
                                                ' tâches',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17),
                                          ),
                                        ],
                                      )),
                                ),
                              );
                            })
                        : Container(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(5),
                    child: context.watch<Data>().userProjects.isNotEmpty
                        ? Column(
                            children: <Widget>[
                              const Text(
                                'Statistiques',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.all(8),
                                    itemCount: context
                                        .watch<Data>()
                                        .userProjects
                                        .length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: CircularPercentIndicator(
                                                radius: 100.0,
                                                lineWidth: 3.0,
                                                percent: countPercentageDoneTasks(
                                                        context,
                                                        countTasksInProject(
                                                            context,
                                                            context
                                                                .watch<Data>()
                                                                .userProjects[
                                                                    index]
                                                                .id),
                                                        context
                                                            .watch<Data>()
                                                            .userProjects[index]
                                                            .id) /
                                                    100,
                                                center: Text(
                                                    countPercentageDoneTasks(
                                                                context,
                                                                countTasksInProject(
                                                                    context,
                                                                    context
                                                                        .watch<
                                                                            Data>()
                                                                        .userProjects[
                                                                            index]
                                                                        .id),
                                                                context
                                                                    .watch<
                                                                        Data>()
                                                                    .userProjects[
                                                                        index]
                                                                    .id)
                                                            .toString() +
                                                        '%',
                                                    style: const TextStyle(
                                                        fontSize: 20)),
                                                progressColor: getColor(context
                                                    .watch<Data>()
                                                    .userProjects[index]
                                                    .color),
                                              ),
                                            ),
                                            Text(
                                                context
                                                    .watch<Data>()
                                                    .userProjects[index]
                                                    .name,
                                                style: const TextStyle(
                                                    fontSize: 20))
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width,
                              child: const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  'Statistiques',
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            )),
                  ),
                ),
              ]);
            }
            return const Text('loading');
          }),
    ]);
  }

  Future<void> _getImage(ImageSource source) async {
    if (source != null) {
      final PickedFile pickedFile = await picker.getImage(source: source);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        }
      });
    }
  }
}
