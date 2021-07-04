import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'file:///D:/Flutter_app/mevoicingglove/lib/constants/constants.dart';
import 'package:system_settings/system_settings.dart';
import 'file:///D:/Flutter_app/mevoicingglove/lib/constants/cards.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MainScreen extends StatefulWidget {


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return SafeArea(
      child: MainCard(
          child:Column(
            children: [

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(

                      child:
                      Image.asset('images/signin.png',height: height*.13,width: width*.13,),
                      onTap: (){
                        setState(() {
                          Navigator.pushNamed(context, '/loginpage');
                        });
                      },

                    ),

                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child:FractionallySizedBox(
                    widthFactor: 1.5,
                    heightFactor: 1.5,
                    child: Container(
                        margin: EdgeInsets.only(top: height*.1,bottom: height*.1),
                        child: GestureDetector(
                            onTap: (){
                              setState(() {
                                SystemSettings.wifi();
                              });
                            },
                            child: Image.asset('images/wifi.png'))),
                  )),
              SizedBox(height: height*.08,),

              IconCard(width: width, height: height,flex: 1,image: 'output',text: 'Output Screen',
                onPressed: (){
                  setState(() {
                    Navigator.pushNamed(context, '/outputscreen');
                  });
                }
                ,),
              IconCard(width: width, height: height,flex:1,image: 'usermanual',text: 'Usermanual'),
              IconCard(width: width, height: height,flex:1,image: 'settings',text: 'Settings',
                  onPressed: (){
                    setState(() {
                      Navigator.pushNamed(context, '/settingspage');
                    });
                  }),
              IconCard(width: width, height: height,flex:1,image: 'close',text: 'Close',onPressed: (){
                setState(() {
                  SystemNavigator.pop();
                });
              },),
              SizedBox(height: height*.1,),



            ],

          )

      ),
    );
  }
}

class IconCard extends StatelessWidget {
  IconCard({@required this.width,@required this.height,this.flex,this.text,this.image,this.onPressed});

  final double width;
  final double height;
  final int flex;
  final String text;
  final String image;
  final Function onPressed;


  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: Row(
          children: [
            GestureDetector(
              onTap: onPressed,
              child: Container(
                margin: EdgeInsets.only(left: width*.1,right: width*.1),
                padding: EdgeInsets.all(width*.02),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff221E33),width: 4),
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff17181E),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(5, 7), // changes position of shadow
                    )],
                ),
                width: width*.8,
                height: height*.1,
                child:  Row(
                  children: [
                    Image.asset("images/$image.png",height:height*.12,width: width*.12,),
                    SizedBox(width: 20,),
                    AutoSizeText(
                      text,
                      style: iconTag,
                      maxLines: 1,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}