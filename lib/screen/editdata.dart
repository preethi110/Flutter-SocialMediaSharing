import 'package:flutter/services.dart';
import 'package:ufo/model/User.dart';
import 'package:ufo/screen/homepage.dart';
import 'package:ufo/service/userService.dart';
import 'package:flutter/material.dart';

class Updateuser extends StatefulWidget {
  final User user;

  const Updateuser({Key? key, required this.user}) : super(key: key);

  @override
  State<Updateuser> createState() => _UpdateuserState();
}

class _UpdateuserState extends State<Updateuser> {
  final TextEditingController _textEditingController = TextEditingController();
  var _userNameController = TextEditingController();
  var _EmController = TextEditingController();
  var _InController = TextEditingController();
  var _SnController = TextEditingController();
  var _FaController = TextEditingController();
  var _WhController = TextEditingController();
  var _TWController = TextEditingController();

  var _userService = UserService();

  @override
  void initState() {
    setState(() {
      _userNameController.text = widget.user.name ?? '';
      _EmController.text = widget.user.email ?? '';
      _InController.text = widget.user.instagram ?? '';
      _FaController.text = widget.user.facebook ?? '';
      _TWController.text = widget.user.twitter ?? '';
      _SnController.text = widget.user.snapchat ?? '';
      _WhController.text = widget.user.whatsapp ?? '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Lets update!",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Username",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: _userNameController,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: _EmController,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Instagram",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: _InController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            // Add this focusedBorder property
                            borderSide: BorderSide(
                                color: Colors.blueAccent), // Set to black color
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Snapchat",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: _SnController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            // Add this focusedBorder property
                            borderSide: BorderSide(
                                color: Colors.blueAccent), // Set to black color
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Facebook",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: _FaController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            // Add this focusedBorder property
                            borderSide: BorderSide(
                                color: Colors.blueAccent), // Set to black color
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Whatsapp",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: _WhController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            // Add this focusedBorder property
                            borderSide: BorderSide(
                                color: Colors.blueAccent), // Set to black color
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Twitter",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: _TWController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            // Add this focusedBorder property
                            borderSide: BorderSide(
                                color: Colors.blueAccent), // Set to black color
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom:
                          BorderSide(color: const Color.fromRGBO(0, 0, 0, 1)),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    ),
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () async {
                      var _user = User();
                      _user.id = widget.user.id;
                      _user.name = _userNameController.text;
                      _user.email = _EmController.text;
                      _user.snapchat = _SnController.text;
                      _user.facebook = _FaController.text;
                      _user.instagram = _InController.text;
                      _user.twitter = _TWController.text;
                      _user.whatsapp = _WhController.text;

                      var result = await _userService.UpdateUser(_user);
                      print("Good Data Can update");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    },
                    color: Color(0xff0095FF),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
