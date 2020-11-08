import 'package:FL1_Norbert/models/data.dart';
import 'package:FL1_Norbert/models/project.dart';
import 'package:FL1_Norbert/services/project.dart';
import 'package:FL1_Norbert/utils/colors.dart';
import 'package:FL1_Norbert/utils/functions.dart';
import 'package:FL1_Norbert/views/projects/project_creation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectView extends StatefulWidget {
  @override
  _ProjectViewState createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  Future<List<Project>> _getAllProjects;

  @override
  void initState() {
    super.initState();
    _getAllProjects = getAllProjects(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<List<Project>>>(
        future: Future.wait(<Future<List<Project>>>[_getAllProjects]),
        builder: (BuildContext context,
            AsyncSnapshot<List<List<Project>>> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.connectionState == ConnectionState.done) {
            context.watch<Data>().addProjects(snapshot.data[0]);
            context.watch<Data>().addUserProjects(getUserProjects(context));
            return Column(children: [
              Expanded(
                child: GridView.count(
                  // crossAxisCount is the number of columns
                  crossAxisCount: 2,
                  // This creates two columns with two items in each column
                  children: List.generate(
                      context.watch<Data>().userProjects.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Material(
                        elevation: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Icon(Icons.circle,
                                    color: getColor(context
                                        .watch<Data>()
                                        .userProjects[index]
                                        .color)),
                              ),
                              Text(
                                context.watch<Data>().userProjects[index].name,
                                style: const TextStyle(
                                    color: Colors.black,
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
                                    color: Colors.black, fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: RaisedButton(
                    child: const Text('+',
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                    color: blue,
                    disabledColor: blue,
                    hoverColor: darkBlue,
                    onPressed: () => showDialog<void>(
                      context: context,
                      child: ProjectCreation(),
                    ),
                  ),
                ),
              )
            ]);
          }
          return const Text('loading');
        });
  }
}
