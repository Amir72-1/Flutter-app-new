import 'package:flutter/material.dart';


class NumberWidget extends StatelessWidget {
@override
Widget build(BuildContext context) => IntrinsicHeight(
  child:   Row (
  mainAxisAlignment: 
MainAxisAlignment.center,
children:<Widget> [
  
buildButton(context,'4.9','Ranking'),
buildDivider(),
buildButton(context, '50', 'likes'),

],
),
);
Widget buildDivider() => Container(height: 24,child: VerticalDivider());

  Widget buildButton (BuildContext context, String value, String text)  {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 4),
      onPressed: () {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),
          ),
          SizedBox(height: 5,),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  } 
}