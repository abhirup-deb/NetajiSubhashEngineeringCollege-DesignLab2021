import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:design_lab/screens/call.dart';

class Dashboard extends StatefulWidget {
  final String name;
  final String title;
  final String body;
  const Dashboard(
      {Key? key, required this.name, required this.title, required this.body})
      : super(key: key);
  static const String id = 'Dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Center(
          child: Text('Your Personal Dashboard'),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                Position l = await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.high);
                print(l.latitude);
                print(l.longitude);
              },
              icon: Icon(Icons.location_on)),
          SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, CallPage.id);
              },
              icon: Icon(Icons.call)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Center(
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            height: 250.0,
            width: 500.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27.0),
                color: Colors.black12),
            child: Row(
              children: [
                Icon(Icons.image, size: 47.0),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text(widget.title,
                        style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.0),
                    Text('Author - ${widget.name}',
                        style: TextStyle(
                            fontSize: 14.0, fontStyle: FontStyle.italic)),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Published on - 05-07-2021',
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.grey)),
                        // GestureDetector(
                        //   onTap: () async {
                        //     // await DatabaseService(uid: widget.userId).togglingLikes(widget.blogPostId);
                        //     // blogPostSnap = await blogPostRef.get();
                        //     // setState(() {
                        //     //   _isLiked = !_isLiked;
                        //     // });
                        //   },
                        //   child: Container(
                        //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7.0),
                        //     decoration: BoxDecoration(
                        //       color: Colors.black12,
                        //       borderRadius: BorderRadius.circular(20.0),
                        //     ),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: <Widget>[
                        //         // _isLiked != null ? (_isLiked ? Icon(Icons.thumb_up, size: 17.0, color: Colors.red) : Icon(Icons.thumb_up, size: 17.0)) : Text(''),
                        //         Icon(Icons.thumb_up, size: 17.0),
                        //         SizedBox(width: 7.0),
                        //         // blogPostSnap != null ? Text('${blogPostSnap.data['likedBy'].length} Like(s)', style: TextStyle(fontSize: 13.0)) : Text(''),
                        //       ],
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    SizedBox(height: 40.0),
                    Text(widget.body, style: TextStyle(fontSize: 16.0)),
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
