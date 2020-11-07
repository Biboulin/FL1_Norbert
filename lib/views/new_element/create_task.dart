import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:FL1_Norbert/models/task/task.dart';
import 'package:FL1_Norbert/services/task.dart';
import 'package:FL1_Norbert/utils/colors.dart';
import 'package:FL1_Norbert/views/new_element/select_date_dialog.dart';
import 'package:FL1_Norbert/views/new_element/select_image_dialog.dart';
import 'package:FL1_Norbert/views/new_element/select_members_dialog.dart';
import 'package:FL1_Norbert/views/widgets/project_tooltip.dart';
import 'package:FL1_Norbert/views/widgets/user_tooltip.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:FL1_Norbert/models/data.dart';
import 'package:FL1_Norbert/models/project.dart';
import 'package:FL1_Norbert/models/user.dart';
import 'package:FL1_Norbert/views/widgets/search_project_card.dart';
import 'package:FL1_Norbert/views/widgets/search_user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CreateTask extends StatefulWidget {
  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  TextEditingController _membersController;
  TextEditingController _projectsController;
  TextEditingController _titleController;
  TextEditingController _descriptionController;

  /// Display list with all users or projects when choosing an assignee and a project
  /// or display the default content of the view.
  bool _isEditingAssignee = false;
  bool _isEditingProject = false;

  final List<User> _displayUsers = <User>[];
  final List<Project> _displayProjects = <Project>[];
  final List<User> _membersAssignedToTask = <User>[];
  final List<Widget> _displayMembersToAdd = <Widget>[];

  /// Assignee and project selected by the user.
  User _assignee;
  Project _project;

  /// Used to take an image from gallery or camera.
  File _image;
  final ImagePicker picker = ImagePicker();

  DateTime _selectedDate;

  IconButton _addMembersWidget;

  @override
  void initState() {
    _membersController = TextEditingController();
    _projectsController = TextEditingController();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();

    /// Filling the lists to display from the provider.
    _displayUsers
        .addAll(_setAssigneesList(_membersController.value.text, context));
    _displayProjects
        .addAll(_setProjectsList(_projectsController.value.text, context));

    /// Insert IconButton to add members to list.
    _addMembersWidget = IconButton(
      icon: const Icon(Icons.add_circle_outline),
      onPressed: () {
        showDialog<User>(
          context: context,
          child: SelectMembersDialog(context.read<Data>().users),
        ).then(
          (User user) => setState(() {
            if (user != null) {
              _displayMembersToAdd.add(UserToolTip(user));
              _membersAssignedToTask.add(user);
            }
          }),
        );
      },
    );
    _displayMembersToAdd.add(_addMembersWidget);
    super.initState();
  }

  @override
  void dispose() {
    _membersController.dispose();
    _projectsController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouvelle tâche'),
        backgroundColor: blue,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(top: 15.0),
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
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                const Text(
                  'Pour',
                  style: TextStyle(fontSize: 16),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      color: Colors.grey[200],
                      child: _assignee == null
                          ? TextField(
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
                                hintText: 'Propriétaire',
                              ),
                            )
                          : UserToolTip(_assignee),
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
                const Text(
                  'Dans',
                  style: TextStyle(fontSize: 16),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      color: Colors.grey[200],
                      child: _project == null
                          ? TextField(
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
                                hintText: 'Projet',
                              ),
                            )
                          : ProjectToolTip(_project),
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
              margin: const EdgeInsets.only(top: 15.0),
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
              color: Colors.grey[200],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _title(),
                  _description(),
                  _date(),
                  _membersAndValidate(),
                ],
              ),
            ),
          );
  }

  Padding _title() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            'Titre',
            style: TextStyle(fontSize: 16),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                controller: _titleController,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _description() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Description',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey[300],
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                        ),
                        child: TextField(
                          expands: true,
                          minLines: null,
                          maxLines: null,
                          controller: _descriptionController,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.attach_file),
                          onPressed: () {
                            showDialog<ImageSource>(
                              context: context,
                              child: SelectImageDialog(),
                            ).then((ImageSource source) => _getImage(source));
                          },
                        ),
                        if (_image != null)
                          const Text(
                            'Image sélectionnée',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        if (_image != null)
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () => setState(() => _image = null),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _date() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          const Text(
            'Date prévue',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: RaisedButton(
              child: Text(
                _selectedDate == null
                    ? 'Afficher le calendrier'
                    : DateFormat.yMMMMd('fr_FR')
                        .format(_selectedDate)
                        .toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              color: brownButton,
              onPressed: () => showDialog<DateTime>(
                context: context,
                child: SelectDateDialog(),
              ).then((DateTime date) => setState(() => _selectedDate = date)),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _membersAndValidate() {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.only(
          top: 30.0,
          bottom: 15.0,
          left: 15.0,
          right: 15.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Ajouter des membres',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _displayMembersToAdd.length,
                itemBuilder: (BuildContext context, int i) => Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: _displayMembersToAdd[i],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    width: double.infinity,
                    child: RaisedButton(
                      child: const Text(
                        'Valider la tâche',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      color: blue,
                      onPressed: () async {
                        final Uint8List bytes = _image.readAsBytesSync();
                        final String _image64 = base64Encode(bytes);
                        final List<String> _membersIds = <String>[];
                        for (final User user in _membersAssignedToTask)
                          _membersIds.add(user.id);
                        final Task tmp = Task(
                          title: _titleController.text,
                          userId: _assignee.id,
                          attachedProjectId: _project.id,
                          description: _descriptionController.text,
                          image: _image64,
                          dueDate: _selectedDate,
                          attachedUserIds: _membersIds,
                        );
                        createTask(tmp);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
