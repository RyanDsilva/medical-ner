import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getflutter/getflutter.dart';
import 'package:image_picker/image_picker.dart';

class QueryPage extends StatefulWidget {
  QueryPage({Key key}) : super(key: key);

  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {
  TextEditingController _queryController = new TextEditingController();
  String _text = '';
  File _image;

  void getImage(int source) async {
    if (source == 1) {
      var imageSrc = await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        _text = '';
        _image = imageSrc;
      });
      performOCR();
    } else if (source == 2) {
      var imageSrc = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _text = '';
        _image = imageSrc;
      });
      performOCR();
    } else {
      showFlushbar(
        context: context,
        flushbar: FlushbarHelper.createError(
          message: 'Invalid Image Source',
        )..show(context),
      );
    }
  }

  void performOCR() async {
    final FirebaseVisionImage _ocrImage =
        FirebaseVisionImage.fromFile(this._image);
    final TextRecognizer _textRecognizer =
        FirebaseVision.instance.textRecognizer();
    final VisionText visionText = await _textRecognizer.processImage(_ocrImage);
    setState(() {
      this._text = visionText.text.replaceAll("\n", " ");
    });
    _textRecognizer.close();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: true);
    return Scaffold(
      appBar: GFAppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).accentColor,
          size: ScreenUtil().setWidth(50),
        ),
        title: Text(
          "Doctor X",
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.bold,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1, 0.5),
                blurRadius: 0.5,
                color: Theme.of(context).accentColor.withAlpha(127),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Query',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(45),
                    ),
                  ),
                  TextField(
                    controller: _queryController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(25)),
                  Text(
                    'OR',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(45),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(15)),
                  GFButton(
                    buttonBoxShadow: true,
                    enableFeedback: true,
                    size: GFSize.LARGE,
                    onPressed: () => this.getImage(2),
                    text: "Scan Document",
                    textStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: ScreenUtil().setSp(40),
                      fontWeight: FontWeight.bold,
                    ),
                    icon: Icon(
                      Icons.photo_camera,
                      color: Colors.white,
                      size: ScreenUtil().setWidth(50),
                    ),
                    type: GFButtonType.solid,
                    fullWidthButton: true,
                    color: Theme.of(context).accentColor,
                  ),
                  SizedBox(height: ScreenUtil().setHeight(30)),
                  Text(this._text),
                  SizedBox(height: ScreenUtil().setHeight(30)),
                  GFButton(
                    buttonBoxShadow: true,
                    enableFeedback: true,
                    size: GFSize.LARGE,
                    onPressed: () => Navigator.of(context).pushNamed('result'),
                    text: "Submit Query",
                    textStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: ScreenUtil().setSp(40),
                      fontWeight: FontWeight.bold,
                    ),
                    icon: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: ScreenUtil().setWidth(50),
                    ),
                    type: GFButtonType.solid,
                    fullWidthButton: true,
                    color: Theme.of(context).accentColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
