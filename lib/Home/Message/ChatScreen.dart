import 'package:flutter/material.dart';
import 'package:gturn/constant/Widget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:gturn/constant/ColorComman.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // File _image;
  List _items = [
    "1",
    "1",
    "1",
    "1",
  ];

  // final picker = ImagePicker();

  Future getImage() async {
    // final pickedFile = await picker.getImage(source: ImageSource.gallery);

    // setState(() {
    //   _image = File(pickedFile.path);
    // });
  }

  chatList() {
    return ListView.builder(
      reverse: false,
      scrollDirection: Axis.vertical,
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return chatItem(_items[index], "msss", index);
      },
    );
  }

  chatItem(sender, msg, index) {
    return index % 2 == 0
        ? Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/user_image.png',
                      ),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 5.0, right: 60.0),
                    decoration: BoxDecoration(
                        color: HexColor('#FFECE4'),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: HexColor('#DEE2E1'))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 10.0, right: 20.0, bottom: 5.0, top: 10),
                          child: Text(
                              "Hi Rahul, Hope you are having a great day! How can I help you with?",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                              ),
                              overflow: TextOverflow.fade),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5.0, top: 5.0, bottom: 5),
                          child: Text(
                            "10:17AM",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 60.0, right: 5.0),
                    decoration: BoxDecoration(
                        color: HexColor('#F5F5F5'),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: HexColor('#DEE2E1'))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 10.0, right: 20.0, bottom: 5.0, top: 10),
                          child: Text(
                              "Hi Rahul, Hope you are having a great day! How can I help you with?",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                              ),
                              overflow: TextOverflow.fade),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5.0, top: 5.0, bottom: 5),
                          child: Text(
                            "10:17AM",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/user_image.png',
                      ),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: whitecolor,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                'assets/user_image.png',
                height: 25.0,
              ),
              sw10,
              Text("John Deo", style: TextStyle(color: blackcolor)),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: blackcolor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.call_outlined,
                color: yellowcolor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.help,
                color: yellowcolor,
              ),
              onPressed: () {},
            ),
            sw10
          ],
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                sh20,
                Text(
                  "Today at 5:03 PM",
                  style: TextStyle(
                    fontSize: 12,
                    color: greycolor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                sh20,
                Expanded(
                  child: Container(
                    color: Colors.grey[50],
                    child: chatList(),
                  ),
                ),
                Divider(
                  thickness: 2.0,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            getImage();
                          },
                          child: Image.asset(
                            'assets/attachment.png',
                            height: 25.0,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 20.0, right: 20.0),
                            width: MediaQuery.of(context).size.width - 100,
                            child: TextField(
                              cursorColor: HexColor('#718B82'),
                              maxLines: 3,
                              minLines: 1,
                              decoration: new InputDecoration(
                                hintText: 'Write a message.....',
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);

                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: HexColor("#EB6225"),
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              Icons.mic,
                              color: whitecolor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
