import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyStoreItem extends StatelessWidget {
  const MyStoreItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Image.asset(
                    "assets/images/lg_phone.png",
                    fit: BoxFit.fill,
                    height: double.infinity,
                    width: double.infinity,
                  )),
              const SizedBox(width:12),
              Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[

                      Row(
                        children: const <Widget>[
                          Expanded(
                              child:  Text(
                            "LG-flap 2031",
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                          )),
                          Icon(FontAwesomeIcons.edit,size: 20,color: Colors.blue,)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.rupeeSign,color: Colors.red[900],size: 18,),
                          const Expanded(
                              child:  Text(
                                "5,00,000",
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),
                              )),

                        ],
                      ),
                      const SizedBox(height:8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Icon(CupertinoIcons.location,color: Colors.blue,size: 22,),
                           Expanded(
                              child:  Text(
                                "Narayan Nagar, SDMH Hospital, Jaipur",
                                maxLines: 2,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
                              )),

                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
