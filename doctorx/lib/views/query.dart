import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getflutter/getflutter.dart';

class QueryPage extends StatefulWidget {
  QueryPage({Key key}) : super(key: key);

  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {
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
        child: Column(
          children: <Widget>[
            Text('Home'),
          ],
        ),
      ),
    );
  }
}
