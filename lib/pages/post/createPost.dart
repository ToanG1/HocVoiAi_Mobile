import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phần bên trên
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  SizedBox(width: 25), // Khoảng cách giữa icon và logo
                  Text(
                    "Post",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Khoảng cách giữa hai phần
            // Phần bên dưới
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Write something your post',
                    ),
                    validator: (value) {
                      if (value!.isEmpty)
                        return 'Please, describe the problem ';
                    },
                  ),
                  SizedBox(height: 20.0),
                  CustomImageFormField(
                    validator: (val) {},
                    onChanged: (_file) {},
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Xử lý khi nhấn nút
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomImageFormField extends StatelessWidget {
  CustomImageFormField({
    Key? key,
    required this.validator,
    required this.onChanged,
  }) : super(key: key);
  final String? Function(File?) validator;
  final Function(File) onChanged;
  File? _pickedFile;
  @override
  Widget build(BuildContext context) {
    return FormField<File>(
        validator: validator,
        builder: (formFieldState) {
          return Column(
            children: [
              GestureDetector(
                onTap: () async {
                  FilePickerResult? file = await FilePicker.platform
                      .pickFiles(type: FileType.image, allowMultiple: true);
                  if (file != null) {
                    _pickedFile = File(file.files.first.path!);
                    onChanged.call(_pickedFile!);
                  }
                },
              ),
              if (formFieldState.hasError)
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 10),
                  child: Text(
                    formFieldState.errorText!,
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 13,
                        color: Colors.red[700],
                        height: 0.5),
                  ),
                )
            ],
          );
        });
  }
}
