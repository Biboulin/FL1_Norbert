import 'package:FL1_Norbert/models/data.dart';
import 'package:FL1_Norbert/models/project.dart';
import 'package:FL1_Norbert/models/user.dart';
import 'package:FL1_Norbert/views/widgets/search_project_card.dart';
import 'package:FL1_Norbert/views/widgets/search_user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CreateTask extends StatefulWidget {
  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  TextEditingController _membersController;
  TextEditingController _projectsController;

  /// Display list with all users or projects when choosing an assignee and a project
  /// or display the default content of the view.
  bool _isEditingAssignee = false;
  bool _isEditingProject = false;

  final List<User> _displayUsers = <User>[];
  final List<Project> _displayProjects = <Project>[];

  /// Assignee and project selected by the user.
  User _assignee;
  Project _project;

  @override
  void initState() {
    _membersController = TextEditingController();
    _projectsController = TextEditingController();

    /// Filling the lists to display from the provider.
    _displayUsers
        .addAll(_setAssigneesList(_membersController.value.text, context));
    _displayProjects
        .addAll(_setProjectsList(_projectsController.value.text, context));
    super.initState();
  }

  @override
  void dispose() {
    _membersController.dispose();
    _projectsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouvelle tâche'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _assigneeProjectHeader(),
            _content(),
          ],
        ),
      ),
    );
  }

  Padding _assigneeProjectHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                const Text('Pour'),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      color: Colors.grey[200],
                      child: TextField(
                        onTap: () => setState(() {
                          _isEditingAssignee = true;
                          _isEditingProject = false;
                        }),
                        onChanged: (String query) => setState(
                          () => _displayUsers
                            ..clear()
                            ..addAll(_setAssigneesList(query, context)),
                        ),
                        controller: _membersController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                const Text('Projet'),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      color: Colors.grey[200],
                      child: TextField(
                        controller: _projectsController,
                        onTap: () => setState(() {
                          _isEditingProject = true;
                          _isEditingAssignee = false;
                        }),
                        onChanged: (String query) => setState(
                          () => _displayProjects
                            ..clear()
                            ..addAll(_setProjectsList(query, context)),
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _content() {
    return _isEditingAssignee == true || _isEditingProject == true
        ? Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 30.0),
              color: Colors.grey[200],
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int i) =>
                    const Divider(),
                itemCount: _isEditingAssignee
                    ? _displayUsers.length
                    : _displayProjects.length,
                itemBuilder: (BuildContext context, int i) => _isEditingAssignee
                    ? SearchUserCard(_displayUsers[i], _handleAssigneeOnTap)
                    : SearchProjectCard(
                        _displayProjects[i], _handleProjectOnTap),
              ),
            ),
          )
        : Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 15.0),
              color: Colors.blue[200],
            ),
          );
  }

  List<User> _setAssigneesList(String query, BuildContext context) {
    final List<User> tmp = <User>[];
    tmp.addAll(
      context.read<Data>().users.where((User user) =>
          user.firstName.contains(query) ||
          user.lastName.contains(query) ||
          user.email.contains(query)),
    );
    return tmp;
  }

  List<Project> _setProjectsList(String query, BuildContext context) {
    final List<Project> tmp = <Project>[];
    tmp.addAll(
      context
          .read<Data>()
          .projects
          .where((Project project) => project.name.contains(query)),
    );
    return tmp;
  }

  void _handleAssigneeOnTap(User user) {
    setState(() {
      _assignee = user;
      _isEditingAssignee = false;
    });
    print(_assignee.email);
  }

  void _handleProjectOnTap(Project project) {
    setState(() {
      _project = project;
      _isEditingProject = false;
    });
    print(_project.name);
  }
}
