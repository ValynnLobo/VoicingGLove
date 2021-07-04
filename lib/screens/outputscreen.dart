import 'package:flutter/material.dart';
import 'file:///D:/Flutter_app/mevoicingglove/lib/constants/cards.dart';
import 'file:///D:/Flutter_app/mevoicingglove/lib/constants/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class OutputScreen extends StatefulWidget {
  const OutputScreen({Key key}) : super(key: key);

  @override
  _OutputScreenState createState() => _OutputScreenState();
}

class _OutputScreenState extends State<OutputScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('Output Screen'),),
      body: MainCard(
        child: Container(child:Center(child: Text('Output Text will come here'))),
      ),
    ));
  }
}