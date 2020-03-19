import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getflutter/getflutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(45),
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Poppins',
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Ask any '),
                    TextSpan(
                      text: 'medical query ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    TextSpan(text: 'or '),
                    TextSpan(
                      text: 'scan ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    TextSpan(text: 'your lab reports to get insights from '),
                    TextSpan(
                      text: 'Dr. X',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(25)),
              Image.asset('assets/doc.png'),
              SizedBox(height: ScreenUtil().setHeight(50)),
              GFButton(
                buttonBoxShadow: true,
                enableFeedback: true,
                size: GFSize.LARGE,
                onPressed: () => Navigator.of(context).pushNamed('query'),
                text: "Get Started",
                textStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: ScreenUtil().setSp(40),
                  fontWeight: FontWeight.bold,
                ),
                icon: Icon(
                  Icons.question_answer,
                  color: Colors.white,
                  size: ScreenUtil().setWidth(50),
                ),
                type: GFButtonType.solid,
                fullWidthButton: true,
                color: Theme.of(context).accentColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
