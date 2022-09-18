import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Classes/Classes.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Set<String> _photoSet = {'assets/images/code.png', 'assets/images/code2.png'};
  String? myreply = '';

  putIntoTextWidget(String? str) {
    setState(() {
      str == "Yes." ? myreply = "Text me." : myreply = 'Your loss.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tutorial Screen')),
        body: Column(
          children: [
            Column(
              // insert play widgets here:
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1.0,
                  ),
                  itemCount: _photoSet.length,
                  itemBuilder: (context, index) {
                    String item = _photoSet.elementAt(index);
                    // print("here it comes...");
                    // print(item);
                    return Image(image: AssetImage(item));
                  },
                ),
                // BouncingBallDemo(),
              ],
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Would you like one?'),
                      validator: (String? value) {
                        putIntoTextWidget(value);
                        return null;
                      },
                    ),
                    Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  _formKey.currentState!.validate();
                                },
                                child: Text('Submit')),
                            Text('$myreply'),
                          ],
                        ))
                  ],
                ))
          ],
        ));
  }
}
