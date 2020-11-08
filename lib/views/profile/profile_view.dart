import 'package:FL1_Norbert/models/data.dart';
import 'package:FL1_Norbert/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';
import 'dart:convert';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final List<String> projectName = <String>[
    'Events',
    'To do Tasks',
    'Project',
    'autre projet'
  ];
  final List<Color> colorCodes = [blue, red, darkBlue, red];
  final List<String> description = <String>[
    '10 Tasks',
    '2 Tasks',
    '20 Tasks',
    '1 Task'
  ];

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
            children: [
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
                        child: Image.asset(context.watch<Data>().user.image,
                            fit: BoxFit.cover),
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
                      children: [
                        Text(
                            context.watch<Data>().user.firstName +
                                ' ' +
                                context.watch<Data>().user.lastName,
                            style: const TextStyle(fontSize: 20)),
                        Text(context.watch<Data>().user.email,
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
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('120', style: TextStyle(fontSize: 20)),
                        const Text('Tâches Créées',
                            style: TextStyle(color: Colors.grey, fontSize: 17)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('80', style: TextStyle(fontSize: 20)),
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
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.17,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              itemCount: projectName.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: colorCodes[index],
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            Text(
                              projectName[index],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              description[index],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 17),
                            ),
                          ],
                        )),
                  ),
                );
              }),
        ),
      ),
      Padding(
          padding: const EdgeInsets.all(20),
          child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(5),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        'Statistiques',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 100.0,
                                  lineWidth: 3.0,
                                  percent: 0.5,
                                  center: const Text('50%',
                                      style: TextStyle(fontSize: 20)),
                                  progressColor: grey,
                                ),
                                const Text('Events',
                                    style: TextStyle(fontSize: 20))
                              ],
                            ),
                            Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 100.0,
                                  lineWidth: 3.0,
                                  percent: 0.5,
                                  center: const Text('50%',
                                      style: TextStyle(fontSize: 20)),
                                  progressColor: red,
                                ),
                                const Text('To do',
                                    style: TextStyle(fontSize: 20))
                              ],
                            ),
                            Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 100.0,
                                  lineWidth: 3.0,
                                  percent: 0.5,
                                  center: const Text('50%',
                                      style: TextStyle(fontSize: 20)),
                                  progressColor: blue,
                                ),
                                const Text('Project',
                                    style: TextStyle(fontSize: 20))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )))
    ]);
  }
}
