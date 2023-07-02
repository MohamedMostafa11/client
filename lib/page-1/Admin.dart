import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Location.dart';

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal[500],
        title: Text('Insight'),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Flexible(child: Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    /*Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return calling();
                    }));*/
                    FlutterPhoneDirectCaller.callNumber('01150889535');
                  },
                  child: Expanded(
                      child: Container(
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/phone.png'),
                            Text(
                              'Call Blind Person',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ]),
                    ),
                    padding: EdgeInsets.all(15.0),
                    margin: EdgeInsets.all(15.0),

                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.height / 4,

                    // color: Colors.red[300],
                    decoration: BoxDecoration(
                      color: Colors.teal[300],
                      //border: Border.all(width: 3,color: Colors.blueAccent),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(3, 3)),
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(-3, -3))
                      ],
                    ),
                  )),
                ),
                GestureDetector(
                  onTap: () {
                    MapUtils.openMap(30.575675, 31.008175);
                  },
                  child: Expanded(
                      child: Container(
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/loc.png'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Location',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ]),
                    ),
                    padding: EdgeInsets.all(15.0),
                    margin: EdgeInsets.all(15.0),

                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.height / 4,

                    // color: Colors.red[300],
                    decoration: BoxDecoration(
                      color: Colors.teal[300],
                      //border: Border.all(width: 3,color: Colors.blueAccent),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(3, 3)),
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(-3, -3))
                      ],
                    ),
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/////////////////////////////////
calling() async {
  const url = 'tel:+201150889535';
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

whatsapp() async {
  const url = "whatsapp://send?phone=+201150889535";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

messenger() async {
  const url = "http://m.me/xyzchannelxyz";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

sms() async {
  const url = 'sms:+201150889535';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

email() async {
  final Uri _emailurl = Uri(
      scheme: 'maito',
      path: 'xyzmohamedchannelalsaee@gmail.com',
      queryParameters: {'subject': 'hello xyz مرحباً محمد'});

  if (await canLaunch(_emailurl.toString())) {
    await launch(_emailurl.toString());
  } else {
    throw 'Could not launch $_emailurl';
  }
}
