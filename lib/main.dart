import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/results_page.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Login(),
  ));
}


class Login extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Login> {

  final textcontroller=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF575e7e),
      body:Center(
        child: Container(
          child:SingleChildScrollView(
            child: Padding(
              padding:const EdgeInsets.all(8.0),
              child:Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    elevation:3.0,
                    color:Colors.white,
                    margin:EdgeInsets.only(left:10,right:10),
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    child:Padding(
                      padding: const EdgeInsets.all(10),
                      child:Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child:Image.asset('images/tasarım.JPG'),
                          ),
                          Text(
                            'Welcome To Image Search',
                            style:TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize:30.0,
                              color:Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Everything you are looking for is here',
                            style:TextStyle(
                              fontFamily: 'Tangerine',
                              fontSize:30.0,
                              color:Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          new ListTile(
                            title: TextFormField(
                              controller: textcontroller,
                              style:TextStyle(color:Color(0xFF000000)),
                              cursorColor:Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon:Icon(
                                  Icons.search,
                                  color:Colors.deepOrange,
                                ),
                                hintText:"Search Image",
                                hintStyle: TextStyle(
                                  color:Color(0xFF9b9b9b),
                                  fontSize:15,
                                  fontWeight:FontWeight.normal,

                                  )
                                ),
                              ),
                            ),
                          GestureDetector(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage()));
                            },
                              child: RaisedButton(
                                child: Text(
                                  'GO!',
                                  style:TextStyle(
                                    color:Colors.black,
                                    fontSize: 15,
                                    decoration:TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                   ),
                                  ),

                              ),

                              ),

                      ],

                  ),
                ),
              )
          ],
        ),
            ),
      ),
    ),
      ),
    );
  }
}


