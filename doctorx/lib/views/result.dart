import 'package:doctorx/models/Entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getflutter/getflutter.dart';

class ResultsPage extends StatefulWidget {
  ResultsPage({Key key}) : super(key: key);

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  List<Entity> _entities = [
    Entity(
      name: 'Ibuprofen',
      type: 2,
      description:
          'A nonsteroidal anti-inflammatory agent with analgesic properties used in the therapy of rheumatism and arthritis.',
    ),
    Entity(
      name: 'Fever',
      type: 1,
      description:
          'An abnormal elevation of body temperature, usually as a result of a pathologic process.',
    ),
    Entity(
      name: 'Middle East Respiratory Syndrome - MERS',
      type: 1,
      description:
          'A viral disorder characterized by SARS (Severe Acute Respiratory Syndrome)-like symptoms caused by MERS-CoV (CoronaVirus).',
    ),
  ];

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
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
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GFListTile(
                    avatar: GFAvatar(
                      child: this._entities[index].type == 1
                          ? Image.asset('assets/virus.png')
                          : Image.asset('assets/med.png'),
                      backgroundColor: Colors.transparent,
                      size: GFSize.LARGE,
                    ),
                    titleText: this._entities[index].name,
                    subtitleText: this._entities[index].description,
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: this._entities.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
