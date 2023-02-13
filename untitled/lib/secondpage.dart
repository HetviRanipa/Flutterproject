
import 'package:flutter/material.dart';
import 'package:untitled/detail.dart';
import 'package:untitled/detail2.dart';
import 'package:untitled/detail3.dart';

import 'detail1.dart';

class Secondpage extends StatefulWidget{
  List<String> imgList = [
    "black bag",
    "black pant",
    "black tshirt",
    "warm jacket",
  ];

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  get imgList => null;


  @override
  void initState(){
    _tabController = TabController(length: 6, vsync: this,initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }
_handleTabSelection(){
    if(_tabController.indexIsChanging){
      setState(() {

      });
    }
}

@override
void dispose(){

    _tabController.dispose();
    super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xfff6f6f6),
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Color(0xff8275b3),
          onPressed: (){},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              height: 50,
              width: 50,
              child: PhysicalShape(
                color: Colors.white,
                shadowColor: Colors.black,
                elevation: 3,
                clipper: ShapeBorderClipper(shape: CircleBorder(),),
                child: Icon(Icons.shopping_bag_outlined,color: Colors.black,),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Create Your style',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  ),
                ],
              ),
            ],
          ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TabBar(
              controller: _tabController,
              labelColor: Color(0xFFE57734),
              unselectedLabelColor: Colors.black.withOpacity(0.5),
              isScrollable: true,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 3,
                  color: Color(0xFFE57734),
                ),
                insets: EdgeInsets.symmetric(horizontal: 35),
              ),
              labelStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
              ),
              labelPadding: EdgeInsets.symmetric(horizontal: 35),
              tabs: [
                Tab(text: "t-shirt",),
                Tab(text: "Dress",),
                Tab(text: "Bag",),
                Tab(text: "Trouser",),
                Tab(text: 'jeans',),
              ],),
          ),

          SizedBox(height: 10),
          Center(child: [
            Container(color: Colors.red,),
            Container(color: Colors.red,),
            Container(color: Colors.red,),
            Container(color: Colors.red,),
            Container(color: Colors.red,),
          ][_tabController.index],),
          const SizedBox(height: 32,),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: ClipRRect(borderRadius:BorderRadius.circular(10),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Detail()));
                              },
                              child: Image.network('assets/images/jk.png', fit: BoxFit.cover)),
                        ),),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: ClipRRect(borderRadius:BorderRadius.circular(10),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Detail2()));
                                },
                                child: Image.network('assets/images/img_8.png', fit: BoxFit.cover)),
                          ),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: ClipRRect(borderRadius:BorderRadius.circular(10),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Detail1()));
                                },
                                child: Image.network('assets/images/jacket.png', fit: BoxFit.cover)),
                          ),),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: ClipRRect(borderRadius:BorderRadius.circular(10),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Detail3()));
                              },
                              child: Image.network('assets/images/img_4.png', fit: BoxFit.cover)),
                        ),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 30,
        selectedItemColor: Color(0xFFFD725A),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index){},
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_outlined),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_rounded),label: ''),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: Icon(Icons.search),
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}


