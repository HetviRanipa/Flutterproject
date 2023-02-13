import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/secondpage.dart';

class Mainpage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    var size =MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width :size.width,
          height : size.height,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child:
                Container(
                  margin: const EdgeInsets.only(left:20,top: 30,right: 15),
                  width: size.width,
                  child:Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                    Text(' Lets Create \n Your Own Style',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                              'Each women has unique style , we  ''\n'
                              'help you to create your very own style ''\n'
                              'because you deserve to shine like star.',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontFamily: 'Lato'
                        ),
                      ),
                    ),
                  ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Padding(
                      padding:  EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Secondpage(),));
                            },
                            child: Ink(
                              width: 200,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                               color: Colors.pink,
                              ),
                              child: Center(
                                child: Text('Get Started ->',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 3,
                child:
                Center(
                  child: Container(
                    child: Image.network('assets/image4.jpg',
                    fit: BoxFit.fill,
                    ),
                  ),
                ),),
            ],
          ),
        ),
      ),
    );
  }
}

