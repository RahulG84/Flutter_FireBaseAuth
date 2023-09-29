import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_signup_with_firebase/screens/services/save_data.dart';
import 'package:login_signup_with_firebase/utils/utils.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser;
  Uint8List? image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(
      () {
        image = img;
      },
    );
  }

  void saveProfileImage() async {
    String resp = await StoreData().saveData(file: image!);
    print(resp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                image != null
                    ? CircleAvatar(
                        radius: 60.00,
                        backgroundImage: MemoryImage(image!),
                      )
                    : const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60.00,
                        child: Image(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                        ),
                      ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    color: Colors.black,
                    onPressed: selectImage,
                    icon: const Icon(Icons.add_a_photo),
                    iconSize: 30,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Hello ${user!.email.toString()}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 40),
              ),
              onPressed: saveProfileImage,
              child: const Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}
