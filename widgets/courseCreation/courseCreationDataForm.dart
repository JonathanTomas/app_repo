import 'package:cursos/constants/fontStyles.dart';
import 'package:cursos/services/setCourseData.dart';
import 'package:cursos/widgets/courseCreation/inputField.dart';
import 'package:flutter/material.dart';

class CourseCreationDataForm extends StatefulWidget {
  CourseCreationDataForm({Key key}) : super(key: key);

  @override
  _CourseCreationDataFormState createState() => _CourseCreationDataFormState();
}

class _CourseCreationDataFormState extends State<CourseCreationDataForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _categoryController = TextEditingController();
  final _descriptionController = TextEditingController();
  List<bool> _selections = List.generate(4, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Course title', style: courseScreenTitle),
          Container(height: 10),
          InputField(
            hint: 'Give it a cool name!',
            errorText: 'Course name is required',
            charCount: 60,
            textInputAction: TextInputAction.next,
            textController: _titleController,
          ),
          Container(height: 10),
          Text('Category', style: courseScreenTitle),
          Container(height: 10),
          InputField(
            hint: 'What technology or topic is it about?',
            errorText: 'Course category is required',
            charCount: null,
            textInputAction: TextInputAction.next,
            textController: _categoryController,
          ),
          Container(height: 10),
          Text('Description', style: courseScreenTitle),
          Container(height: 10),
          InputField(
            hint: 'What are you about to teach?',
            errorText: 'Course category is required',
            charCount: 200,
            maxLines: 5,
            textInputAction: TextInputAction.done,
            textController: _descriptionController,
          ),
          Container(height: 10),
          ToggleButtons(
            isSelected: _selections,
            renderBorder: false,
            children: [
              Text(
                'Rookie',
                style: authorDisplayName,
              ),
              Text(
                'Intermediate',
                style: authorDisplayName,
              ),
              Text(
                'Senior',
                style: authorDisplayName,
              ),
              Text(
                'Professional',
                style: authorDisplayName,
              ),
            ],
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0;
                    buttonIndex < _selections.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    _selections[buttonIndex] = !_selections[buttonIndex];
                  } else {
                    _selections[buttonIndex] = false;
                  }
                }
              });
            },
          ),
          Container(height: 35),
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                SetCourseData(
                  title: _titleController.value.text,
                  category: _categoryController.value.text,
                  description: _descriptionController.value.text,
                  img: 'imagenURL',
                  lessonsNum: '7',
                  level: 'levelString',
                  price: '2000',
                ).createRecord();
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            },
            child: Text('Submit', style: redButtonText),
          ),
        ],
      ),
    );
  }
}
