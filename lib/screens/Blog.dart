import 'package:design_lab/screens/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Blog extends StatefulWidget {
  final String name;
  const Blog({Key? key, required this.name}) : super(key: key);
  static const String id = 'Blog';
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _title = TextEditingController();
  TextEditingController _body = TextEditingController();

  var image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Back, ${widget.name}'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          child: Form(
            key: _globalkey,
            child: ListView(
              children: <Widget>[
                titleTextField(),
                bodyTextField(),
                SizedBox(
                  height: 20,
                ),
                addButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget titleTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: TextFormField(
        controller: _title,
        validator: (value) {
          if (value!.isEmpty) {
            return "Title can't be empty";
          } else if (value.length > 100) {
            return "Title length should be <=100";
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            ),
          ),
          labelText: "Add Image and Title",
          prefixIcon: IconButton(
            icon: Icon(
              Icons.photo_album,
              color: Colors.teal,
            ),
            onPressed: _uploadImage,
          ),
        ),
        maxLength: 100,
        maxLines: null,
      ),
    );
  }

  Widget bodyTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: TextFormField(
        controller: _body,
        validator: (value) {
          if (value!.isEmpty) {
            return "Body can't be empty";
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            ),
          ),
          labelText: "Provide Body Your Blog",
        ),
        maxLines: null,
      ),
    );
  }

  Widget addButton() {
    return RaisedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => new Dashboard(
              name: widget.name, title: _title.text, body: _body.text),
        ));
      },
      child: Text(
        'Add Blog',
        style: TextStyle(fontSize: 20.0),
      ),
      color: Colors.teal,
      elevation: 7.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(38.0),
      ),
    );
  }

  void _uploadImage() async {
    final _picker = ImagePicker();

    var _pickedImage = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      image = _pickedImage!.path;
    });
  }
}
