import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ufo/model/User.dart';
import 'package:ufo/qrcode/gen.dart';
import 'package:ufo/qrcode/scanner.dart';
import 'package:ufo/screen/editdata.dart';
import 'package:ufo/screen/nodata.dart';
import 'package:ufo/screen/update.dart';
import 'package:ufo/service/userService.dart';
import 'package:ufo/ui/buttondesign.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<User> _userList = <User>[];
  final _userService = UserService();
  getAllUserDetails() async {
    var users = await _userService.readAllUsers();
    _userList = <User>[];
    users.forEach((user) {
      setState(() {
        var userModel = User();
        userModel.id = user['id'];
        userModel.name = user['name'];
        userModel.email = user['email'];
        userModel.whatsapp = user['whatsapp'];
        userModel.facebook = user['facebook'];
        userModel.snapchat = user['snapchat'];
        userModel.twitter = user['twitter'];
        userModel.instagram = user['instagram'];
        _userList.add(userModel);
      });
    });
  }

  @override
  void initState() {
    getAllUserDetails();
    super.initState();
  }

  _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      floatingActionButton: ExpandableFabClass(
        distanceBetween: 80.0,
        subChildren: [
          ActionButton(
            onPressed: () {
              if (_userList.isEmpty) {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Update()))
                    .then((data) {
                  if (data == data) {
                    getAllUserDetails();
                    _showSuccessSnackBar('User Detail Added Success');
                  }
                });
              } else {
                if (_userList.isNotEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Updateuser(
                                user: _userList[0],
                              ))).then((data) {
                    if (data == data) {
                      getAllUserDetails();
                      _showSuccessSnackBar('User Detail Edited  Successful');
                    }
                  });
                }
              }
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.black,
            ),
          ),
          ActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scanner(),
                ),
              );
            },
            icon: const Icon(
              Icons.qr_code_scanner,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Text(
                        "Hey ${_userList.isNotEmpty ? _userList[0].name : ''}!",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IcButton(
                                  icon: FontAwesomeIcons.instagram,
                                  onPressed: () {
                                    if (_userList.isNotEmpty) {
                                      String insta =
                                          _userList[0].instagram ?? '';
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => QrCodeQenerator(
                                            user: _userList[0],
                                            data:
                                                insta, // Pass the email or other field you want as data
                                          ),
                                        ),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Nodata(),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 30),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IcButton(
                                  icon: FontAwesomeIcons.snapchat,
                                  onPressed: () {
                                    if (_userList.isNotEmpty) {
                                      String snap = _userList[0].snapchat ?? '';
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => QrCodeQenerator(
                                            user: _userList[0],
                                            data:
                                                snap, // Pass the email or other field you want as data
                                          ),
                                        ),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Nodata(),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 30),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IcButton(
                                  icon: FontAwesomeIcons.facebook,
                                  onPressed: () {
                                    if (_userList.isNotEmpty) {
                                      String face = _userList[0].facebook ?? '';
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => QrCodeQenerator(
                                            user: _userList[0],
                                            data:
                                                face, // Pass the email or other field you want as data
                                          ),
                                        ),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Nodata(),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IcButton(
                                  icon: FontAwesomeIcons.whatsapp,
                                  onPressed: () {
                                    if (_userList.isNotEmpty) {
                                      String whats =
                                          _userList[0].whatsapp ?? '';
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => QrCodeQenerator(
                                            user: _userList[0],
                                            data:
                                                whats, // Pass the email or other field you want as data
                                          ),
                                        ),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Nodata(),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 30),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IcButton(
                                  icon: FontAwesomeIcons.twitter,
                                  onPressed: () {
                                    if (_userList.isNotEmpty) {
                                      String twit = _userList[0].twitter ?? '';
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => QrCodeQenerator(
                                            user: _userList[0],
                                            data:
                                                twit, // Pass the email or other field you want as data
                                          ),
                                        ),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Nodata(),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 30),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IcButton(
                                  icon: Icons.email,
                                  onPressed: () {
                                    if (_userList.isNotEmpty) {
                                      String email = _userList[0].email ?? '';
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => QrCodeQenerator(
                                            user: _userList[0],
                                            data:
                                                email, // Pass the email or other field you want as data
                                          ),
                                        ),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Nodata(),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
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
