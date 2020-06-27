

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redbusclone/authntication.dart';
import 'package:redbusclone/homepage.dart';
import 'package:redbusclone/rootpage.dart';


class Walkthrogh extends StatefulWidget {
  @override
  _WalkthroghState createState() => _WalkthroghState();
}

class _WalkthroghState extends State<Walkthrogh> {
  final PageController _pageController=PageController(
      initialPage: 0
  );
  final int numpage=3;
  int currentpage = 0 ;

  List<Widget>buildpageindiactor(){
    List<Widget> list=[];
    for(int i=0; i<numpage;i++)
    {
      list.add(i==currentpage ? indicator(true) : indicator(false));
    }
    return list;

  }
  Widget indicator(bool isActive){
    return AnimatedContainer(duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 5.0,
      width: isActive ? 20.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.lightBlue : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),);
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(



                  child: Container( padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),

                    alignment: Alignment. bottomRight,
                    child: FlatButton(
                        padding: EdgeInsets.symmetric(vertical: 05,horizontal: 12),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RootPage(auth: Auth(),) ),);
                        },
                        child: Text('Skip',style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),)
                    ),
                  ),
                ),
                Container(
                  height: 550.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page)
                    {
                      setState(() {
                        currentpage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 05),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage('assets/image/digi.jpg'),
                                height: 300,
                                alignment: Alignment.center,
                                width: 300,
                              ),
                            ),
                            SizedBox(height: 05,),
                            Text(
                              'DIGITAL MARKETING',style: TextStyle(
                                fontFamily:'balam',
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            ),
                            ),
                            SizedBox(height: 15.0,),
                            Text('We are you best steps towards a successful careers in Digital Marketing',style: TextStyle(
                              fontFamily: 'jost',fontSize: 16, ),)

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 05),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage('assets/image/we.jpg'),
                                height: 300,
                                alignment: Alignment.center,
                                width: 300,
                              ),
                            ),
                            SizedBox(height: 05,),
                            Text(
                              'E-COMMERCE WEB DEVELOPMENT',style: TextStyle(
                                fontFamily:'balam',
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            ),
                            ),
                            SizedBox(height: 15.0,),
                            Text('Online shopping is getting popular nowadays and it is major neccessity for Business to setup a good e commerce site ',
                              style: TextStyle(
                                fontFamily: 'jost',fontSize: 16, ),
                            )

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 05),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage('assets/image/web.jpg'),
                                height: 300,
                                alignment: Alignment.center,
                                width: 300,
                              ),
                            ),
                            SizedBox(height: 05,),
                            Text(
                              'WEB APPLICATION DEVELOPMENT',style: TextStyle(
                                fontFamily:'balam',
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            ),
                            ),
                            SizedBox(height: 10.0,),
                            Text('WebSoulLabs adopt a comprehensive strategy for web development beginning from web coding to web design and content ',
                              style: TextStyle(
                                fontFamily: 'jost',fontSize: 16, ),)

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:buildpageindiactor(),
                ),
                currentpage !=numpage -1 ?Expanded(child: Align(alignment: FractionalOffset.bottomRight,
                  child: FlatButton(onPressed: () {
                    _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                  },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Next",style: TextStyle(color: Colors.black87,fontSize: 20.0),
                        ),
                        SizedBox(width: 09,),
                        Icon(Icons.arrow_forward,color: Colors.black87,size: 26,
                        ),
                      ],
                    ),
                  ),
                ),
                )
                    :Text(''),

              ],
            ),
          ),
        ),
      ) ,
      bottomSheet: currentpage == numpage -1 ? Container(
        height: 50,
        width: double.infinity,
        color: Colors.lightBlue,
        child: GestureDetector(
          onTap: () {     Navigator.push(context, MaterialPageRoute(builder: (context)=>RootPage(auth: Auth(),) ),);},
          child: Center(
            child: Padding(padding: EdgeInsets.only(bottom: 08.0),
              child: Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 19.0,fontWeight: FontWeight.bold),),),
          ),
        ),
      )
          :Text(""),
    );
  }
}
