import 'package:flutter/material.dart';
import 'sizeconfig.dart';
import 'constants.dart';


class MainCard extends StatelessWidget {
  MainCard({this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: mainColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.5),
            spreadRadius: 10,
            blurRadius: 5,
            offset: Offset(5, 7), // changes position of shadow
          )],
      ),
      child: child,
    );
  }
}