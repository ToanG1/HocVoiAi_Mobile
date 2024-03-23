import 'dart:io';
import 'package:ai_journey/config/http_client.dart';
import 'package:ai_journey/pages/home/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final TextEditingController _contextController = TextEditingController();
  late String accessToken;

  XFile? image; //array 23
  var urlImages = [];
  final httpService = HttpService(url);
  final ImagePicker picker = ImagePicker();
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  Future getImage(ImageSource media) async {
    // list image input
    //foreach list image
    var img = await picker.pickImage(source: media);
    setState(() {
      image = img; //add image ==36 // no gans
    });
    if (img != null) {
      String filePath = img.path;
      String? imageUrl = await httpService.uploadFile(filePath);
      if (imageUrl!.isNotEmpty) urlImages.add(imageUrl);
      print(urlImages);
    }
    //dong foreach
  }

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
      setState(() {});
      for (var imageFile in imageFileList!) {
        String? imageUrl = await httpService.uploadFile(imageFile.path);
        if (imageUrl!.isNotEmpty) urlImages.add(imageUrl);
      }
    }
    print("Image List Length:" + imageFileList!.length.toString());
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      selectImages();
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void dltImages(data) {
    imageFileList?.remove(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  SizedBox(width: 40),
                  const Text(
                    "Post",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(width: 45),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await httpService.postUser(
                                _contextController.text, urlImages);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: TextFormField(
                      controller: _contextController,
                      maxLines: 5, // Số dòng tối đa cho phép nhập
                      decoration: const InputDecoration(
                        hintText: 'Write something for your post',
                      ),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'Please describe the problem';
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        myAlert();
                        //selectImages();
                      },
                      child: Text('Upload Photo'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _contextController.text.isNotEmpty
                      ? GridView.builder(
                          itemCount: imageFileList!.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (BuildContext context, int i) {
                            return Container(
                              padding: const EdgeInsets.all(30),
                              child: Stack(
                                children: <Widget>[
                                  SizedBox(
                                    height: 100,
                                    width: 100, // Kích thước của ảnh
                                    child: Image.file(
                                      File(imageFileList![i].path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        imageFileList!.removeAt(i);
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.topRight,
                                      child: const Icon(Icons.cancel,
                                          color: Colors.red),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      : Text(
                          "No Image",
                          style: TextStyle(fontSize: 20),
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
